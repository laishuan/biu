op = {}
let curry = f=>(...args)=>(observerable)=>{
    return f(observerable, ...args)
}

let compose = (f1, f2)=>observerable=>{
    return f2(f1(observerable))
}

let createOBf = f=>(onNext, onFinish)=>{
    let isFinish = false
    let newNext = (...args)=>{
        if (!isFinish) {onNext(...args)}
    }
    let newFinish = (...args)=>{
        isFinish = true
        if (onFinish) onFinish(...args)
    }
    return f(newNext, newFinish)
}

op.next = f=>observerable=>createOBf((onNext, onFinish)=>observerable(util.noop, (...args)=>{
        createOBf((innerOnNext, innerOnFinish)=>{
            f(innerOnFinish, ...args)
        })(util.noop, onFinish)
    })
)
op.dump = prefix=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
        prefix = prefix || ""
        util.dump(args, "op_dump_next:"+prefix)
        onNext(...args)
    }, (...args)=>{
        util.dump(args, "op_dump_finish:"+prefix)
        onFinish(...args)

    })
)
op.print = prefix=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
        prefix = prefix || ""
        console.log(prefix + "_next", ...args)
        onNext(...args)
    }, (...args)=>{
        console.log(prefix + "_finish", ...args)
        onFinish(...args)

    })
)
op.tap = f=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
        f(...args)
        onNext(...args)
    },onFinish)
)

op.unpack = ()=>observerable=>createOBf((onNext, onFinish)=>observerable(args=>{
    onNext(...args)
},onFinish))

op.pip = (...args)=>{
    let f = util.identity
    return observerable=>{
        args.forEach((v)=>{
            f=compose(f, v)
        })
        return f(observerable)
    }
}
op.map = f=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
        let otherArgs = args.slice(1)
        onNext(f(...args), ...otherArgs)
    }, onFinish)
)

op.select = f=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
    if (f(...args)) onNext(...args)
},onFinish)
)

op.filter=op.select

op.reject = f=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
    if (!f(...args)) onNext(...args)
},onFinish)
)

op.reduce =(f,state)=>observerable=>createOBf((onNext, onFinish)=>{
    let first = true
    return observerable((...args)=>{
        if (first) {
            if (state !== undefined) {
                state = f(state, ...args)
            }
            else
                state = args[0]
            first = false 
        }
        else {
            state = f(state, ...args)
        }
    }, (...args)=>{
        onNext(state)
        onFinish(...args)
    })
})
op.scan = (f,state)=>observerable=>createOBf((onNext, onFinish)=>{
    let first = true
    return observerable((...args)=>{
        if (first) {
            if (state !== undefined) {
                state = f(state, ...args)
            }
            else
                state = args[0]
            first = false 
        }
        else {
            state = f(state, ...args)
        }
        onNext(state, args[1])
    }, onFinish)
})
op.reverse = ()=>observerable=>createOBf((onNext, onFinish)=>{
    let arr = []
    return observerable((...args)=>{
        arr.push(args)
    }, (...args)=>{
        arr.reverse().forEach((v,i)=>{
            onNext(v, i+1)
        })
        onFinish(...args)
    })
})
op.findIndex = f=>observerable=>createOBf((onNext, onFinish)=>{
    let index = -1
    let newFinish = (...args)=>{
        onNext(index)
        onFinish(...args)
    }
    return observerable((...args)=>{
        if (index < 0 && f(...args)) {
            index = args[1]
        }
    }, newFinish)
})
op.findValue = value=>observerable=>createOBf((onNext, onFinish)=>{
    let isFind = false
    let newFinish = (...args)=>{
        onNext(isFind)
        onFinish(...args)
    }
    return observerable((...args)=>{
        if (!isFind && value === args[0]) isFind = true
    }, newFinish)
})

op.all = f=>observerable=>createOBf((onNext, onFinish)=>{
    let value = true
    let newFinish = (...args)=>{
        onNext(value)
        onFinish(...args)
    }
    return observerable((...args)=>{
        if (value && !f(...args)) value = false
    }, newFinish)
})

op.groupBy = f=>observerable=>createOBf((onNext, onFinish)=>{
    let _t = {}
    let newFinish = (...args)=>{
        onNext(_t)
        onFinish(...args)
    }
    return observerable((...args)=>{
        let [v,k] = args
        let _key = f(v,k)
        if (_key !== undefined) {
            if (_t[_key]) _t[_key].push(v)
            else _t[_key]=[v]
        }
    }, newFinish)
})

op.countBy = f=>observerable=>createOBf((onNext, onFinish)=>{
    let _t = {}
    let newFinish = (...args)=>{
        onNext(_t)
        onFinish(...args)
    }
    return observerable((...args)=>{
        let [v,i] = args
        let _key = f(v,k)
        if (_key) {
            _t[_key] = (_t[_key] || 0) + 1
        }
    }, newFinish)
})

op.max = ()=>op.reduce((state, v)=>Math.max(state,v))

op.min = ()=>op.reduce((state, v)=>Math.min(state,v))

op.sum = ()=>op.reduce((x,y)=>x+y, 0)

op.value = ()=>{
    let first = true
    let value = {"firstNoK": false}
    return op.reduce((state, v, k)=>{
        if (first) {
            value.firstNoK = (k==undefined)
            first = false
        }
        let data = value.data
        if (data === undefined) {
            if (k === undefined || util.type(k) === "Number") data = []
            else data = {}
        }
        value.data = data
        if (util.type(data) === "Object") data[k] = v
        else if (util.type(data) === "Array") data.push(v)
        return value
    }, value)
}

op.sample = sampler=>observerable=>createOBf((onNext, onFinish)=>{
    let values
    let stop1 = observerable((...args)=>{
        values = args
    }, util.noop)

    let stop2 = sampler((...args)=>{
        if (values !== undefined) {
            onNext(...values)
        }
    }, onFinish)

    return () => {
        if (stap1) stop1()
        if (stap2) stop2()
    }
})

op.flatten = f=>observerable=>createOBf((onNext, onFinish)=>{
    let subscriptions = []
    let remaining = 1
    let newFinish = (...args)=>{
        remaining = remaining - 1
        if (remaining === 0) {
            onFinish(...args)
        }
    }
    observerable((v)=>{
        subscriptions.push(v((...args)=>{
            remaining = remaining + 1
            onNext(...args)
        }, util.noop))
    }, newFinish)

    return ()=>{
        subscriptions.forEach((v)=>{
            v()
        })
    }
})

op.flatMap = f=>op.pip(op.map(f), op.flatten())

op.switch = ()=>observerable=>createOBf((onNext, onFinish)=>{
    let innerSubscription
    let switchOB = (source)=>{
        if (innerSubscription !== undefined)
            innerSubscription()
        innerSubscription = source(onNext)
    } 
    let subscription = observerable(switchOB, onFinish)
    return ()=>{
        if (innerSubscription) innerSubscription()
        if (subscription) subscription()
    }
})

op.take = n=>observerable=>createOBf((onNext, onFinish)=>{
    n = n || 1
    if (n<=0) {
        onFinish()
        return
    }
    let i = 1
    return observerable((...args)=>{
        onNext(...args)
        i = i + 1
        if (i > n) {
            onFinish()
        }
    },onFinish)
})

op.skip = n=>observerable=>createOBf((onNext, onFinish)=>{
    n = n || 1
    let i = 1
    return observerable((...args)=>{
        if (i>n) 
            onNext(...args)
        else
            i = i + 1
    },onFinish)
})

op.get = (k, ...args)=>{
    let getOne = (kk, first)=>observerable=>createOBf((onNext,onFinish)=>observerable((t)=>{
        if (!util.isTable(t)) onNext(undefined)
        else if (first) {
            let v = first ? t : undefined
            if (kk !== undefined) {
                let realKK = util.type(kk) === "Number" ? kk-1 : kk
                v = t[realKK]
            }
            onNext(v)
        }
    }, onFinish))
    let arr = [getOne(k, true)]
    args.forEach((v,i)=>{
        arr.push(getOne(v))
    })
    arr.push(op.select((v)=>{
        return v !== undefined
    }))

    return op.pip(...arr)
}

op.pluck = op.get

op.first = ()=>op.take(1)

op.buffer = size=>observerable=>createOBf((onNext, onFinish)=>{
    if (!size || util.type(size) !== "Number") {console.assert(false, "expect a number")}
    let buffer = []
    let emit = ()=>{
        if (buffer.length > 0) {
            onNext(...buffer)
            buffer = []
        }
    }

    let newNext = (...args)=>{
        args.forEach((v,i)=>{
            buffer.push(v)
            if (buffer.length >= size) {
                emit()
            }
        })
    }

    let newFinish = (...args)=>{
        emit()
        onFinish(...args)
    }
    return observerable(newNext,newFinish)
})

op.join = (...sources)=>observerable=>createOBf((onNext, onFinish)=>{
    sources.unshift(observerable)
    let latest = []
    let pending = sources.map((v)=>true)
    let completed = []
    let subscription = []

    let newNext = (i)=>value=>{
        latest[i]=value
        pending[i]=false
        if (pending.every((v,i)=>!v)) {
            onNext(...latest)
        }
    }
    
    let newFinish = (i)=>(...args)=>{
        completed.push(i)
        if (completed.length === sources.length)
            onFinish(...args)
    }

    sources.forEach((v,i)=>{
        subscription.push(sources[i](newNext(i), newFinish(i)))
    })

    return ()=>{
        subscription.forEach((v)=>{
            v()
        })
    }
})

op.change = comparator=>observerable=>createOBf((onNext, onFinish)=>{
    comparator = comparator || util.eq
    let first = true
    let currentValue = undefined

    let newNext = (value, ...args)=>{
        let isEqual = comparator(value, currentValue)
        currentValue = value
        if (first || !isEqual) {
            onNext(value, ...args)
            first = false
        }
    }
    return observerable(newNext, onFinish)
})

op.tp = tp=>observerable=>createOBf((onNext, onFinish)=>{
    return observerable((...args)=>{
        if (args[0] === tp) {
            args.shift()
            return onNext(...args)
        }
    }, onFinish)
})

op.changeFrom = v=>{
    let lastAndCur = op.window(2)
    return op.pip(lastAndCur, op.filter((v1,v2)=>{
        if (util.type(v) === "Function")
            return v(v1)
        else 
            return v1 === v
    }))
}

op.changeTo = v=>{
    if (util.type(v) !== "Function") {
        return op.pip(op.change(), op.select((vv)=>vv==v))
    }
    else return op.pip(op.change(), op.select(v))
}

op.flatMapLatest = callback=>observerable=>createOBf((onNext, onFinish)=>{
    callback = callback || util.identity
    let innerSubscription

    let subscribeInner = (...args)=>{
        if (innerSubscription)
            innerSubscriptionI()
        innerSubscription = callback(...args)(onNext)
    }

    let subscription = observerable(subscribeInner, onFinish)

    return ()=>{
        if (innerSubscription) innerSubscription()
        if (subscription) subscription()
    }
})

op.merge = (...sources)=>observerable=>createOBf((onNext, onFinish)=>{
    sources.unshift(observerable)
    let completed = []
    let subscription = []
    
    let newFinish = (i)=>(...args)=>{
        completed.push(i)
        if (completed.length === sources.length)
            onFinish(...args)
    }

    sources.forEach((v,i)=>{
        subscription.push(sources[i](onNext, newFinish(i)))
    })

    return ()=>{
        subscription.forEach((v)=>{
            v()
        })
    }
})

op.window = size=>observerable=>createOBf((onNext, onFinish)=>{
    if (size === undefined || util.type(size) !== "Number") {console.assert(false, "expect a number")}
    let window = []
    let newNext = value=>{
        window.push(value)
        if (window.length >= size) {
            onNext(...window)
            window.shift()
        }
    }
    return observerable(newNext, onFinish)
})

op.with = (...sources)=>observerable=>createOBf((onNext, onFinish)=>{
    let latest = []
    let subscription = []
    let setLatest = i=>value=>{
        latest[i] = value
    }
    let newNext = value=>onNext(value, ...latest)

    sources.forEach((v,i)=>{
        subscription.push(v(setLatest(i), util.noop))
    })

    subscription.push(observerable(newNext, onFinish)) 
    return ()=>{
        subscription.forEach(v=>{if(v) v()})
    }
})

op.startWith = (...args)=>observerable=>createOBf((onNext, onFinish)=>{
    onNext(...args)
    return observerable(onNext, onFinish)
})

op.push = v=>observerable=>createOBf((onNext, onFinish)=>{
    let count = 0
    let newOnNext = (...args)=>{
        count = count + 1
        onNext(...args)
    }
    let newFinish = (...args)=>{
        onNext(v, count+1)
        onFinish(...args)
    }
    return observerable(newOnNext, newFinish)
})

op.concat = (other, ...others)=>{
    let concatOne = o=>observerable=>createOBf((onNext, onFinish)=>observerable(util.noop, (...args)=>{
            return o(util.noop, onFinish)
        })
    )
    let arr = [concatOne(other)]
    others.forEach((v,i)=>{
        arr.push(concatOne(v))
    })
    return op.pip(...arr)
}