import 'package:flutter/material.dart';
import 'package:workout_fitness/view/login/login_page.dart';


import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? controller = PageController();
  int selectPage = 0;

  List pageArr = [
    {
      "title": "Welcome",
      "image": "assets/img/on_board_1.png",
    },
    {
      "title": "Get Health Dashboard",
      "subtitle":
      "Access all your essential health details with a\ncomprehensive medical file at your fingertips. Perfect\nfor quick reference during emergencies or routine\nhealth checks.",
      "image": "assets/img/on_board_2.png",
    },
    {
      "title": "Store Medical Vault",
      "subtitle":
      "Health Locker organizes medical records year-\nwise, securely storing doctors' files, reports,\nprescriptions, and scans for easy access.",
      "image": "assets/img/on_board_3.png",
    },
    {
      "title": "Health Trackers",
      "subtitle":
      "Use the Trackers to monitor pain levels, water\nintake, sleep patterns, appointments, and\nmedications.",
      "image": "assets/img/on_board_4.png",
    }
  ];

  @override
  void initState() {
    super.initState();
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;

      if (mounted) {
        setState(() {});
      }
    });
  }

  void nextPage() {
    if (selectPage < pageArr.length - 1) {
      controller?.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: selectPage == 0 ? TColor.primary : Colors.white,
      body: Stack(
        children: [
          if (selectPage == 0)
            Image.asset(
              "assets/img/on_board_bg.png",
              width: media.width,
              height: media.height,
              fit: BoxFit.cover,
            ),
          SafeArea(
            child: PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return Column(
                  children: [
                    if (index == 0)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              pObj["image"].toString(),
                              width: media.width * 0.9,
                              height: media.width * 0.9,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          SizedBox(height: media.height * 0.1),
                          Text(
                            pObj["title"].toString(),
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: media.width * 0.15),
                          Image.asset(
                            pObj["image"].toString(),
                            width: media.width * 0.9,
                            height: media.width * 0.9,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: media.width * 0.2),
                          Text(
                            pObj["subtitle"]?.toString() ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: TColor.black, fontSize: 15),
                          ),
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((pObj) {
                    var index = pageArr.indexOf(pObj);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: selectPage == index
                            ? const Color(0xFF54B8D0)
                            : const Color(0xFF000000),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: RoundButton(
                    title: selectPage == 0 ? "Get Started" : selectPage == pageArr.length - 1 ? "Get Started" : "Next",
                    onPressed: nextPage,
                    customColor: selectPage == 0 ? TColor.white : TColor.secondary, // Set button color based on the page
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
