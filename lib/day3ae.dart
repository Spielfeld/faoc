/*
Rucksack 2 Fächer
Gegenstände mussen sortiert werden
Jeder Gegenstandtyp gehört in einen Rucksack
1 Gegenstandstyp pro Rucksack ist falsch
1 Zeile 1 Rucksack
1 Hälfte Fach 1, 2 Hälfte Fach 2
Prioritäten:
a-z 1-26
A-Z 27-52
Buchstaben in beiden Fächern zählen.

*/

class Rucksack {
  String inhalt = "";
  String fach1 = "";
  String fach2 = "";
  
  Rucksack(String inhalt) {
    this.inhalt = inhalt;
    var halflength = this.inhalt.length ~/ 2;
    this.fach1 = this.inhalt.substring(0, halflength);
    this.fach2 = this.inhalt.substring(halflength);
  }

  int findDoubled() {
    String found = "";
    int resultPrio = 0;
    for (var i = 0; i < this.fach1.length; i++) {
      String cur = this.fach1[i];
      if (this.fach2.contains(cur)) {
        if (! found.contains(cur)) {
          found += cur;
          resultPrio += getPriority(cur);
        }
      }
    }
    return resultPrio;
  }

  int getPriority(String letter) {
    String prio = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return prio.indexOf(letter) + 1;
  }
}

int Day3aae(String input) {
  List<String> all = input.trim().split("\n");
  int result = 0;
  for (var i = 0; i < all.length; i++) {
    Rucksack cur = Rucksack(all[i].trim());
    result += cur.findDoubled();
  }
  return result;
}
