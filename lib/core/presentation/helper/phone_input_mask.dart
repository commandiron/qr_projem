import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMask {
  static final phone = MaskTextInputFormatter(
    mask: '+90 (###) ### ## ##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );
}