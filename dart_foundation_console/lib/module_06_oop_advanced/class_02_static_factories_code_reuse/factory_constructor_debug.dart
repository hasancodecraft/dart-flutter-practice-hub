// AppTheme is designed as a singleton class.
// Singleton means only one object of this class will be used in the whole program.

class AppTheme{

//step 1: Private constructor
// Private constructor prevents direct object creation from outside this class.
 AppTheme._();
 
// step 2 Static instance (class level Promote)
// Static instance belongs to the class, not to any object.
// This stores the single shared AppTheme object.
static final AppTheme _instance = AppTheme._();

//step 3 Factory
// Factory constructor controls object creation.
// It always returns the same _instance instead of creating a new object.
factory AppTheme(){
    return _instance;
}

String backgroundColor = 'white';
String textColor = 'black';
}