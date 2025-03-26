String getLimitedTags(String tags) {
  if (tags.isEmpty) return "No tags";

  List<String> tagList = tags.split(',');
  List<String> limitedTags = tagList.take(3).toList();
  return limitedTags.join(', ');
}
