import 'package:get/get.dart';
import 'package:workout_app/utilis/lang/ar.dart';
import 'package:workout_app/utilis/lang/en.dart';


class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };
}
