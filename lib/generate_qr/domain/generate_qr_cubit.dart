import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit(String? projectId) : super(
    GenerateQrState(
      projectId: projectId
    )
  );
}
