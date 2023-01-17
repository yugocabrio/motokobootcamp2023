## How much is the current memory capacity of a canister?
- Heap - 4GB
- Stable - 48GB
## What is the issue with the following code sample?
1. let → ver
2. declare Type of return
```
actor {
  var counter : Nat = 0;
  public func increment_counter() : async Nat {
    counter := counter + 1;
    return counter;
  };
}
```
## What is the issue with the following code sample?
1. remove query from change_message
2. declare Type in change_message and output(message)
```
import Text "mo:base/Text";
actor {
  var message : Text = "0";

  public func change_message(new_message : Text) : async Text {
    message := new_message;
    return(message);
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}
````
## False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
False