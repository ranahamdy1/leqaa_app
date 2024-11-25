import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/features/welcome/on_boarding/models/on_boarding_model.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        title: "تطبيق زواج مصمم خصيصًا للمسلمين في العالم العربي ",
        body: "يضم التطبيق أكثر من 800000 عضو من جميع أنحاء العالم العربي،",
        body2: " بما في ذلك دول الخليج وأوروبا وأمريكا الشمالية.",
        image: 'on_boarding'.getPngAsset,
    ),
    OnBoardingModel(
        title: "خيارات بحث متقدمة",
        body: "يتيح لك التطبيق البحث عن شريك حياتك المثالي بناء",
        body2: " على معايير مثل الدين والتعليم والشخصية والموقع والاهتمامات",
        image: 'on_boarding'.getPngAsset
    ),
    OnBoardingModel(
        title: "ميزات الأمان والخصوصية",
        body: "يولي التطبيق أهمية قصوى للأمان والخصوصية،",
        body2: " لذلك يمكنك التواصل مع أعضاء آخرين بثقة.",
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
