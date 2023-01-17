import Nat "mo:base/Nat";

actor {
  // Challenge_1
  public func multiply(n : Nat, m : Nat) : async Nat {
    return n*m;
  };

  // Challenge_2
  public func volume(n: Nat) : async Nat{
    return n**3;
  };

  public func hours_to_minutes(n : Nat) : async Nat {
    return n*60;
  } 
}