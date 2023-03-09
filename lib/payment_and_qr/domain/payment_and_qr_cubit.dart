import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/payment_and_qr/domain/payment_and_qr_state.dart';

class PaymentAndQrCubit extends Cubit<PaymentAndQrState> {
  PaymentAndQrCubit() : super(PaymentAndQrState());
}
