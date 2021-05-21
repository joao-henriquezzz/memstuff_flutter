import 'package:get_it/get_it.dart';
import 'package:memstuff_manha/helpers/phone_call.dart';

final GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton<PhoneCall>(PhoneCall());
}
