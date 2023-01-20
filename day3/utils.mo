import Int "mo:base/Int";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
module {
    // 1. create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    // Array.sort: func sort<X>(array : [X], compare : (X, X) -> Order.Order) : [X]
    // 大きさ順に並び替える
    public func second_maximum(array : [Int]) : Int {
        let sorted = Array.sort(array, Int.compare);
        return sorted[1];
    };

    // 2. create a function called remove_even that takes an array [Nat] and
    // returns a new array with only the odd numbers from the original array.
    // func filter<X>(array : [X], predicate : X -> Bool) : [X]
    // Creates a new array by applying predicate to every element in array, retaining the elements for which predicate returns true.
    // 配列内のelementをpredicateに適用させて結果から新しい配列を作成する
    public func remove_even(array : [Nat]) : [Nat] {
        let evenElements = Array.filter<Nat>(array, func x = x % 2 == 1);
        return evenElements;
    };

    // 3. write a function drop that takes 2 parameters: an array [T] and a Nat n. 
    // This function will drop the n first elements of the array and returns the remainder.
    // func split<X>(buffer : Buffer<X>, index : Nat) : (Buffer<X>, Buffer<X>)
    // バッファをindexで2つのバッファに分割します。左のバッファにはindexより小さいインデックスを持つすべての要素が含まれ、
    // 右のバッファにはindexより大きいインデックスを持つすべての要素が含まれます。indexが範囲外の場合はトラップします。
    // candidに出そうと思うとpublicとasyncが必要になる
    // drop関数はそれができない。shared typeが関係している？
    // day2の説明、mutable（可変）はprivate。immutable（不変）はpbulic。
    // shared type is public field of an actor, you can however make it public in a module

    public func drop<T>(xs : [T], n : Nat) : [T] {
        let buffer = Buffer.fromArray<T>(xs);
        let (first, second) = Buffer.split<T>(buffer, n);
        return Buffer.toArray<T>(second);
    };   
}