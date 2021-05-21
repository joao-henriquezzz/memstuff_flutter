import 'package:memstuff_manha/helpers/date_helper.dart';

class Validators {
  static String phoneNumberValidator(String value) {
    Pattern pattern = r'^\([1-9]{2}\) (?:[2-8]|9[1-9])[0-9]{3}\-[0-9]{4}$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value))
      return 'O telefone inserido é inválido';
    else
      return null;
  }

  static String inputValidator(String value) {
    if (value.isEmpty) return "Campo é obrigatorio";
    if (value.length == 1) return "Inválido, insira outro";
    return null;
  }

  static String inputDateValidator(String value) {
    DateTime date = DateHelper.parse(value);
    if (date.isAfter(DateTime.now()))
      return 'A data inserida deve ser menor ou igual que a data de hoje';
    return null;
  }
}
