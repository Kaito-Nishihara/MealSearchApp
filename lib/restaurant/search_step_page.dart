import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsearchapp/restaurant/result.dart';
import 'package:mealsearchapp/restaurant/search_cost.dart';
import 'package:mealsearchapp/restaurant/search_genre.dart';
import 'package:mealsearchapp/restaurant/search_people.dart';

import '../model/restaurant_seach.dart';
import 'package:lottie/lottie.dart';

class SearchStepPage extends StatefulWidget {
  const SearchStepPage({Key? key}) : super(key: key);

  @override
  State<SearchStepPage> createState() => _SearchStepPage();
}

class _SearchStepPage extends State<SearchStepPage> {
  var restaurantSeach = RestaurantSeach();
  int currentStep = 0;
  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text('人数'),
          content: const SearchPeople(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text('予算'),
          content: const SearchCost(),
        ),
        Step(
            isActive: currentStep >= 2,
            title: const Text('ジャンル'),
            content: const SearchGenre()),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.red)),
        child: Stepper(
          controlsBuilder: (context, controller) {
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(children: [
                Expanded(
                    child: ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: controller.onStepContinue,
                )),
                const SizedBox(width: 12),
                Expanded(
                    child: ElevatedButton(
                  child: const Text('BACK'),
                  onPressed: controller.onStepContinue,
                )),
              ]),
            );
          },
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(restaurantSeach)),
              );
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel:
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
        ),
      ),
    );
  }

  _showLottieLoading() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 250),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_07PkRX.json'),
                ElevatedButton(
                  child: const Text('LoadingOff'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }
}
