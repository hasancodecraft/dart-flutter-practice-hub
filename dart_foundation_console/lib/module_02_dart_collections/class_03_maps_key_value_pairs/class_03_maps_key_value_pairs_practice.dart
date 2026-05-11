main(){

  Map<String, dynamic> homeTown = {
    'hometown': 'Bagura',
    'liveIn': 'dhaka',
  };

  Map<String, dynamic> moreInfo = {
    'hobby': 'gurdaning and doing programming',
    'surname': 'Hasan',
  };

  Map<String, dynamic> profileInfo = {
    'name': 'Hasan',
    'age': 21,
    ...homeTown,
    'moreinfo': moreInfo,
    'ending' : {
      'greetings':'goodBye',
    },
  };
  print(profileInfo);
  print(profileInfo.keys);
  print(profileInfo.values);

  profileInfo['ending']['greetings'] = 'GoodBye';
  print(profileInfo['ending']['greetings']);

  profileInfo['age'] = 24;
  print(profileInfo);

  profileInfo.forEach((key,value){
    print("$key: $value");
  });
  
  print('All Entries: ${profileInfo.entries}');

}