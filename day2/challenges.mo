import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

actor {
    // 1
    // .size() （多分valsも？） is actually not defined in the base library,
    // but comes directly from the compiler.
    public func average_array(array : [Int]) : async Int {
        var sum : Int = 0;
        for (i in array.vals()) {  // array.vals
            sum := sum + i;
        };
        return sum / array.size(); // array.size
    };

    // 2
    // candidではcharではなくnat32になる
    // Characters (of type Char) are mapped to their Unicode scalar as a nat32.
    // Decoding a nat32 that is not a valid Unicode scalar fails.
    public func count_character(t : Text, c : Char) : async Nat {
        var count : Nat = 0;
        for (i in t.chars()) { // t.chars
            if (i == c) {
                count := count + 1; 
            };
        };
        return count;
    };

    // 3
    public func factorial(n :Nat) : async Nat {
        var result : Nat = 1; //階乗!なので1ね
        let iter = Iter.range(1, n);
        for (i in iter) {
            result := result * i;
        };
        return result;
    };

    // 4
    public func number_of_words(t : Text) : async Nat {
    let words = Text.split(t, #char ' ');
    return Iter.size<Text>(words);
    };

    // 5
    public func find_duplicates(a : [Nat]) : async [Nat] {
        var duplicates : [Nat] = [];
        for (elem1 in a.vals()) {
            for (elem2 in a.vals()) {
                if (elem1 == elem2) {
                    duplicates := Array.append<Nat>(duplicates, [elem1]);
            };
        };
    };
    return duplicates; 
    };

    // 6
    public func convert_to_binary(n : Nat) : async Text {
    var number : Nat = n;
    var remain : Nat = 0;
    var string : Text = "";
    while (number > 0) {
      remain := number % 2;
      string := string # Nat.toText(remain);
      number := number / 2;      
    };
    return string;
  }; 
}