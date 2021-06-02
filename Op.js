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
        f = f || util.noop
        f(...args)
        onNext(...args)
    },onFinish)
)

op.unpack = ()=>observerable=>createOBf((onNext, onFinish)=>observerable(args=>{
    onNext(...args)
},onFinish))

op.breakup = ()=>observerable=>createOBf((onNext, onFinish)=>observerable(t=>{
    util.loopKeys(t).forEach(([v,k])=>{
        if (util.type(k) === "Number")
            onNext(v,k+1)
        else
            onNext(v,k)
    })
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

op.array = f=>observerable=>{
    let count = 0
    return createOBf((onNext, onFinish)=>observerable((...args)=>{
          count = count + 1
          onNext(args[0], count)  
    },onFinish)
    )
}

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
        arr.push(args[0])
    }, (...args)=>{
        arr.reverse().forEach((v,i)=>{
            onNext(v, i+1)
        })
        onFinish(...args)
    })
})

op.sort = f=>observerable=>createOBf((onNext, onFinish)=>{
    let arr = []
    return observerable((...args)=>{
        arr.push(args[0])
    }, (...args)=>{
        arr.sort(f).forEach((v,i)=>{
            onNext(v, i+1)
        })
        onFinish(...args)
    })
})

op.shuffle = f=>observerable=>createOBf((onNext, onFinish)=>{
    let arr = []
    return observerable((...args)=>{
        arr.push(args[0])
    }, (...args)=>{
        let _shuffled=[]
        arr.forEach((v,i)=>{
            let randPos = Math.floor(Math.random()*i)
            _shuffled[i] = _shuffled[randPos]
            _shuffled[randPos] = v
        })
        _shuffled.forEach((v,i)=>{
            onNext(v, i+1)
        })
        onFinish(...args)
    })
})

op.slice = (from, to)=>op.pip(op.skip(from-1), op.take(to-from+1), op.array())

op.splice = (start, count, ...args)=>observerable=>{
    let last = op.skip(start+count-1)(observerable)
    let arr = [op.take(start-1)]
    args.forEach(v=>arr.push(op.push(v)))
    arr.push(op.concat(last))
    arr.push(op.array())
    return op.pip(...arr)(observerable)
}

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
        let _key = f(v,i)
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
        if (stop1) stop1()
        if (stop2) stop2()
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
        innerSubscription = source(onNext, util.noop)
    } 
    let subscription = observerable(switchOB, onFinish)
    return ()=>{
        if (innerSubscription) innerSubscription()
        if (subscription) subscription()
    }
})

op.take = n=>observerable=>createOBf((onNext, onFinish)=>{
    n = n === undefined ? 1 : n
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
    n = n === undefined ? 1 : n
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
        else  {
            let v = first ? t : undefined
            if (kk !== undefined) {
                let realKK = util.type(kk) === "Number" ? kk-1 : kk
                v = t[realKK]
            }
            onNext(v)
        }

    }, onFinish))
    let arr = [getOne(k, true)]
    args.forEach(v=>arr.push(getOne(v)))
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
    let newSource = [observerable]
    newSource = newSource.concat(sources)
    let latest = []
    let pending  = newSource.map((v)=>true)
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
        if (completed.length === newSource.length)
            onFinish(...args)
    }

    newSource.forEach((v,i)=>{
        subscription.push(newSource[i](newNext(i), newFinish(i)))
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

op.tp = tp=>observerable=>createOBf((onNext, onFinish)=>observerable((...args)=>{
        if (args[0] === tp) {
            let others = args.slice(1)
            return onNext(...others)
        }
    }, onFinish))

op.takeArgs = n=>observerable=>createOBf((onNext,onFinish)=>observerable((v, ...args)=>{
    onNext(...args.slice(0,n))
}, onFinish))

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
            innerSubscription()
        innerSubscription = callback(...args)(onNext, util.noop)
    }

    let subscription = observerable(subscribeInner, onFinish)

    return ()=>{
        if (innerSubscription) innerSubscription()
        if (subscription) subscription()
    }
})

op.merge = (...sources)=>observerable=>createOBf((onNext, onFinish)=>{
    let newSource = [observerable]
    newSource = newSource.concat(sources)
    let completed = []
    let subscription = []
    
    let newFinish = (i)=>(...args)=>{
        completed.push(i)
        if (completed.length === newSource.length)
            onFinish(...args)
    }

    newSource.forEach((v,i)=>{
        subscription.push(newSource[i](onNext, newFinish(i)))
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
    let concatOne = o=>observerable=>createOBf((onNext, onFinish)=>observerable(onNext, (...args)=>{
            return o(onNext, onFinish)
        })
    )
    let arr = [concatOne(other)]
    others.forEach((v,i)=>{
        arr.push(concatOne(v))
    })
    return op.pip(...arr)
}

op.wait = (other, ...others)=>{
    let waitOne = o=>observerable=>createOBf((onNext, onFinish)=>o(onNext, (...args)=>{
            return observerable(onNext, onFinish)
        })
    )
    let arr = [waitOne(other)]
    others.forEach((v,i)=>{
        arr.push(waitOne(v))
    })
    return op.pip(...arr)
}

let of = (...args)=>{
    return (onNext, onFinish)=>{
        util.loopKeys(args).forEach(([v,i])=>{
            onNext(v, i+1)
        })
        onFinish()
    }
}

// op.pip(
//     op.map(v=>v+2), 
//     // op.select(v=>v>4),
//     op.reject(v=>v>6),
//     // op.reduce((a,b)=>a+b),
//     op.scan((a,b)=>a+b),
//     // op.dump("test dump: ")
//     // op.print('123--test print')
//     // op.tap((...args)=>{console.log("tap here: ", ...args)})
// )(of(3,4,5))(console.log)

// op.map(v=>v+1)(of(3,4,5))(console.log)

// op.pip(
//     op.unpack(), 
//     op.dump('test unpack: ')
//     // op.print('123--test print')
//     // op.tap((...args)=>{console.log("tap here: ", ...args)})
// )(of([1,2,322]))(util.noop)

// op.sort((a,b)=>a-b)(of(3,4,1,5))(console.log)

// op.shuffle()(of(3,4,1,5,12,333,1123))(console.log)

// op.reverse()(of(3,4,1,5,12,333,1123))(console.log)

// op.breakup()(of([3,4,1,5,12,333,1123]))(console.log)
// op.breakup()(of({"a":1, "b":2, "c": 3}))(console.log)

// op.findIndex(v=>v===3323)(of(3,4,1,5,12,333,1123))(console.log)
// op.findValue(333)(of(3,4,1,5,12,333,1123))(console.log)
// op.all(v=>v>0)(of(-3,4,1,5,12,333,1123))(console.log)
// op.skip(1)(of(-3,4,1,5,12,333,1123))(console.log)
// op.take(3)(of(-3,4,1,5,12,333,1123))(console.log)
// op.slice(3,4)(of(-3,4,1,5,12,333,1123))(console.log)

// op.pip(
//     op.slice(3,7), 
//     op.value()
// )
// (of(1,2,3,444,4112,1))(console.log)

// op.pip(
//     op.groupBy(v=>{
//         if (v>3) return "more3"
//         else return "less3"
//     }), 
//     op.value()
// )
// (of(1,2,3,444,4112,1))(console.log)

// op.pip(
//     op.countBy(v=>{
//         if (v>3) return "more3"
//         else return "less3"
//     }), 
//     op.value()
// )
// (of(1,2,3,444,4112,1))(console.log)

// op.max()(of(-3,4,1,5,12,333,1123))(console.log)
// op.min()(of(-3,4,1,5,12,333,1123))(console.log)
// op.sum()(of(-3,4,1,5,12,333,1123))(console.log)

// op.get("a", "c")(of({"a":{"b": 1}}))(console.log)


// op.sample(of(1))(of(-3,4,1,5,12,333,1123))(console.log)

// op.flatten()(of(of(1), of(3,4), of(2)))(console.log)
// op.flatMap(v=>of(v,v,v))(of(1,2,3))(console.log)
// op.switch()(of(of(1), of(3,4), of(2)))(console.log)
// 
// op.first()(of(-3,4,1,5,12,333,1123))(console.log)
// op.buffer(3)(of(-3,4,1,5,12,333,1123))(console.log)

// op.join(of(1))(of(-3,4,1,5,12,333,1123))(console.log)

// op.change()(of(-3,1,1,5,12,333,1123))(console.log)
// op.tp("sss")(of("aaa", "sss"))(console.log)

// op.pip(
//     op.takeArgs(1),
//     op.buffer(3), 
//     // op.value()
// )
// (of(1,2,3,444,4112,1,1))(console.log)

// op.changeFrom(12)(of(-3,5,1,5,12,333,1123))(console.log)
// op.changeTo(12)(of(-3,5,1,5,12,333,1123))(console.log)
// op.flatMapLatest(v=>of(v,v,v))(of(1,2,3))(console.log)

// op.merge(of(11), of(22), of(33))(of(1,2,3))(console.log)

// op.window(3)(of(-3,5,1,5,12,333,1123))(console.log)
// op.with(of(11), of(22), of(33))(of(1,2,3))(console.log)
// op.startWith(12, 1)(of(-3,5,1,5,12,333,1123))(console.log)

// op.pip(
//     op.startWith(12),
//     op.selectArr(util.constant(true)), 
//     // op.value()
// )
// (of(1,2,3,444,4112,1,1))(console.log)


// op.pip(
//     op.push(12),
//     op.selectArr(util.constant(true)), 
//     // op.value()
// )
// (of(1,2,3,444,4112,1,1))(console.log)

// op.concat(of(11,12), of(22), of(33))(of(1,2,3))(console.log)
// op.wait(of(11), of(22), of(33))(of(1,2,3))(console.log)

