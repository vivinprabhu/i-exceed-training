class exampleDb {
  static final exampleDb _instance = exampleDb._internal();

  factory exampleDb() => _instance;

  exampleDb._internal();
  Map<String, String> userDatabase = {
    '12345678902': 'abcdeb',
    '12345678903': 'abcdec',
    '12345678904': 'abcded',
    '12345678905': 'abcdee',
    '12345678906': 'abcdef',
    '12345678907': 'abcdeg',
    '12345678908': 'abcdeh',
    '12345678909': 'abcdei',
    '12345678910': 'abcdej',
    '12345678911': 'abcdek',
    '12345678912': 'abcdel',
    '12345678913': 'abcdem',
    '12345678914': 'abcden',
    '12345678915': 'abcdeo',
  };

  Map<double, String> accountNum = {
    12345678902: "akshaya ",
    12345678903: "archana",
    12345678904: "darshini v",
    12345678905: "darshini r",
    12345678906: "jayaprakash",
    12345678907: "kushal",
    12345678908: "likhith",
    12345678909: "likitha",
    12345678910: "nikhil",
    12345678911: "nithya",
    12345678912: "rasika",
    12345678913: "ruchitha",
    12345678914: "sanjay",
    12345678915: "vivin",
  };
  Map<String, Map<String, String>> userData = {
    'akshaya': {'password': 'Abcd@123', 'nickname': 'aksh'},
    'archana': {'password': 'Abcd@123', 'nickname': 'achu'},
    'darshini v': {'password': 'Abcd@123', 'nickname': 'darshu'},
    'darshini r': {'password': 'Abcd@123', 'nickname': 'darshu'},
    'jayaprakash': {'password': 'Abcd@123', 'nickname': 'jp'},
    'kushal': {'password': 'Abcd@123', 'nickname': 'kk'},
    'likhith': {'password': 'Abcd@123', 'nickname': 'virat'},
    'likitha': {'password': 'Abcd@123', 'nickname': 'liki'},
    'nikhil': {'password': 'Abcd@123', 'nickname': 'nik'},
    'nithya': {'password': 'Abcd@123', 'nickname': 'nithi'},
    'rasika': {'password': 'Abcd@123', 'nickname': 'rasi'},
    'ruchitha': {'password': 'Abcd@123', 'nickname': 'ruchi'},
    'sanjay': {'password': 'Abcd@123', 'nickname': 'sanju'},
    'vivin': {'password': 'Abcd@123', 'nickname': 'prabhu'},
  };
  Map<String, String> getReverseUserDatabase() {
    return {for (var entry in userDatabase.entries) entry.value: entry.key};
  }
}