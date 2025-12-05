import 'package:ecommerce_flutter/main_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  //Await Native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize Firebase & authentication repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //await .env
  await dotenv.load();

  //configure supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MainApp());
}
