import List "mo:base/List";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";

actor {
    // 1.Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
    // リストを受け取って、重複しているものを削除する 
    // func toIter<A>(xs : List<A>) : Iter.Iter<A>
    // Create an iterator from a list.
    // List.find : func find<T>(l : List<T>, f : T -> Bool) : ?T
    // Return the first element for which the given predicate f is true, if such an element exists.
    // mutable(var)だからpublicにできないのかな？freezeにするには？
    type List<T> = List.List<T>;

    func unique<T>(l : List<T>,  equal: (T, T) -> Bool) : List<T> {
        var noDuplicates = List.nil<T>();
        for (val in List.toIter<T>(l)) {
            switch (List.find<T>(noDuplicates, func v = equal(v, val))) {
                case(Null) {
                    noDuplicates := List.push<T>(val, noDuplicates);
                };
                case(_) ();
            };
        };
        return noDuplicates; 
    };

    // 2.Write a function reverse that takes l of type List and returns the reversed list.
    // リストの反転化
    // Array.reverse : func reverse<X>(array : [X]) : [X]
    // Creates a new array by reversing the order of elements in array.
    func reverse<T>(l : List<T>) : List<T> {
        let array = List.toArray<T>(l);
        let reversed = Array.reverse<T>(array);

        var reversedList = List.nil<T>();
        for (el in Iter.fromArray<T>(reversed)) {
            reversedList := List.push<T>(el, reversedList);
        };
        return reversedList;
    };

    // Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    // func isAnonymous(p : Principal) : Bool
    public shared ({caller}) func is_anynomous() : async Bool {
        return Principal.isAnonymous(caller);
    };

    // Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, 
    // and returns the optional index of the first occurrence of "val" in "buf".
    func find_in_buffer<T>(buf: Buffer.Buffer<T>, val: T, equal: (T, T) -> Bool) : ?Nat {
        return Buffer.indexOf<T>(val, buf, equal);
    };

    // Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    // HashMap : func entries() : Iter.Iter<(K, V)>
    
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
        usernames.put(caller, name);
    } ;

    public query func get_usernames() : async [(Principal, Text)] {
        return (Iter.toArray(usernames.entries()));
    };

};