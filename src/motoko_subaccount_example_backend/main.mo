import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat64 "mo:base/Nat64";

actor Main {
  public func natTo32Bytes(n : Nat) : async [Nat8] {
    let bytes = Array.init<Nat8>(32, 0);
    var remaining = Nat64.fromNat(n);

    var i = 0;
    while (i < 32) {
      let byte = Nat8.fromNat(Nat64.toNat(remaining & 255));
      bytes[31 - i] := byte;
      remaining >>= 8;
      i += 1;
    };

    Array.freeze(bytes);
  };
};
