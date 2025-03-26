String getFlagImagePath(String area) {
  String formattedArea = area.toLowerCase();

  Map<String, String> specialCases = {
    "italian": "italy",
    "american": "american",
    "british": "british",
    "canadian": "canadian",
    "chinese": "chinese",
    "croatian": "croatian",
    "dutch": "dutch",
    "egyptian": "egyptian",
    "filipino": "filipino",
    "french": "french",
    "greek": "greek",
    "indian": "indian",
    "irish": "irish",
    "jamaican": "jamaican",
    "japanese": "japanese",
    "kenyan": "kenyan",
    "malaysian": "malaysian",
    "mexican": "mexican",
    "moroccan": "moroccan",
    "polish": "polish",
    "portuguese": "portuguese",
    "russian": "russian",
    "spanish": "spanish",
    "tunisian": "tunisian",
    "turkish": "turkish",
    "ukrainian": "ukrainian",
  };

  String fileName = specialCases[formattedArea] ?? formattedArea;

  return "assets/icons/flags/$fileName.png";
}
