import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Option "mo:base/Option";
import Bool "mo:base/Bool";

actor {
  // Char reperesents as ''
  // Charは1文字、複数文字書くとエラー起きる
  let c : Char = 'c'; //99 nat32
  let d : Char = '8'; //56 nat32

  // CharがDigitかどうか確認
  public func check_char() : async Bool {
    return Char.isDigit(c);    
  };
  
  // 引数にCharを指定していても、candidではnat32になる
  // TextからNat32に変換するfunctionを作って、手入力したい。
  // Charのc,dに関してはfunction char2nat32でnat32に変換してる
  public func check_char_variable(text : Char) : async Bool {
    return Char.isDigit(text);
  };

  // Charをnat32で表現する
  public func char2nat32() : async Nat32 {
    return Char.toNat32(d);
  };

  // mo:baseのTextにfromcharがあってもtocharがないので実装
  // returnがarrayのときは、[Char]と書きます
  // Text:a16z Char:(vec {97; 49; 54; 122})
  // Charは1文字づつだからarray構造をとる
  // 大文字小文字でnat32の値は変わる、漢字、絵文字
  // returnのarrayの要素はcharはcandidだとnat32で表される
  // Arrayなんか理由わからないけど、非効率
  public func text2char(t : Text) : async [Char] {
    var array : [Char] = [];
    for(c in t.chars()){
      array := Array.append<Char>(array, [c]);
    };
    return array;
  };

  // Textのサイズの取り方2方式
  // コンパイラから直接取得する方法
  public func watch_size(name2 : Text) : async Nat {
    return name2.size();
  };  
  
  // base-libraryを使う方法
  // 結局これもt.size()を返している
  public func see_size(name : Text) : async Nat {
    return Text.size(name);    
  };

  // equal functionの使い方
  public func see_equal(name : Text, pet : Text) : async Bool {
    return Text.equal(name, pet);    
  };

  // mo:baseのTextにある拡張TypeのPatternを使います。
  // #char c matches the single character sequence, c.
  // #text t matches multi-character text sequence t.
  // char,textなどと一致しているか確認したい場合に用いちる
  // #predicate p matches any single character sequence c satisfying predicate p(c).
  // predicateというのは別の関数って認識
  // type Pattern = Text.Pattern;
  // let p : Pattern = #char('c');
  let p : Text.Pattern = #char('c');
  let p2 : Text.Pattern = #text("oto");
  let p3 : Text.Pattern = #predicate(Char.isDigit);

  let text : Text = "Motoko";
  let text2 : Text = "Bootcamp 2023";

  // func contains(t : Text, p : Pattern) : Bool
  // 第1引数にtext tに第2引数のpattern pが含まれているか否か
  // Text: Bootcamp 2023に Pattern :#char('c')が含まれているかどうか
  public func test() : async Bool {
    return(Text.contains(text2, p));
  };

  // patternのpredicateを試す
  public func test2() : async Bool {
    return(Text.contains(text2, p3));
  };

  // let encodeUtf8 : Text -> Blob
  // Returns the UTF-8 encoding of the given text
  // 普通にblobにエンコードする
  public func text2blob(t : Text) : async Blob {
    return Text.encodeUtf8(t);
  };
  
  // let decodeUtf8 : Blob -> ?Text
  // Tries to decode the given Blob as UTF-8. Returns null if the blob is not valid UTF-8.
  public func blob2text(b : Blob) : async ?Text {
    return Text.decodeUtf8(b);
  };

  // dfx canister call practice_memo test3
  // Iterはloop処理を簡単にできるそ的な
  let i = Iter.range(0,10);
  public func one2ten() : async () {
    for (number in i) {
      Debug.print(debug_show(number));
    };
  };

  let t : Text = "motoko";
  public func motoko_print() : async () {
    for(letter in t.chars()){
      Debug.print(debug_show(letter));
    };
  };

  // IterはArrayとも相性が良いぞ
  // You can also use array.vals() instead of this function.
  let array2 : [Text] = ["Rust", "Motoko", "Typescript", "Python", "C++", "C#"];

  public func languages() : async () {
    for(language in array2.vals()) {
      Debug.print("hello" # language);
    };
  };

  // arrayをIterに変換して、mo:baseのIterを利用してarrayのサイズを求める
  // Debug.printはTextじゃないといけないかもしれない
  let m = Iter.fromArray(array2);
  let n = Iter.size(m);

  public func size_array_via_iter() : async () {
    Debug.print(Nat.toText(n));
  };
  
  // こっちはarrayのデフォルトの.size()でarrayのサイズを取得しています。
  public func size_array() : async () {
    Debug.print(Nat.toText(array2.size()));
  };

  // Optional Type(?)の使い方
  // index +=1;が何かよくわからない
  // name.vals()でname配列からelement取り出してそれが、find_nameの引数と一致しているか。
  let names : [Text] = ["motoko", "Rust", "Javascript", "C"];
  public func find_name(name : Text) : async ?Nat {
    var index : Nat = 0;
    for (programing_language in names.vals()){
      if (programing_language == name){
        return ?index;
      };
      index += 1;
    };
    return null;
  };

  // switch使うとnullの処理しやすいよ
  public func handle_null_value(n : ?Nat) : async Text {
    switch(n) {
      // nがnull確認
      case(null) {
        return("The argument is null");
      };
      case(? something) {
        return("The argument is " # Nat.toText(something));
      };
    };
  };

  // mo:baseのOptionのfunc get<T>(x : ?T, default : T) : T
  // Unwraps an optional value, with a default value, i.e. get(?x, d) = x and get(null, d) = d.
  // Option型をデフォルトにアンラップする
  // この関数は、入力として ?Nat を受け取り、Nat を返します。しかし、"null "を入力すると、デフォルト値である0が返されます。
  public func always_return_a_nut(n : ?Nat) : async Nat {
    return(Option.get(n, 0));
  };

  // generic Typeの説明です。汎用Typeと名付けました。
  //public func is_array_size_even<T>(array : [T]) : async Bool {
  //  let size = array.size();
  //  if (size % 2 == 0) {
  //    return true;
  //  } else {
  //    return false;
  //  };
  //};

  // High Oder functionの例です
  // func find<X>(array : [X], predicate : X -> Bool) : ?X
  // Returns the first value in array for which predicate returns true.
  // If no element satisfies the predicate, returns null.
  // predicateが引数にとる関数のこと
  // let f = func でpredicateを書いています。
    let f = func (n : Nat) : Bool {
      if (n == 10) {
        return true
      } else {
        return false
      };
    };

    public func mystere(array : [Nat]) : async ?Nat {
        return(Array.find<Nat>(array, f));
    };

    // func filter<X>(array : [X], predicate : X -> Bool) : [X]
    // Creates a new array by applying predicate to every element in array,
    // retaining the elements for which predicate returns true.
    // day3の例のコード動きません。謎。割愛。

    // func map<X, Y>(array : [X], f : X -> Y) : [Y]
    // Creates a new array by applying f to each element in array. 
    // f "maps" each element it is applied to of type X to an element of type Y. 
    // Retains original ordering of elements.
    // 配列の各要素にfを適用して、新しい配列を作成。fは新しくできる配列にマップする。
    let h = func (n : Nat) : Nat {
      return(n + 1);
    };

    public func riddle(array : [Nat]) : async [Nat] {
      return(Array.map<Nat, Nat>(array, h));
    };

    
}