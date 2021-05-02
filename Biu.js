class Observable {
    constructor(_subscribe) {
        this._subscribe = _subscribe
    }

    subscribe(onNext, onFinish) {
        console.assert(isState(onNext) || util.type(onNext) === "Function", "onNext type error ")
        if (isState(onNext)) {
            return this._subscribe((...args)=>{onNext.set(...args)}, util.noop)
        }
        else {
            return this._subscribe(onNext, onFinish)
        }
    }

    run() {
        return this.subscribe(util.noop)
    }
}

class State extends Observable {
    constructor(data) {
        this.observers = {}
        this.stopped = false
        this._subscribe = (onNext, onFinish) => {
            return this.subscribe(onNext, onFinish)
        }
    }

    v(...args) {
        return vofk(args, this._value)
    }

    get (...args) {
        let keyArr = args
        return this.map(v=>{
            if (vofk(keyArr, v) !== undefined) {
                return vofk(keyArr, this._value)
            }
        }).filter(v=>{
            return v !== undefined
        })
    }

    getMap (f) {
        return this.get().map(f)
    }

    any (...args) {
        let keyArr = args
        keyArr.forEach((v,i) => {
            if (!util.isTable(v)) {
                if (util.type(v) === "String") {
                    keyArr[i] = [v]
                }
                else {
                    keyArr[i] = util.split(v, '.')
                }
            }
        });
        return this.get().select(v=>{
            let hadOne = false  
            keyArr.forEach((keys, i) => {
                if (vofk(keys,v) !== undefined) {
                    hadOne = true
                }
            });
            return hadOne
        }).map(v=>{
            let ret = []
            keyArr.forEach((keys, i) => {
                ret.push(vofk(keys, this._value))
            });
            return ret
        }).unpack()
    }

    set (data, ...args) {
        let nextData = data
        let all = {}
        let hash = {}

        getAllOB(data, all)

        util.loopKes(all).forEach(([v,k]) => {
            let arr = k.split(',')
            arr.forEach((v,i) => {
                let testReq = /__NUM(\d+)/.exec(v)
                if (testReq !== null) {
                    arr[i] = parseInt(testReq[1])
                }
            });
            if (hash[k] && util.type(hash[k]) === "Function") {
                hash[k]()
            }
            hash[k] = v.map(v=>{
                let ret
                for (let index = arr.length-1; index >= 0; index--) {
                    let key = arr[index]
                    ret = util.type(key) === "Number" ? [] : {}
                    ret[key] = v
                    v =ret
                }
                return ret
            }).subscribe(this)
        });

        this._value = combinData(data, this._value)

        if (nextData !== undefined) {
            if (!this.stopped) {
                let allKey = util.keys(this.observers)
                allKey.sort((order1, order2)=>{
                    return parseInt(order1) > parseInt(order2)
                })

                allKey.forEach((order, i) => {
                    let orderArr = this.observers[order]
                    orderArr.reverse().forEach(v=>{
                        v[1](nextData, ...args)
                    })
                });
            }
        }
    }

    finish (...args) {
        if (!this.stopped) {
            let allKey = util.keys(this.observers)
            allKey.sort((order1, order2)=>{
                return parseInt(order1) > parseInt(order2)
            })

            allKey.forEach((order, i) => {
                let orderArr = this.observers[order]
                orderArr.reverse().forEach(v=>{
                    v[2](nextData, ...args)
                })
            });

            this.stopped = true
        }
    }

    onCompleted (...args) {
        return this.finish(...args)
    }

    order(order) {
        return new Observable((onNext, onFinish)=>{
            return this.subscribe(onNext, onFinish, order)
        })
    }

    subscribe(onNext, onFinish, order) {
        if (onNext === undefined) {
            onNext = util.noop
        }
        if (onFinish === undefined) {
            onFinish = util.noop
        }

        order = order === undefined ? 1 : order
        let orderArr = this.observers["" + order]
        if (orderArr === undefined) {
            orderArr = []
            this.observers["" + order] = orderArr
        }

        let newNext, newFinish
        if (isState(onNext)) {
            newNext = (...args)=>{
                onNext.set(...args)
            }
            newFinish = util.noop
        }
        else {
            newNext = onNext
            newFinish = onFinish
        }
        orderArr.push([newNext, newFinish])
        let subscription = ()=>{
            for (let index = orderArr.length-1; index >=0; index--) {
                if (orderArr[index][0] === newNext && orderArr[index][1] === newFinish) {
                    orderArr.splice(index,1)
                    return
                }
            }
        }
        if (this._value !== undefined) {
            newNext(this._value)
        }
        return subscription
    }
}

let getAllOB = (data, result, key)=>{
    if (!util.isTable(data)) return

    util.loopKes(data).forEach(([v,k]) => {
        k = util.type(k) === "Number" ? "__NUM" + k : k
        let newK = key !== undefined ? key + ',' + k : k
        if (isObservable(v)) {
            result[newK] = v
        }
        else if (util.isTable(v) && !isNode(v)) {
            getAllOB(v, result, newK)
        }
        
    });
}

let isObservable = (obj)=>{
    return obj instanceof Observable
}

let isState = (obj)=>{
    return obj instanceof State
}

let vofk = (keyArr, v, index) =>{
    index = index || 1
    if (keyArr.length >= index) {
        let k = keyArr[index-1]
        let nextV
        if (!util.isTable(v)) {
            return undefined
        }
        else if (isObservable(v)) {
            let args = []
            keyArr.slice(index-1).forEach(key => {
                args.push(key)
            });
            return v.get(...args)
        }
        else {
            nextV = v[k]
            return vofk(keyArr, nextV, index+1)
        }
    }
    else
        return v
}

let isNode = v=>{
    return v instanceof HFLNode
}

let combinData = (to, from)=>{
    if (to === undefined)
        return from

    if (!util.isTable(to) || isObservable(to) || isNode(to)) {
        return to
    }
    else {
        return undefined
    }

    let newTo = util.type(to) === "Object" ? {} : []
    util.loopKes(to).forEach(([v,k])=>{
        if (!isObservable(v)) {
            newTo[k] = v
        }
    })

    if (!util.isTable(from) || isObservable(from) || isNode(from)) {
        util.loopKes(newTo).forEach(([v,k])=>{
            if (v === "_delete") {
                util.del(newTo, k)
            }
        })
        return newTo
    }

    let minDeleteNumber
    util.loopKes(from).forEach((v,k) => {
        if (util.type(k) === "Number") {
            if (newTo[k] !== "_delete") {
                if (minDeleteNumber && k > minDeleteNumber) {
                    util.del(newTo, k)
                }
                else {
                    newTo[k] = combinData(newTo[k], v)
                }
            }
            else {
                if (minDeleteNumber === undefined) {
                    minDeleteNumber = k
                }
                else {
                    minDeleteNumber = Math.min(minDeleteNumber, k)
                }
                util.del(newTo, k)
            }
        }
        else {
            if (newTo[k] !== "_delete") {
                newTo[k] = combinData(newTo[k], v)
            }
            else {
                util.del(newTo, k)
            }
        }
    });
    return newTo
}

let prototypeOB = Observable.prototype
util.loopKes(op).forEach(([v,k])=>{
    prototypeOB[k] = function (...args) {
        args.forEach((elm, i)=>{
            if (isObservable(elm)) {
                args[i] = elm._subscribe
            }
        })
        let f = v(...args)
        if (k === "value") {
            let ret
            f(this._subscribe)(v=>{ret=v})
            if (ret.firstNoK && ret.data.length === 1) {
                return ret.data[0]
            }
            else
                return ret.data
        }
        else {
            return Biu.createOB(f(self._subscribe))
        }
    }
})

class Biu {
    constructor() {

    }

    static isObservable(...args) {
        return isObservable(...args)
    }

    static isState (...args) {
        return isState(...args)
    }

    static diff(...args) {
        return util.diff(...args)
    }

    static createOB(f) {
        return new Observable(f)
    }

    static createState(data) {
        let state =  new State(data)
        if (isObservable(data)) {
            data.subscribe(state)
        }
        else {
            state.set(data)
        }
        return state
    }

    static of = (...args)=>{
        return new Observable((onNext, onFinish)=>{
            args.forEach(v => {
                onNext(v)
            });
            onFinish()
        })
    }

    static fromArr = (v)=>{
        return new Observable((onNext, onFinish)=>{
            v.forEach((vv, i) => {
                onNext(vv, i+1)
            });
            onFinish()
        })
    }

    static fromObj = (v)=>{
        return new Observable((onNext, onFinish)=>{
            util.keys(v).forEach(key=>{
                onNext(v[key], key)
            })
            onFinish()
        })
    }

    static fromRange = (from, to)=>{
        return new Observable((onNext, onFinish)=>{
            let count = 1
            for (let index = from; index <= to; index++) {
                onNext(index, count) 
                count = count + 1              
            }
            onFinish()
        })
    }

    static promise(f, ...args) {
        return new Observable((onNext, onFinish)=>{
            f(onFinish, ...args)
        })
    }

    static zip (...sources) {
        let count = sources.length
        return new Observable((onNext, onFinish)=>{
            let values = []
            let valuesLen = []
            let active = []
            let subscriptions = []

            for (let index = 0; index < count; index++) {
                valuesLen[index] = 0
                active[index] = true 
                values[index] = [] 
            }

            let newNext = i=>value=>{
                values[i].push(values)
                valuesLen[i] = valuesLen[i] + 1

                let ready = true
                for (let index = 0; index < count; index++) {
                    if (valuesLen[index] === 0) {
                        ready = false
                        break
                    }                    
                }

                if (ready) {
                    let payload = sources.map((v,i)=>{
                        valuesLen[i] = valuesLen[i]-1
                        return values[i].splice(0,1)[0]
                    })
                    onNext(...payload)               
                }
            }

            let newFinish = i=>()=>{
                active[i]=false
                if (active.every(v=>!v) || valuesLen[i] === 0) {
                    return onFinish()
                }
            }

            subscriptions = sources.map((v,i)=>{
                return v.subscribe(newNext(i), newFinish(i))
            })

            return ()=>{
                subscriptions.forEach((v,i)=>{
                    if (util.type(v) === "Function") {
                        v()
                    }
                })
            }
        })
    }

}
