import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
// import 'package:intl/intl.dart' as intl;
import '../../locale/locale_controller.dart';
part 'check_en_ar_state.dart';

class CheckEnArCubit extends Cubit<CheckEnArState> {
  CheckEnArCubit() : super(CheckEnArInitial());
  bool activeAR = false;
  MyLocaleController myLocaleController = Get.find();

  changeEnAr() {
    activeAR = !activeAR;

    activeAR == true
        ? myLocaleController.changeLang("ar")
        : myLocaleController.changeLang("en");
    emit(ResultEnArState());
  }
  // bool isRTL(String text) {
  //   emit(ResultEnArState(result: intl.Bidi.detectRtlDirectionality(text)));
  //   return intl.Bidi.detectRtlDirectionality(text);
  // }
}
