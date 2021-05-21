import 'package:url_launcher/url_launcher.dart';

class PhoneCall {
  void call(String number) => launch('tel:$number');
}
