import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Int "mo:base/Int";

actor {
  // Challenge_1
  public func multiply(n : Nat, m : Nat) : async Nat {
    return n*m;
  };

  // Challenge_2
  public func volume(n: Nat) : async Nat{
    return n**3;
  };

  // Challenge_3
  public func hours_to_minutes(n : Nat) : async Nat {
    return n*60;
  };

  // Challenge_4
  var counter : Nat = 0; 
  public func set_counter(n : Nat) : async () {
    counter := n;
    return
  };

  public query func get_counter() : async Nat {
    return counter;
  }; 

  // Challenge_5
  public func test_divide(n : Nat, m : Nat) : async Bool {
    if (m % n == 0) {
      return true;
    };
    return false;
  };

  // Challenge_6
  public func is_even(n : Nat) : async Bool {
    if (n % 2 == 0) {
      return true;
    };
    return false;
  };

  // lecture2_homeworks

  // homework_1
  // type Hash = Nat32
  // let hash : (b : Blob) -> Nat32

  // homework_3
  public func sqrt(x : Int, y : Int) : async Float{
    return Float.sqrt(Float.add(Float.fromInt(x * y), 10.3));
  };
}