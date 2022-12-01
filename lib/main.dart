
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// void main() => runApp(const DayOverview());
void main() {
  runApp(const DayOverview());
}

class DayOverview extends StatelessWidget {
  const DayOverview({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Advent Of Code 2022';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text('Day 1: Calorie Counting'),
                subtitle: Day01(),
                isThreeLine: false,
                // dense: true,
                enabled: true,
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Day 02'),
                subtitle: Text('@@@@@#@@@@@#@@####@@@@@@@@@@@@@@@##@@@@@@@#@@#@@@'),
                isThreeLine: false,
                // dense: true,
                enabled: false,
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Day 01'),
                subtitle: Text('#@@@#@@###@@#@@@@#@@#@@##@#@@@#@@@@@#@@#@#@@@#@##'),
                isThreeLine: false,
                // dense: true,
                enabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Day01 extends StatefulWidget {
  const Day01({super.key});

  @override
  State<Day01> createState() => _Day01State();

}

class _Day01State extends State<Day01> {

  var rresult = [];
  var elves = [];

  var largestCalories=0;
  var threeLargest=0;

  void loadAsset() async {
    String loadedString = await rootBundle.loadString('assets/day01a');
    List<String> result = loadedString.split('\n');

    // rresult = result.map(int.parse).toList();
    // print(rresult);
    // List<int> intresult = result.map(int.parse).toList();
    // _result = intresult[1];

    var calories = 0;

    for(var i=0; i<result.length;i++){
      if (result[i].isNotEmpty) {
        rresult.add(int.parse(result[i]));
        calories += int.parse(result[i]);
      }
      else {
        elves.add(calories);
        calories = 0;
      }
    }
  // print(result);
  // print(rresult);
  // print(elves);

    elves.sort();
    largestCalories = elves.last;
    threeLargest = elves[elves.length-1] + elves[elves.length-2] + elves[elves.length-3];
    print(elves);
    print(threeLargest);
  }

  @override
  Widget build(BuildContext context) {
    loadAsset();
    // var largestCalories=0;
    // for (var e in elves) {
    //   if (e>largestCalories) {largestCalories=e;}
    // }
    // elves.sort();
    // print(elves.first);
    // print(elves);
    return Text('a) $largestCalories b) $threeLargest');
  }

}




// #@@@#@@###@@#@@@@#@@#@@##@#@@@#@@@@@#@@#@#@@@#@##
// @@@@@#@@@@@#@@####@@@@@@@@@@@@@@@##@@@@@@@#@@#@@@
// @@#@@##@@#@@@@#@@@@@@@#@@#@@#@##@@@@#@@#@@@#@#@@@
// #@@@#@@@@@#@@@@@@@@@#@#@@@@@#@@#@#@@@@@@@@@@##@@@
// @@@@#@@@@@@#@#@@@#@@@@@#@#@#@##@#@@@##@####@#@@@#
// @@@###@@##@@#@@@@@@@@###@#@@@###@#@@#@@@##@@###@@
// #@#@@#@@@@@@@##@#@##@@@####@#@@##@@###@@@@#@@@@@#
// #@@#@#@@@##@@@##@@#@@@@@@@@@@@@#@@@#@@@@@@@@###@@
// @##@@#@@#@@@@@@@@@@@@#@@##@@@@@@@#@###@@@@##@@@@@
// @###@@@@@@@@@##@@###@@@##@@@@@#@@#@@##@@@@@#@#@@@
// ##@##@#@@@@@@#@@@#@#@@@#@@@@@@@#@@@#@###@@#@#@@@@
// @##@##@@##@@@@@#@@@#@#@@@#@#@@@@##@@@@@@@##@@@@##
// @@@@#@@@@@#@@@#@#@@@@@#@@@@##@@@@@@@@#@@##@@@##@@
// @#@@@@@@####@@#@@##@@@#@@@@@#@@@@@@@@@@@@@@@##@@#
// @##@@@@@@@#@@#@@#@@#@#@@#@@@@###@@@#@@@@#@@@@@@@@
// #@@@@@#@@@@@@@#@@@@@@#@#@@@@#@@@@@##|@@@@##@#@@##
// @@@@@@@@@@#@@@@@#@#@@#@@@@@##@#@@#@@@@###@#@##@#@
// #@@#@@@@#@@@#@@@@#@@@@@@@#@###@#@@@@@@#@@@@@#@@@@
// ###@@#@#@@@@#@@@@#@#@@#@@@@@##@#@@@@@@@#@@#@@@@@#
// @@#@@@@###@@@@@@#@@@@@#@#@#@@@@@@#@@#@###@##@##@@
// @@@#@@#@@#@#@@@@@@#@##@@###@@#@@@@@#@@@@@##@@#@@@
// @@@#@#@@@##@#@####@@@@@@@#@@@@@#@@@@#@#@@@#@@#@##
// @@@@@@#@@#@@@#@@#@##@@#@#@@@@#@#@@@@@@@@@@@@@#@@#
// #@#@#@#@@@##@@##@@#@@@@@@@#@@@@##@@##|@#@@@#@@#@@
// #@@@#@@@@@@@#@@@@@#@@###@##@@@#@@##@#@@@@@#@@@@#@