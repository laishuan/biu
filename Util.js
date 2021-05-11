util = {}
let print = console.log
let type = (t) => {
    let str =  Object.prototype.toString.call(t)
    let arr = /\[object (\w+)\]/.exec(str)
    return arr[1]
}

let isTable = (t) => {
    let tp = type(t)
    return tp === "Array" || tp === "Object"
}

let loopKes = (t)=>{
    console.assert(isTable(t), "t must be object or array")
    let keys = util.keys(t)
    return keys.map((k)=>{
        let kk = type(k) === "Number" ? k-1 : k
        let vv = t[kk]
        return [vv, kk]
    })
}

let del = (t, k)=>{
    console.assert(isTable(t), "t must be object or array")
    if (type(t) === "Array") {
        t.splice(k,1)
    }
    else {
        delete t[k]
    }
}
util.isTable = isTable
util.type = type
util.loopKes = loopKes
util.del = del
util.eq = (x,y)=>{return x===y}
util.noop = ()=>{}
util.identity = x=>x
util.constant = x=>()=>x
util.keys = obj=> {
    let keys = Object.keys(obj)
    if (type(obj) === "Array") {
        return keys.map((v)=>parseInt(v)+1)
    }
    return keys
}
util.split =(str, c)=>str.split(c)

let rptChar = (c, times)=>{
    if (times<=0) return ""
    return c + rptChar(c, times-1)
}
util.toStr = (v, deep) => {
    deep = deep === undefined ? 0 : deep
    if (!isTable(v)) {
        return v.toString()
    }
    else {
        let str = "{\n"
        let keys = util.keys(v)
        keys.forEach((k, i)=>{
            let vv = type(k) === "Number" ? v[k-1] : v[k]
            str = str + rptChar('\t', deep+1) + k + ":" + util.toStr(vv, deep+1) + "\n"
        })
        str = str + rptChar('\t', deep) + "}\n"
        return str
    }
}

util.diff = (t1, t2)=>{
    if (!isTable(t1) || !isTable(t2))
        return
    if (type(t1) !== type(t2))
        return
    let ret
    let getRet = (k)=>{
        ret = ret || (type(k) === "Number" ? [] : {})
        return ret
    }
    loopKes(t1).forEach(([v,k])=>{
        // print (v, k)
        let v2 = t2[k]
        if (type(v) !== type(v2)) {
            if (v2 !== undefined) {
                getRet(k)[k] = v2
            }
            else {
                getRet(k)[k] = "_delete"
            }
        }
        else if (isTable(v)) {
            let curDiff = util.diff(v, v2)
            if (curDiff !== undefined) {
                getRet(k)[k] = curDiff
            }
        }
        else if (v !== v2) {
            getRet(k)[k] = v2
        }
    })

    loopKes(t2).forEach(([v, k])=>{
        if (t1[k] === undefined) {
            getRet(k)[k] = v
        }
    })

    return ret
}

util.dump = (t, prefix, deep) => {
    if (prefix) {
        console.log(prefix, util.toStr(t, deep))
    }
    else
        console.log(util.toStr(t))
}
// console.log(util.toStr({"a":{"b":[1,2,3], "ddd": 123}}))
// console.log(util.keys([123123,1,1,1,1]))
// util.dump(loopKes({"a":1, "b":2}), "test loopKeys")
// let diff = util.diff(
//     {"a":{"b":[1,11,3], "ddd": 123, "e": 1}}, 
//     {"a":{"b":[1,2,3], "ddd": 1123}}, 
    // [1, 2],[2]
    // {"a":1}, {"a": 2}
// )
// print(diff)
// util.dump(diff, "test dump")
