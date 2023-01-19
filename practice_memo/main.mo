import Text "mo:base/Text";
import Char "mo:base/Char";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

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


}