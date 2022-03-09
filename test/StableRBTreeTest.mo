import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import I "mo:base/Iter";
import List "mo:base/List";
import RBT "../src/StableRBTree";

let sorted =
  [
    (1, "reformer"),
    (2, "helper"),
    (3, "achiever"),
    (4, "individualist"),
    (5, "investigator"),
    (6, "loyalist"),
    (7, "enthusiast"),
    (8, "challenger"),
    (9, "peacemaker"),
  ];

let unsort =
  [
    (6, "loyalist"),
    (3, "achiever"),
    (9, "peacemaker"),
    (1, "reformer"),
    (4, "individualist"),
    (2, "helper"),
    (8, "challenger"),
    (5, "investigator"),
    (7, "enthusiast"),
  ];

// var t = RBT.init<Nat, Text>(Nat.compare);
var t = RBT.init<Nat, Text>();

assert RBT.size(RBT.share(t)) == 0;

for ((num, lab) in unsort.vals()) {
  Debug.print (Nat.toText num);
  Debug.print lab;
  t := RBT.put<Nat, Text>(t, Nat.compare, num, lab);
};

do { var i = 1;
for ((num, lab) in RBT.entries(t)) {
  assert(num == i);
 i += 1;
}};

assert RBT.size(RBT.share(t)) == 9;

do { var i = 9;
for ((num, lab) in RBT.entriesRev(t)) {
  assert(num == i);
  i -= 1;
}};

assert RBT.size(RBT.share(t)) == 9;

t := RBT.delete<Nat, Text>(t, Nat.compare, 5);

assert RBT.size(RBT.share(t)) == 8;