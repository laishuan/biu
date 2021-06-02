console.log("123123123 test")

let awards = Biu.createState([{_visible:false},{_visible:false},{_visible:false}])

let props = Biu.createState({award:awards.get(1)})

let index = Biu.createState(1)

let awardProps = Biu.createState(props.get("award"))
let p = awardProps.map(v=>{
	return [v]
})

p.subscribe(()=>{
	index.set(2)
})
p.join(index).subscribe((...args)=>{
	console.log("join-------")
	console.log(args)
})


console.log('start set awards')
awards.set({1:{meta:1, type:1, count:1, _visible:true}})