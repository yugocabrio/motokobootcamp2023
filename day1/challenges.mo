import Nat "mo:base/Nat";
actor {
  // var message : Text = "0";

  public func multiply(n : Nat, m : Nat) : async Nat {
    return n*m;
  };
}