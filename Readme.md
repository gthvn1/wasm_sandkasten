# WASM Sandkasten

Let's play with web assembly...

To discover web assembly we will do the [exercism track](https://exercism.org/tracks/wasm).
In this repo we will put some info about how to debug and run code.

## Some notes

### darts as example

- To complile web assembly text file (wat) into binary you need to use `wat2wasm`
  from the (web assembly toolkit)[https://github.com/WebAssembly/wabt].
    - Just run `wat2wasm darts.wat -o darts.wasm`

- To test the easiest way is to create a javascript file to call and execute your wasm
  file. The *package.json* indicates dependency. We are using `pnpm` to manage node
  module. If everything is ok you should be able to run `pnpm test` and see the list
  of scores on the console.

- It is also possible to run the code from your browser. You need to run a webserver that
  will serve the *index.hml*. We are using `php -S localhost:8000`. Into the browser the dev
  tools allow to see the stack and perform debugging. It is quiet cool.
