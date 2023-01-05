import Debug "mo:base/Debug";
// We are currently learning Motoko language by Internet Computer, an alternative approach to Ethereum framework which consumes a lot of hardware for even the smallest operation ever.

// actor is like a class. Initializes a cannister. A cannister is a hardware configuration made out of a small portion of the hardware resources available all over the internet to run your blockchain DApp.

actor DBank {
  var currentVal = 300;
  currentVal := 100;

  // let keyword works kind of like const in js. It doesn't allow reassignment. 
  let id = 5599853415533;
  // id := 87888878745; Operation not allowed.


  // By default, print() expects a string, here Text, variable.
  Debug.print("Hello, World!");

  // To display other variable types we use debug_show()
  Debug.print(debug_show(currentVal));
  Debug.print(debug_show(id));

}