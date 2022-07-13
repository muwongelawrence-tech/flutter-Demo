// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart

 // working with Stateless widgets to create profile screen
void main() {
  runApp(const ContactProfilePage());
}

enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  //Method for light theme
 static ThemeData appThemeLight() {
   return ThemeData(
     // Define the default brightness and colors for the overall app.
     brightness: Brightness.light,
     //appBar theme
     appBarTheme: const AppBarTheme(
       //ApBar's color 
       color: Colors.white,

       //Theme for AppBar's icons
       iconTheme: IconThemeData(
         color: Colors.black,
       ),
     ),
     //Theme for app's icons
     iconTheme: IconThemeData(
       color: Colors.indigo.shade800,
     ),
       
       //Theme for FAB
     floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,
        
        //Black plus (+) sign for FAB  
        foregroundColor: Colors.black,
      ),
  );
 }

 //Method for dark theme
 static ThemeData appThemeDark() {
   return ThemeData(
     brightness: Brightness.dark,

     appBarTheme: const AppBarTheme(
       color: Colors.black,
       iconTheme: IconThemeData(
         color: Colors.white,
      ),
     ),

     iconTheme: const IconThemeData(
       color: Colors.orange,
     ),
        
        //Theme for FAB
     floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB  
        foregroundColor: Colors.white,
     ),
     
   );
 }
}

//creating a  stateful widget.
class ContactProfilePage extends StatefulWidget {
  const ContactProfilePage({Key? key}) : super(key: key);

  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {

 //Setting a default theme
  var currentTheme = APP_THEME.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // the ThemeData Widget is used to add global themes to the app.
       // setting the theme dynamically.
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),
        
      home: Scaffold(
        appBar: buildAppBarWidget(), //AppBar
        body:buildBodyWidget(),   //body
           
           //Code for FAB (floating Action button)
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.threesixty),
          onPressed: () {
              setState(() {
                
                // Currently selected theme toggles when FAB is pressed
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          
        ),


        ),
    );
  }
}

// AppBar of the Scaffold Widget.
PreferredSizeWidget buildAppBarWidget() {
    return AppBar(
      leading: const Icon(
        Icons.arrow_back,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.star_border),
          onPressed: () {
            print("Contact is starred");
          },
        ),
      ],
    );
}

// body of the Scaffold Widget
Widget buildBodyWidget() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "https://github.com/ptyagicodecamp/educative_flutter/raw/profile_1/assets/profile.jpg?raw=true",
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Muwonge Lawrence",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              //Defining a Local Theme for it's child widget
              child:Theme(
                    data: ThemeData(
                    iconTheme: const IconThemeData(
                    color: Colors.pink,
                    ),
                    ),
                    //This widget applies iconTheme defined above. All icons will be pink for this widget.
                    child: profileActionItems(),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            mobilePhoneListTile(),
            otherPhoneListTile(),
            const Divider(
              color: Colors.grey,
            ),
            emailListTile(),
            const Divider(
              color: Colors.grey,
            ),
            addressListTile(),
          ],
        ),
      ],
    );
  }

Widget profileActionItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildCallButton(),
        buildTextButton(),
        buildVideoCallButton(),
        buildEmailButton(),
        buildDirectionsButton(),
        buildPayButton(),
      ],
    );
}

//Adding "Call" action item
 Widget buildCallButton() {
   return Column(
     children: <Widget>[
       IconButton(
         icon: const Icon(
           Icons.call
         ),
         onPressed: () {},
       ),
        const Text("Call"),
     ],
   );
 }

 Widget buildTextButton() {
 return Column(
   children: <Widget>[
     IconButton(
       icon: const Icon(
         Icons.message,
       ),
       onPressed: () {},
     ),
    const Text("Text"),
   ],
 );
}

Widget buildVideoCallButton() {
 return Column(
   children: <Widget>[
     IconButton(
       icon: const Icon(
         Icons.video_call,
       ),
       onPressed: () {},
     ),
    const Text("Video"),
   ],
 );
}

Widget buildEmailButton() {
 return Column(
   children: <Widget>[
     IconButton(
       icon: const Icon(
         Icons.email,
       ),
       onPressed: () {},
     ),
    const Text("Email"),
   ],
 );
}

Widget buildDirectionsButton() {
  return Column(
   children: <Widget>[
     IconButton(
       icon: const Icon(
         Icons.directions,
         
       ),
       onPressed: () {},
     ),
    const Text("Directions"),
   ],
 );
}

Widget buildPayButton() {
   return Column(
   children: <Widget>[
     IconButton(
       icon: const Icon(
         Icons.attach_money,
       ),
       onPressed: () {},
     ),
    const Text("Pay"),
   ],
 );
}

Widget mobilePhoneListTile() {
 return ListTile(
   leading: const Icon(Icons.call),
   title: const Text("+256 755-168-391"),
   subtitle: const Text("mobile"),
   trailing: IconButton(
     icon: const Icon(Icons.message),
     onPressed: () {},
   ),
 );
}

Widget otherPhoneListTile() {
 return ListTile(
   leading: const Text(""),
   title: const Text("440-440-3390"),
   subtitle: const Text("other"),
   trailing: IconButton(
     icon: const Icon(Icons.message),
     onPressed: () {},
   ),
 );
}

Widget emailListTile() {
 return const ListTile(
   leading: Icon(Icons.email),
   title: Text("muwongelawrence44@gmail.com"),
   subtitle: Text("work"),
 );
}

Widget addressListTile() {
 return ListTile(
   leading: const Icon(Icons.location_on),
   title: const Text("234 Sunset St, Burlingame"),
   subtitle: const Text("home"),
   trailing: IconButton(
     icon: const Icon(Icons.directions),
     onPressed: () {},
   ),
 );
}

