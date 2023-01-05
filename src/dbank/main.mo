import Debug "mo:base/Debug";

actor DBank {
  var currentVal = 300;
  currentVal := 100;

  // func keyword is used to make a function.
  // This function increments the current value of the bank.
  // Functions are private by default. Add a keyword "public" to make the function accessible from anywhere.
  public func topUp(amount: Nat) {
    currentVal += amount;

    Debug.print(debug_show(currentVal));
  };

  // to call public functions, use the command `dfx canister call ${canister_name} ${function_name} [(argument1, argument2,...)]`
  // e.g., dfx canister call dbank topUp 


  public func withdraw(amount: Nat) {
    currentVal -= amount;

    Debug.print(debug_show(currentVal));
  }
  /* 
  Running this long command everytime can be tediuos. Using Candid UI instead which reduces the work of typing everything out.
  Follow the steps to use the Candid UI:
  1. Run command `dfx canister id __Candid_UI`
  2. Copy the ID obtained here.
  3. Now go to the browser URL and type https://localhost:8000/?canisterId={your-candid-id}
  4. It gives a UI where it first asks the canister ID running right now. To obtain that id run the command on commandline `dfx canister id`
  5. There you go. Click the call button as many times as you want. Mind the argumenst if there are any.
  */
}
