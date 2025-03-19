import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/theme/constant.dart';

class Faq extends StatefulWidget {
  static String id = "faqs";

  Faq({Key? key}) : super(key: key);
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "FAQ\s",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 200,
            child: Icon(
              Icons.list,
              size: 100,
              color: secondaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: const <Widget>[
                SizedBox(height: 20.0),
                ExpansionTile(
//                  backgroundColor:Color(0xffeb2026) ,
                  title: Text(
                    "Questions",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ExpansionTile(
//                      backgroundColor:Color(0xffeb2026) ,
                      title: Text(
                        'Question 1',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Lorem ipsum dolor sit amet, vel et primis constituam, alterum vituperata sed cu. Euismod nonumes ceteros mei ne. Iudico salutandi an mea. Te sanctus adipisci vituperatoribus sed. Et per atomorum consulatu imperdiet, his doctus alterum deleniti an. At vim placerat similique.'),
                        )
                      ],
                    ),
                    ExpansionTile(
//                      backgroundColor:Color(0xffeb2026) ,
                      title: Text(
                        'Question 2',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Lorem ipsum dolor sit amet, vel et primis constituam, alterum vituperata sed cu. Euismod nonumes ceteros mei ne. Iudico salutandi an mea. Te sanctus adipisci vituperatoribus sed. Et per atomorum consulatu imperdiet, his doctus alterum deleniti an. At vim placerat similique.'),
                        )
                      ],
                    ),
                    ExpansionTile(
//                      backgroundColor:Color(0xffeb2026) ,
                      title: Text(
                        'Question 3',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              'Lorem ipsum dolor sit amet, vel et primis constituam, alterum vituperata sed cu. Euismod nonumes ceteros mei ne. Iudico salutandi an mea. Te sanctus adipisci vituperatoribus sed. Et per atomorum consulatu imperdiet, his doctus alterum deleniti an. At vim placerat similique..'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
