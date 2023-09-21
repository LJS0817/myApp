enum FAT_TYPE { Lauric, Myristic, Palmitic, Stearic, Palmitoleic,
  Ricinoleic, Oleic, Linoleic, Linolenic, LENGTH }

class Oil {
  String korean = "";
  String english = "";
  double NaOH = 0.0;
  double KOH = 0.0;
  List<double> fat = List.generate(FAT_TYPE.LENGTH.index, (index) => 0);

  Oil({
    required this.korean,
    required this.english,
    required this.NaOH,
    required this.KOH,
    required this.fat,
  });

  double getFat(FAT_TYPE type) {
    return fat.elementAt(type.index);
  }

  @override
  String toString() {
    return "$korean, $english, $NaOH,$KOH, ${fat[0]}, ${fat[1]}, ${fat[2]}, ${fat[3]}, ${fat[4]}, "
        "${fat[5]}, ${fat[6]}, ${fat[7]}, ${fat[8]}";
  }

  String getName() {
    return "$korean ( $english )";
  }
}