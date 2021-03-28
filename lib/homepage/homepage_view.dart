import 'package:auto_size_text/auto_size_text.dart';
import 'package:coolors/homepage/homepage_viewmodel.dart';
import 'package:coolors/misc/kcontants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomepageViewModel>.reactive(
      viewModelBuilder: () => HomepageViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Lottie.asset('assets/animations/globe.json',
                      height: MediaQuery.of(context).size.height * .3),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform(
                        transform: Matrix4.rotationZ(-.1),
                        child: AutoSizeText(
                          "<Coolors>",
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "NoVirus",
                              fontSize: 75,
                              shadows: [
                                Shadow(
                                    blurRadius: 20,
                                    color: Colors.black,
                                    offset: Offset(1, 1))
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                  color: kGreyMenu,
                ),
                width: 300,
                child: Column(
                  children: [
                    Text("Enter your color"),
                    TextField(
                      controller: model.colorController,
                      onSubmitted: (value) {
                        //model.setBusy(true);
                        model.verifyInput(model.colorController.text);
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        errorText: model.errorString,
                        hintText: "#000000",
                      ),
                      maxLines: 1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlue,
                ),
                width: 300,
                child: Center(
                  child: AutoSizeText(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
