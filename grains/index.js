import fs from 'fs'

const grainswasm = fs.readFileSync('./grains.wasm');

const grains = await WebAssembly.instantiate(new Uint8Array(grainswasm)).
                    then(res => res.instance.exports);

console.log("square of 0 should be 0, it is " + grains.square(0))
console.log("square of 1 should be 1, it is " + grains.square(1))
console.log("square of 2 should be 2, it is " + grains.square(2))
console.log("square of 3 should be 4, it is " + grains.square(3))
console.log("square of 4 should be 8, it is " + grains.square(4))
console.log("square of 16 should be 32768, it is " + grains.square(16))
console.log("square of 63 should be ??, it is " + grains.square(63))
console.log("square of 64 should be 9223372036854775808, it is " + grains.square(64))
console.log("square of 65 should be 0, it is " + grains.square(65))

console.log("64 square total is " + grains.total())
