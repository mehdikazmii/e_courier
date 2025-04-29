import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/theme/constant.dart';
import 'package:untitled5/widgets/inputWidget.dart';
import 'package:untitled5/widgets/pressedWidgets.dart';
import 'package:untitled5/widgets/s.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  bool isTrackingStepper = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController trackingNoController = TextEditingController();

    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/ecourierlogo.png'),
                  width: 120,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: input2('e.g#12345678', trackingNoController),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: customButton('Track', () {
                // setState(() {
                //   isTrackingStepper=true;
                // });
                if (trackingNoController.text.isEmpty) {
                  S.sSnackBar(message: 'Tracking No Required!');
                  return;
                }
                if (trackingNoController.text.isNotEmpty) {
                  setState(() {
                    isTrackingStepper = true;
                  });
                  return;
                }
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isTrackingStepper,
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                iconWidth:
                    40, // Height that will be applied to all the stepper icons
                iconHeight:
                    40, // Width that will be applied to all the stepper icons
              ),
            )
          ],
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: primaryColor,
      centerTitle: true,
      title: Text(
        'Pick Up',
        style: style1.copyWith(color: Colors.white),
      ),
    );
  }

  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Order Placed",
          textStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        subtitle: StepperText("Your order has been placed"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_one, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Preparing"),
        subtitle: StepperText("Your order is being prepared"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText("On the way"),
        subtitle: StepperText(
            "Our delivery executive is on the way to deliver your item"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
    StepperData(
      title: StepperText("Delivered",
          textStyle: const TextStyle(
            color: Colors.grey,
          )),
    ),
  ];
}
