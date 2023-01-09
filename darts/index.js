import fs from 'fs'

const dartswasm = fs.readFileSync('./darts.wasm');

const darts = await WebAssembly.instantiate(new Uint8Array(dartswasm)).
                    then(res => res.instance.exports);

console.log(darts.score(-9, 9))       //.toEqual(0);
console.log(darts.score(0, 10))       //.toEqual(1);
console.log(darts.score(-5, 0))       //.toEqual(5);
console.log(darts.score(0, -1))       //.toEqual(10);
console.log(darts.score(0, 0))        //.toEqual(10);
console.log(darts.score(-0.1, -0.1))  //.toEqual(10);
console.log(darts.score(0.7, 0.7))    //.toEqual(10);
console.log(darts.score(0.8, -0.8))   //.toEqual(5);
console.log(darts.score(-3.5, 3.5))   //.toEqual(5);
console.log(darts.score(-3.6, -3.6))  //.toEqual(1);
console.log(darts.score(-7.0, 7.0))   //.toEqual(1);
console.log(darts.score(7.1, -7.1))   //.toEqual(0);
console.log(darts.score(0.5, -4))     //.toEqual(5);

