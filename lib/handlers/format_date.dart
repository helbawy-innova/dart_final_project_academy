
DateTime formatDate(String date) {
  var re = RegExp(
    r'^'
    r'(?<year>[0-9]{4,})'
    r'-'
    r'(?<month>[0-9]{1,2})'
    r'-'
    r'(?<day>[0-9]{1,2})'
    r'$',
  );

  var match = re.firstMatch(date);
  if (match == null) {
    throw FormatException('Unrecognized date format');
  }

  var dateTime4 = DateTime(
    int.parse(match.namedGroup('day')!), 
    int.parse(match.namedGroup('month')!),
    int.parse(match.namedGroup('year')!),
  );
  return dateTime4;
}
