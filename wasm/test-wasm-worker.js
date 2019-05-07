let ex
let data

onmessage = function(e) {
	var type = e.data.type
	console.log("worker " + type)
	if (type == "init") {
		fetch("test-wasm.wasm") // over 4KB need runs on worker
			.then(response => response.arrayBuffer())
			.then(buffer => WebAssembly.compile(buffer))
			.then(module => {
				let imports = {}
				imports = imports || {}
				imports.env = imports.env || {}
	
				imports.env.printf = arg => console.log( arg )
	
				if( !imports.env.memory )
					imports.env.memory = new WebAssembly.Memory( {
						initial: 256
					} )
	
				if( !imports.env.table )
					imports.env.table = new WebAssembly.Table( {
						initial: 18,
						element: 'anyfunc'
					} )
			
				const asm = new WebAssembly.Instance(module, imports)
				const mem = asm.exports.memory.buffer
				const memoffset = asm.exports.getMemory()
				const memlen = asm.exports.getMemorySize()
				data = new Uint8Array(mem, memoffset, memlen)
				ex = asm.exports
				postMessage({ type: "ready", data: data })
			})
	} else if (type == "exec") {
		if (ex) {
			console.log("begfore")
			console.log(e.data.data)
			const p = e.data.data
			for (let i = 0; i < p.length; i++)
				data[i] = p[i]
			let res = ex.exec()
			console.log("resr " + res)
			postMessage({ type: "done", data: res })
		} else {
			console.log("errer ");
			postMessage({ type: "error", data: null })
		}
	}
}
