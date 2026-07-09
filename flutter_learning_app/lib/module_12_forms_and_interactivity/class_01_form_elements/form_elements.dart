import 'package:flutter/material.dart';

class Module12Class1 extends StatelessWidget {
  const Module12Class1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // GlobalKey<FormState> creates a special key for the Form widget.
    // This key connects with the Form below through: key: formKey.
    // Using this key, we can access the current state/control of the Form.
    // FormState means the current control object of the Form.
    // Later, formKey.currentState is used to run Form methods like validate().
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          // Connects this Form widget with formKey.
          // Now this Form can be controlled by formKey.currentState.
          key: formKey,

          // Form groups multiple TextFormField widgets together.
          // This helps us validate all input fields at once.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("log in here", style: TextStyle(
                fontSize: 25,
                color: Colors.blue[400]
              ),),
          
              SizedBox(height: 30,),
          
          
              // TextFormField is like TextField, but it supports validation.
              // It is normally used inside a Form widget.
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Enter Phone Number",
                  hintText: "Phone Number",
                  helperText: "Phone Number...",
                  prefixIcon: Icon(Icons.phone),

                  // suffix shows a widget at the end area of the input.
                  // Here it shows a green check icon.
                  suffix: Icon(Icons.check_circle, color: Colors.green,),

                  // filled: true allows the TextFormField background to have a fill color.
                  filled: true,

                  // fillColor sets the background color of the input field.
                  fillColor:Colors.grey.shade200,
          
                  // enabledBorder controls the border when the field is not focused.
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green
                    )),

                    // focusedBorder controls the border when the user clicks/taps inside the field.
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),

                    // border gives the default outline border style for the field.
                    // It is used as a fallback/default border style.
                    border: OutlineInputBorder(),  
                ),

                // validator checks whether the input value is valid or not.
                // It runs when formKey.currentState!.validate() is called.
                validator:(value){

                  // value can be null or empty, so we check both.
                  // If it is null or empty, an error message will show under the field.
                  if(value == null || value.isEmpty){
                    return "Please enter phone number";

                  // Phone number must be exactly 11 characters in this condition.
                  // If it is not 11, another error message will show.
                  } else if(value.length != 11){
                    return "Please enter correct phone number";

                  } else {
                    // Returning null means there is no validation error.
                    // So this field is valid.
                    return null;
                  }
                } ,

              ),
          
              SizedBox(height: 15,),
          
              // Second TextFormField for password input.
              // This field also has validation because it is inside Form.
              TextFormField(
                controller: passwordController,

                // obscureText hides the typed characters.
                // It is used for password fields.
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your Password",
                  helperText: "Password...",
                  prefixIcon: Icon(Icons.lock),

                  // Shows an eye icon at the end of the input.
                  // This icon is only displayed now; it is not clickable yet.
                  suffix: Icon(Icons.remove_red_eye, color: Colors.green,),

                  // Enables background fill color for this field.
                  filled: true,

                  // Sets the background color of the password field.
                  fillColor:Colors.grey.shade200,
          
                  // Border when the password field is not focused.
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green
                    ),),
                    
                    // Border when the password field is focused/clicked.
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      )
                    ),  
                    
                    // Default outline border style for the password field.
                    border: OutlineInputBorder(),
                ),
                

               // Validator for password field.
               // This function returns an error message if password is invalid.
               // It returns null if password is valid.
               validator:(value){

                  // Checks empty password.
                  if(value == null || value.isEmpty){
                    return "Please enter password";

                  // Checks password length.
                  // If password has less than 6 characters, it shows an error.
                  } else if(value.length < 6){
                    return "Password must be greater than 6 characters";

                  } else {
                    // Returning null means no error for this password field.
                    return null;
                  }
                } ,
              ),
              
            
              SizedBox(height: 15,),
            
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue,
                    foregroundColor: Colors.white
                 ),

                  // onPressed runs when the Submit button is clicked.
                  onPressed: (){

                    // formKey.currentState gets the current state/control of the connected Form.
                    // The ! means: I am sure currentState is not null.
                    // validate() runs all TextFormField validator functions inside this Form.
                    // If all validators return null, validate() returns true.
                    // If any validator returns an error message, validate() returns false.
                    if(formKey.currentState!.validate()){

                      // This block runs only when all fields are valid.
                    }
                  }, child: Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }
}