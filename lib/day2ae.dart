/*
Stein Papier Schere

Stein > Schere
Schere > Papier
Papier > Stein

AX > CZ
CZ > BY
BY > AX

Stein  A X = 1
Papier B Y = 2
Schere C Z = 3

Rundenergebnis:
Verloren 0
Gleichstand 3
Gewonnen 6

Punkte pro Runde = FormPunkt(1,2,3) + Rundenergebnis(0, 3, 6)

Spieler hat X Y Z
*/

import 'dart:collection';

int Day2aae(String input) {
  List<String> data = input.trim().split("\n");
  int result = 0;
  
  for (int i = 0; i < data.length; i++) {
    String cur = data[i].trim();
    if (cur.length == 0) {
      continue;
    }
    List<String> ab = cur.split(" ");
    String a = ab[0];
    String b = ab[1];
    Map<String, int> points = HashMap();
    // https://api.dart.dev/stable/2.18.5/dart-collection/HashMap-class.html
    points.addAll({
        "A": 1, "X": 1,
        "B": 2, "Y": 2,
        "C": 3, "Z": 3,
        });
    result += points[b] ?? -5000000000000;

    List<List<String>> winner = [
      ["A", "X", "3"],
      ["A", "Y", "6"],
      ["A", "Z", "0"],
      ["B", "X", "0"],
      ["B", "Y", "3"],
      ["B", "Z", "6"],
      ["C", "X", "6"],
      ["C", "Y", "0"],
      ["C", "Z", "3"],
    ];

    for (var i = 0; i < winner.length; i++) {
      var cur = winner[i];
      if (a == cur[0] && b == cur[1]) {
        result += int.parse(cur[2]);
      }
    }
  }
  
  return result;
}

int Day2bae(String input) {
  List<String> data = input.trim().split("\n");
  int result = 0;
  
  for (int i = 0; i < data.length; i++) {
    String cur = data[i].trim();
    if (cur.length == 0) {
      continue;
    }
    List<String> ab = cur.split(" ");
    String a = ab[0];
    String b = ab[1];
    
    List<List<String>> winner = [
      ["A", "X", "0", "3"],
      ["A", "Y", "3", "1"],
      ["A", "Z", "6", "2"],
      ["B", "X", "0", "1"],
      ["B", "Y", "3", "2"],
      ["B", "Z", "6", "3"],
      ["C", "X", "0", "2"],
      ["C", "Y", "3", "3"],
      ["C", "Z", "6", "1"],
    ];

    for (var i = 0; i < winner.length; i++) {
      var cur = winner[i];
      if (a == cur[0] && b == cur[1]) {
        result += int.parse(cur[2]);
        result += int.parse(cur[3]);
      }
    }
  }
  
  return result;
}
