import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

actor {
    // .size() （多分valsも？） is actually not defined in the base library,
    // but comes directly from the compiler.
    public func average_array(array : [Int]) : async Int {
        var sum : Int = 0;
        for (i in array.vals()) {  // array.vals
            sum := sum + i;
        };
        return sum / array.size(); // array.size
    };

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

    public func factorial(n :Nat) : async Nat {
        var result : Nat = 1; //階乗!なので1ね
        let iter = Iter.range(1, n);
        for (i in iter) {
            result := result * i;
        };
        return result;
    };

    public func number_of_words(t : Text) : async Nat {
    let words = Text.split(t, #char ' ');
    return Iter.size<Text>(words); 
};
}