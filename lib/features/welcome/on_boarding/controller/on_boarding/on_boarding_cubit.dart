import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/features/welcome/on_boarding/models/on_boarding_model.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        title: "onBoardingOneTitle".tr(),
        body: "onBoardingOneBody1".tr(),
        image: 'on_boarding'.getPngAsset,
    ),
    OnBoardingModel(
        title: "خيارات بحث متقدمة",
        body: "يتيح لك التطبيق البحث عن شريك حياتك المثالي بناء على معايير مثل الدين والتعليم والشخصية والموقع والاهتمامات",
        image: 'on_boarding'.getPngAsset
    ),
    OnBoardingModel(
        title: "ميزات الأمان والخصوصية",
        body: "يولي التطبيق أهمية قصوى للأمان والخصوصية، لذلك يمكنك التواصل مع أعضاء آخرين بثقة",
        image: 'on_boarding'.getPngAsset
    )
  ];
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  OnBoardingCubit() : super(OnBoardingInitial()) {
  }
  changePage(int page) {
    currentPage = page;
    emit(NextState());
  }

  next() {
    if (currentPage >= onBoardingList.length - 1) {
      emit(GoToHomeState());
    } else {
      currentPage++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
      emit(NextState());
    }
  }
}
