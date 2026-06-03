// Singleton practice using factory constructor
// Goal: Always return the same AppTheme object instead of creating new objects.
// hashCode is used to check whether multiple variables refer to the same object.
//Important: 2 types: named, unnamed
 import 'factory_constructor_debug.dart';
 void main(){
  AppTheme theme = AppTheme();
  print('Home Screen: (${theme.hashCode})');
  print('Background Color : ${theme.backgroundColor}');
  print('Text color: ${theme.textColor}');

  // Calling AppTheme() looks like creating a new object,
  // but the factory constructor returns the same saved instance.
  AppTheme settingsTheme = AppTheme();
  print('\nStteings: (${settingsTheme.hashCode})');
  print('Background Color : ${settingsTheme.backgroundColor}');
  print('Text color: ${settingsTheme.textColor}');
  settingsTheme.backgroundColor = 'Black';
  settingsTheme.textColor = 'White';
  print('Background Color : ${settingsTheme.backgroundColor}');
  print('Text color: ${settingsTheme.textColor}');

  AppTheme profileTheme = AppTheme();
  print('\nProfile: (${profileTheme.hashCode})');
  print('Background Color : ${profileTheme.backgroundColor}');
  print('Text color: ${profileTheme.textColor}');
 }