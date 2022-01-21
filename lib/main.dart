import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

// PART 1
// void main() {
//   runApp(const MyApp());
// }

// String englishGreeting = "Hello Muwonge !";
// String spanishGreeting = "Hello Lawrence !";

// // creating a stateful widget in flutter.
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//  @override
//  _MyAppState createState() => _MyAppState();
// }


// class _MyAppState extends State<MyApp> {
//   //Default greeting is in English language
//   String displayText = englishGreeting;

//   @override
//   Widget build(BuildContext context) {
//       return  MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // theme: ThemeData(primaryColor: Colors),
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('DonewithIt'),
//             backgroundColor: Colors.green[900],
//             leading: const Icon(Icons.home),
//             actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.refresh),
//               onPressed: () {
//                 setState(() {
//                   displayText = displayText == englishGreeting ? 
//                   spanishGreeting : englishGreeting;
//                 });
//               },
//             )
//           ],
//          ),
//           body: Center(
//              child: Text(
//                displayText,
//              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//              )
//           ))
//       ); //MaterialApp
//   }
// }



// PART TWO

 // working with Stateless widgets to create profile screen

void main() {
  runApp(const ContactProfilePage());
}

class ContactProfilePage extends StatelessWidget {
  const ContactProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: const Icon(
             Icons.arrow_back,
             color: Colors.black,
          ),
           actions : <Widget> [
             IconButton(
               onPressed: () {
               print("Contact is Starred");
             }, 
             icon: const Icon(Icons.star_border),
             color:Colors.black
             ),
           ],
        ),
        body:ListView(
           children: <Widget> [
             Column(
               children : <Widget> [
                 //Container for adding Profile picture
                   Container(
                    width: double.infinity,
                    //Height constraint at Container widget level
                    height: 250,

                    child: Image.network(
                       "https://github.com/ptyagicodecamp/educative_flutter/raw/profile_1/assets/profile.jpg?raw=true",
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
                         "Muwonge Lawrence ",
                         style:  TextStyle(fontSize: 30, color: Colors.blue)
                          )
                         ),
                     ],
                   ),
                 ),
                 //NEW CODE: Adding Divider below the display name
                 const  Divider(
                   color:Colors.grey
                 ),
                 Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  <Widget>[
                        //"Call" action item
                             buildCallButton(),

                     //"Text" action item
                             buildTextButton(),
                        ],
                      ),
                 ),
               ],
             ),
           ],
        ), //body

      ),
    );
  }
}

//Adding "Call" action item
 Widget buildCallButton() {
   return Column(
     children: <Widget>[
       IconButton(
         icon: Icon(
           Icons.call,
           color: Colors.indigo.shade800,
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
       icon: Icon(
         Icons.message,
         color: Colors.indigo.shade800,
       ),
       onPressed: () {},
     ),
    const Text("Text"),
   ],
 );
}

