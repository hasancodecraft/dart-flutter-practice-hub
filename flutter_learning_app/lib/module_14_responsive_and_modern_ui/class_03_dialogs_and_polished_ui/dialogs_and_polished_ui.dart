import 'package:flutter/material.dart';

class Module14Class3 extends StatefulWidget {
  const Module14Class3({super.key});

  @override
  State<Module14Class3> createState() => _Module14Class3State();
}

class _Module14Class3State extends State<Module14Class3> {

  // This function opens a standard AlertDialog over the current page.
  // A dialog does not replace the current page.
  // It appears as a temporary layer above the existing page.
  void showAlertDialog(){

    // showDialog opens a modal dialog above the current route.
    // While the dialog is open, the user normally cannot interact
    // with the page behind it.
    showDialog(

      // false means tapping outside the dialog will not close it.
      // The user must use a button or Navigator.pop() to close it.
      barrierDismissible: false,

      // context tells Flutter where this dialog should be displayed
      // and which Navigator should manage it.
      context: context,

      // builder creates and returns the widget shown as the dialog.
      // This builder receives its own dialog BuildContext.
      builder: (context)=> AlertDialog(

        // AlertDialog normally contains 3 main sections:
        // title   -> heading of the dialog
        // content -> main message or custom UI
        // actions -> buttons displayed at the bottom
        title: Text("This is title"),

        // content shows the main message inside the AlertDialog.
        content: Text("Are you sure...?"),

        // actions contains the buttons shown at the bottom of the dialog.
        actions: [
          TextButton(
            onPressed: (){

              // The dialog is placed on top of the Navigator stack.
              // Navigator.pop closes the top item, which is this dialog.
              Navigator.pop(context);
            }, 
            child: Text("cancel")),  
          
          ElevatedButton(

            // This button currently has no action
            // because its onPressed callback is empty.
            onPressed: (){}, 
            child: Text("Submit"))

        ],
      ));
  }

  // This function opens a customized AlertDialog.
  // Its content contains multiple widgets such as
  // an icon, heading, and a long warning message.
  void showAlertDialogWithIcon(){
    showDialog(

      // Prevents the dialog from closing
      // when the user taps outside the dialog area.
      barrierDismissible: false,

      // Uses the current page's context
      // to display the dialog above this page.
      context: context, 

      // Returns the AlertDialog that will appear on screen.
      builder: (context)=> AlertDialog(

        // Makes the AlertDialog content vertically scrollable
        // when the content is taller than the available screen height.
        //
        // This is useful here because the warning message is very long.
        // Without scrollable: true, the dialog content may overflow
        // on smaller screens instead of allowing the user to scroll.
        scrollable: true,

        // AlertDialog normally contains 3 main sections:
        // title, content, and actions.
        title: Text("This is title"),

        // The previous simple content Text is kept as practice code.
        // content: Text("Are you sure...?"),

        // AlertDialog content can contain any widget.
        // Here, a Column arranges multiple widgets vertically.
        content: Column(

          // A Column normally tries to take the maximum vertical space.
          // MainAxisSize.min makes it take only the height
          // required by its children.
          //
          // This keeps the dialog content compact instead of
          // unnecessarily occupying all available vertical space.
          mainAxisSize: MainAxisSize.min,

          children: [
          Row(

            // Row places the warning icon and warning text horizontally.
            children: [
              Icon(Icons.warning, color: Colors.red , size: 40,),
              Text("Warning"),
            ], 
          ),

           // Adds vertical space between the warning Row
           // and the detailed warning message below it.
           SizedBox(height: 10,),

          // Displays the detailed warning message.
          // The sentence contains spaces, so Flutter can wrap it
          // automatically into multiple lines.
          //
          // Since the content is very long, scrollable: true above
          // allows the user to scroll through the full message.
          Text("This is an important warning message. Please take a moment to carefully review all the information displayed on this screen before continuing with the next step. Make sure that every detail you have entered is complete, accurate, and up to date. Once you press the Submit button, the system may immediately process your request and save the changes permanently. Some actions may not be reversible, and you may not be able to recover the previous information after the submission is completed. Please check the names, numbers, dates, selected options, uploaded files, and any other important details one more time. If you notice any incorrect or missing information, press the Cancel button, return to the previous screen, and make the necessary corrections before trying again. You should continue only when you are completely confident that all the provided information is correct. By pressing the Submit button, you confirm that you have reviewed the details, understood the possible consequences, and agreed to proceed with this action.",
          style: TextStyle(color: Colors.grey),),


        ],),

        // Buttons displayed at the bottom of the AlertDialog.
        actions: [
          TextButton(
            onPressed: (){

              // Closes the currently visible dialog.
              Navigator.pop(context);
            }, 
            child: Text("cancel")),  
          
          ElevatedButton(

            // This button currently does nothing
            // because its callback is empty.
            onPressed: (){}, 
            child: Text("Submit"))

        ],
      ));
  }

  // This function opens a SimpleDialog.
  // SimpleDialog is commonly used to display
  // a short list of options or simple choices.
  void showSimpleDialog(){

    // showDialog can display different types of dialog widgets.
    // Here, it displays a SimpleDialog instead of an AlertDialog.
    showDialog(
      context: context, 

      // The builder returns the SimpleDialog shown on screen.
      builder: (context)=> SimpleDialog(

        // The heading displayed at the top of the SimpleDialog.
        title: Text("Simple Dialog"),

        // children contains the options or widgets
        // displayed inside the SimpleDialog.
        children: [

          // SimpleDialogOption represents one selectable option.
          // An onPressed callback can be added
          // when the option needs to perform an action.
          SimpleDialogOption(
            child: Text("Option - 1"),
          ),

          // SimpleDialogOption can also contain
          // other widgets instead of only Text.
          // Here, it contains a TextField for user input.
          SimpleDialogOption(
            child: TextField()
          ),
        ],
      ));
  }

  // This function opens a modal bottom sheet
  // from the bottom of the current screen.
  //
  // A bottom sheet is useful for showing actions,
  // filters, menus, or short forms without opening a new page.
  void showBottomSheet(){

    // showModalBottomSheet displays content from the bottom
    // and blocks interaction with the page behind it
    // until the sheet is closed.
    showModalBottomSheet(

      // Uses the current page's context to find the Navigator
      // and display the bottom sheet above this page.
      context: context,

      // builder returns the UI
      // that will be shown inside the bottom sheet.
      builder: (context)=>
      Container(

        // Column places all bottom-sheet widgets vertically.
        child: Column(

          // By default, Column uses MainAxisSize.max
          // and tries to take the maximum available vertical height.
          //
          // MainAxisSize.min makes the Column take only the height
          // required by the heading and the three ListTiles.
          //
          // This keeps the bottom sheet compact
          // instead of making it unnecessarily tall.
          mainAxisSize: MainAxisSize.min,

          children: [

            // Heading shown at the top of the bottom sheet.
            Text("Choose Option", style: TextStyle(fontSize: 18),),

            // ListTile provides a standard row layout
            // for each bottom-sheet option.
            ListTile(
              title: Text("Option - 1"),
            ),

            ListTile(
              title: Text("Option - 2"),
            ),

            ListTile(
              title: Text("Option - 3"),
            ),

          ],
        ),
      ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog"),
        backgroundColor:Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){

                // Calls the function
                // that opens the standard AlertDialog.
                showAlertDialog();
              }, 
              child: Text("Alert Dialog")),

            SizedBox(height: 15,),
          
            ElevatedButton(
              onPressed: (){

                // Opens the customized AlertDialog
                // containing an icon and a long warning message.
                showAlertDialogWithIcon();
              }, 
              child: Text("Alert Dialog with icon")),

            SizedBox(height: 15,),
          
            ElevatedButton(
              onPressed: (){

                // Opens the SimpleDialog
                // containing simple options.
                showSimpleDialog();
              }, 
              child: Text("simple dialog")),

            SizedBox(height: 15,),

            ElevatedButton(
              onPressed: (){

                // Opens the modal bottom sheet
                // from the bottom of the screen.
                showBottomSheet();
              }, 
              child: Text("Bottom sheet")),
          
          ],
        ),
      ),
    );
  }
}