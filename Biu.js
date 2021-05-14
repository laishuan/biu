class Observable {
    constructor(_subscribe) {
        this._subscribe = _subscribe
    }

    subscribe(onNext, onFinish) {
        onFinish = onFinish || util.noop
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
        let _subscribe = (onNext, onFinish) => {
            return this.subscribe(onNext, onFinish)
        }
        super(_subscribe)
        this.observers = {}
        this.stopped = false
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

        util.loopKeys(all).forEach(([v,k]) => {
            let arr = k.split(',')
            arr.forEach((vv,i) => {
                let testReq = /__NUM(\d+)/.exec(vv)
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
                    // return parseInt(order1) - parseInt(order2)
                    return parseInt(order2) - parseInt(order1)
                })

                allKey.forEach((order, i) => {
                    let orderArr = this.observers[order]
                    orderArr.reverse().forEach(v=>{
                        v[0](nextData, ...args)
                    })
                });
            }
        }
    }

    finish (...args) {
        if (!this.stopped) {
            let allKey = util.keys(this.observers)
            allKey.sort((order1, order2)=>{
                // return parseInt(order1) - parseInt(order2)
                return parseInt(order2) - parseInt(order1)
            })

            allKey.forEach((order, i) => {
                let orderArr = this.observers[order]
                orderArr.reverse().forEach(v=>{
                    v[1](...args)
                })
            });

            this.stopped = true
        }
    }

    onCompleted (...args) {
        return this.finish(...args)
    }

    order(order) {
        return Biu.createState(this, order)
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

    util.loopKeys(data).forEach(([v,k]) => {
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
    // return v instanceof HFLNode
    return false
}

let combinData = (to, from)=>{
    if (to === undefined)
        return from

    if (!util.isTable(to) || isObservable(to) || isNode(to)) {
        if (!isObservable(to))
            return to
        else {
            return undefined
        }
    }

    let newTo
    let fromArrToObj = false
    if (util.isTable(to) && util.isTable(from)) {
        let tpFrom = util.type(from)
        let tpTo = util.type(to)
        if (tpFrom === tpTo) {
            newTo = util.type(to) === "Object" ? {} : []
        }
        else if (tpFrom === "Array") {
            fromArrToObj = true
            newTo = []
        }
        else 
            newTo = []
    }
    else
        newTo = util.type(to) === "Object" ? {} : []
    util.loopKeys(to).forEach(([v,k])=>{
        if (!isObservable(v)) {
            if (fromArrToObj) {
                newTo[parseInt(k)-1] = v
            }
            else 
                newTo[k] = v
        }
    })

    if (!util.isTable(from) || isObservable(from) || isNode(from)) {
        util.loopKeys(newTo).forEach(([v,k])=>{
            if (v === "_delete") {
                util.del(newTo, k)
            }
        })
        return newTo
    }

    let minDeleteNumber
    util.loopKeys(from).forEach(([v,k]) => {
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
util.loopKeys(op).forEach(([v,k])=>{
    prototypeOB[k] = function (...args) {
        args.forEach((elm, i)=>{
            if (isObservable(elm)) {
                args[i] = elm._subscribe
            }
            else if (k === "flatMap") {
                args[i] = (...args)=>elm(...args)._subscribe
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
            return Biu.createOB(f(this._subscribe))
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

    static createState(data, order) {
        let state =  new State(data)
        if (isObservable(data)) {
            data.subscribe(state, undefined, order)
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

let state1 = Biu.createState({"a":3, "arr": [1,2,3,4,5,6,7,8,9]})
let state2 = Biu.createState({"b":4})
let state3 = Biu.createState({"c":5, "d": 1})
let state4 = Biu.createState(1)
let state5 = state4.order(11)

// Biu.of(3).map(v=>v+1).subscribe(console.log)

// Biu.of(3,4,5).pip(op.map(v=>v+1), op.select(v=>v>4)).subscribe(console.log)


// console.log(vofk(["a", "b"], {"a":{"b":{"c":1}}}))
// console.log(combinData(["a", "b"], ["2", "3", 5]))
// console.log(combinData({"b":{"4":4}}, {"a":1, "b":[1,2,3]}))
// console.log(combinData({"b":[4,3]}, {"a":1, "b":{"1":1, "2":2}}))

// let result = {}
// getAllOB({"a": 1, "b": Biu.of(3), "c":{"d":{"e":1, "ff":Biu.of(4)}, "gg":[Biu.of(2),3]}}, result)
// console.log(result)

// let state = Biu.createState({"a":1})
// state.get("a").subscribe(console.log)

// state.set({"b":1})
// state.set({"a":"_delete"})
// state.set({"a": [1,2,3]})

// let t = Biu.fromArr([11,22,3,1,123,123])
// .reverse()
// .sort((a,b)=>a-b)
// .shuffle()
// .push(12223)
// .slice(2,5)
// .scan((state, v,i)=>state+v*i)
// .sum()
// .value()
// console.log(t)

// console.log(
//     Biu.fromObj({"a":3, "b":4})
//     .startWith(5,"c")
//     .map((v,k)=>v+1)
//     .value()
// )


// console.log(
//     Biu.fromRange(1,10)
//     .map((v,i)=>[v+1, i])
//     .unpack()
//     .value()
// )

// let obable2 = Biu.createState(3)
// let obable = Biu.of({"e":obable2})

// let state = Biu.createState({"a":1, "b":2, "c":{"d":obable}})
// state.get("c", "d").map(v=>{
//     v.e=v.e+1
//     return v
// }).subscribe(console.log)

// obable2.set(5)

// state.set({"c":{"d":{"f":3}}})

// state.any("a", "b").subscribe(console.log)

// state.set({"a":11})


// state1.merge(state2).dump("test merge").subscribe(console.log)
// state1.with(state2, state3).subscribe(console.log)

// state1.sample(state2).subscribe(console.log)

// state1.join(state2, state3).subscribe(console.log)
// state1.set(1)
// state3.set(21)

// state1.get().subscribe(console.log)
// state1.set({"arr":{"2":"_delete"}, "a":"_delete"})

// state5.subscribe(()=>{
//     console.log("state5")
// })
// state4.order(101).subscribe(()=>{
//     console.log("state4 101")
// })

// state4.order(31).subscribe(()=>{
//     console.log("state4 31")
// })

// state4.set(22)

// let state = Biu.createState()

// state.tp("aaa").subscribe(console.log)
// state.set("aaa", [3], {"a": {"b":332}})


// let state = Biu.createState({"a":1})

// state.flatMap(v=>Biu.fromRange(1,10)).subscribe(console.log)

// let state = Biu.createState(3)
// state.changeFrom(1).tap(console.log).run()
// state.set(1)
// state.set(1)
// state.set(1)
// state.set(2)

// let state = Biu.createState(3)
// state.changeTo(1).tap(console.log).run()
// state.set(1)
// state.set(1)
// state.set(1)
// state.set(2)

// Biu.of(1,2,3).concat(Biu.of(4,5,6), Biu.of(7,8,9)).concat(Biu.of(44,55,66)).subscribe(console.log)

// let state = Biu.createState({"index":3})
// state.order(2).get("index").subscribe(console.log)
// state.set({"index":222})

// let ob = Biu.createState([1,2,3,"_delete"])
// let state = Biu.createState(ob)
// state.get().subscribe(console.log)
// ob.set([2,13,"_delete"])
// ob.set([2,13,"1"])
// ob.set([1,"_delete"])

// let state = Biu.createState(1)
// let a = state.subscribe(console.log)
// state.set(2)
// state.set(3)
// a()
// state.set(4)

// let obPms = Biu.promise(resolve=>resolve({"a":2,"b":2,"c":{"aa":1, "bb":{"aaa":1}}}))
// obPms
// .next((resolve, data)=>{
//     data.a = data.a+1
//     resolve(data)
// })
// .print("after 1")
// .next((resolve, data)=>{
//     data.b = 20
//     resolve(data)
// })
// .print("after 2")
// .next((resolve, data)=>{
//     data.d=data.c
//     data.c={"e":3}
//     resolve(data)
// })
// .print("after 3")
// .run()

// let state11 = Biu.createState(false)
// let temp = state11.map(()=>false)
// let state22 = Biu.createState(1)
// temp.join(state22).subscribe(console.log)
// state22.set(333)

// let state11 = Biu.of(123)
// let state22 = state11.wait(Biu.of(1,2,3))
// state22.subscribe(console.log)

// console.log(Biu.of({"a":1, "b":2, "c":3}).breakup().print("trest").value())

// Biu.of(1,2,3,4,5).buffer(2).subscribe(console.log)