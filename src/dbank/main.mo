import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {

  // Orthogonal Persistence: A data persistence technique which keeps track of the changed states of the program even if the system restarts/crashes.
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
    // By default, when numbers are assigned to variables the variable becomes a Natural number type. But the range of Nat is 0-infinity.
    // Therefore we typecast a variable to Int.
    let tempVal: Int = currentVal - amount;

    if (tempVal >= 0){
      currentVal -= amount;
      Debug.print(debug_show(currentVal));
    } else {
      // Typecasting
      Debug.print(debug_show("Insufficient balance. You only have " # Nat.toText(currentVal) # " crypts in your account."));
    }
  };

  // query keyword makes the retrieval faster, hence quicker results. Functions are either query or update. Update by default.
  public query func checkBalanace () : async Nat {
    // Similar to a get function
    return currentVal;
  };
}
