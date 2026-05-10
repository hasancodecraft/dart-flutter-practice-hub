// Map (Key-Value Pair)
// Key must be unique.
// Values can be duplicated.

void main() {
  
  String name = 'Hasan';

   /// basic structure
  // Map result = {

  //   'name': name,
  //   'age': 10,
  //   'isProgrammingLanguage': true
  // };

  // Declare Map with key and value types
  Map<String, dynamic> result = {
    'name': name,
    'age': 10,
    'isProgrammingLanguage': true,
  };

  // Print full map
  print(result);

  // Print value using key
  print(result['age']);

  // Update value
  result['name'] = 'Md Hasan';
  print(result);

  // Print all keys
  print(result.keys);

  // Print all values
  print(result.values);

  // Print all entries
  print(result.entries);

  // Loop through the map
  result.forEach((key, value) {
    print('$key: $value');
  });

  // Another address map
  Map<String, dynamic> secondaryAddress = {
    'street': 'abc',
    'city': 'sunCity',
    'zip': '54888',
  };

  // Nested Map
  Map<String, dynamic> userProfile = {
    'id': 101,
    'username': 'dart_master',

    'contact': {
      'email': 'hasan@gmail.com',
      'phone': '015415415',
    },

    'address': {
      'street': 'xyz',
      'city': 'darkCity',
      'zip': '12345',
    },

    // Spread Operator
    ...secondaryAddress,

    // Also can be use:
    // 'secondaryAddress': secondaryAddress,
  };

  // Access nested map value
  var userEmail = userProfile['contact']['email'];

  print(userEmail);

  // Print full user profile
  print(userProfile);
}