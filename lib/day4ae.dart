/*
Teil 1

Lager muss aufgeräumt werden.

Jeder Teil hat eine eigene Abschnitts-ID (sectionId)

Elfenpaar (1 Zeile):
2-4,6-8
Elfe 1: 2, 3, 4
Elfe 2: 6, 7, 8

Es gibt Paare da liegt der Bereich von Elfe 1 vollständig in Paar 2 ode r umgekehrt.

Wieviele Elfenpaare sind davon betroffen?

Teil 2

Wo gibt es generell überschneidungen?

*/


class Arbeitsgruppe {
  String raw = "";
  List<int> arbeiter1 = [];
  List<int> arbeiter2 = [];

  Arbeitsgruppe (String lagerzuteilung) {
    this.raw = lagerzuteilung.trim();
    List<String> data = this.raw.split(",");
    this.arbeiter1 = readAssignment(data[0]);
    this.arbeiter2 = readAssignment(data[1]);
  }

  List<int> readAssignment (String sheet) {
    List<String> sheetList = sheet.trim().split("-");
    int lowerSection = int.parse(sheetList[0]);
    int higherSection = int.parse(sheetList[1]);
    List<int> result = [];
    for (int section = lowerSection;
         section <= higherSection;
         section++) {
      result.add(section);
    }
    return result;
  }

  bool pointlessWork () {
    /*
    hat man beispielsweise eine 3 wird
    diese auch in 31,32 gefunden.
    Deswegen die Kommas am Anfang und Ende.
    */
    var a = "," + this.arbeiter1.join(",") + ",";
    var b = "," + this.arbeiter2.join(",") + ",";
    return a.contains(b) || b.contains(a);
  }

  bool somePointlessWork () {
    var a = this.arbeiter1.toSet();
    var b = this.arbeiter2.toSet();
    return a.intersection(b).length > 0;
  }
}


int Day4aae (String input) {
  List<String> all = input.trim().split("\n");
  int countOfPointlessWork = 0;
  for (int i = 0; i < all.length; i++) {
    var cur = Arbeitsgruppe(all[i]);
    if (cur.pointlessWork()) {
      countOfPointlessWork += 1;
    }
  }
  return countOfPointlessWork;
}

int Day4bae (String input) {
  List<String> all = input.trim().split("\n");
  int countOfPointlessWork = 0;
  for (int i = 0; i < all.length; i++) {
    var cur = Arbeitsgruppe(all[i]);
    if (cur.somePointlessWork()) {
      countOfPointlessWork += 1;
    }
  }
  return countOfPointlessWork;
}
