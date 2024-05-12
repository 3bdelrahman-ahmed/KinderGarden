String formatString(String input) {
  List<String> words = input.split(' ');
  List<String> lines = [];
  for (int i = 0; i < words.length; i += 4) {
    lines.add(words.skip(i).take(4).join(' '));
  }
  return lines.join('\n');
}