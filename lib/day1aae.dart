int Day1aae(String input) {
  List<String> data = input.trim().split("\n");
  int maxVal = 0;
  int curVal = 0;
  
  for (int i = 0; i < data.length; i++) {
    String cur = data[i].trim();
    if (cur.length == 0) {
      if (curVal > maxVal) {
        maxVal = curVal;
      }
      curVal = 0;
    } else {
      int curInt = int.parse(cur);
      curVal += curInt;
    }
  }
  if (curVal > maxVal) {
    maxVal = curVal;
  }
  
  return maxVal;
}
