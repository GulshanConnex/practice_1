import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice/SignInScreen.dart';
import 'ChatScreen.dart';
import 'notification_services.dart';
import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationServices.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Waiting for notifications...'),
//       ),
//     );
//   }
// }







// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:practice/notification_services.dart';
//
// import 'SignInScreen.dart';
// import 'Uihelper/simole.dart';
// import 'firebase_options.dart';
// void main () async {
//   runApp(const MyApp());
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await NotificationServices.initialize();
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: SignIn(),
//     );
//   }
// }

