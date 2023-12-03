import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Please enter Email',
          'internet_exception': 'Error while fetching Data',
          'general_exception': 'Error while fetching Data - general Exception',
          'login': 'Login',
          'password_hint': 'Please Enter Password',
          'title': 'MVC/MVVM by Mahesh Kattel'
        },
        'ur_PK': {
          'email_hint': 'Urdu',
        },
      };
}
