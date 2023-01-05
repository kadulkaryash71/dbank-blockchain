import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

  stable var currentVal: Float = 300;

  stable var startTime = Time.now();

  public func topUp(amount: Float) {
    currentVal += amount;

    Debug.print(debug_show(currentVal));
  };

  public func withdraw(amount: Float) {
    let tempVal: Float = currentVal - amount;

    if (tempVal >= 0){
      currentVal -= amount;
      Debug.print(debug_show(currentVal));
    } else {
      Debug.print(debug_show("Insufficient balance. You only have " # Float.toText(currentVal) # " crypts in your account."));
    }
  };

  public query func checkBalance () : async Float {
    // Similar to a get function
    return currentVal;
  };


  // Compound Interest at RoI = 1% per second
  public func compound () {
    var currentTime = Time.now();
    var timeElapsedNS = currentTime - startTime;
    var timeElapsedPM = timeElapsedNS / 1000000000;

    currentVal := currentVal * (1.01 ** Float.fromInt(timeElapsedPM));
  };
  // Compound Interest at RoI = 1% per minute
  public func compoundPM () {
    var currentTime = Time.now();
    var timeElapsedNS = currentTime - startTime;
    var timeElapsedPM = timeElapsedNS / 60000000000;

    currentVal := currentVal * (1.01 ** Float.fromInt(timeElapsedPM));
  };
}
