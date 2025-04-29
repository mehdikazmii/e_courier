import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/theme/constant.dart';
class Privacy extends StatefulWidget {
  static String id="privacy";

  const Privacy({Key? key}) : super(key: key);
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Privacy Policy",
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 200,
            child: Icon(
              Icons.privacy_tip,
              size: 100,
              color: secondaryColor,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10,),
                  const Center(child: Text('(Privacy Policy)',style: TextStyle(fontWeight: FontWeight.bold),)),
                  const Padding(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    child: Text("Last Revision:  11/20/2022"),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Introduction.",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(

                    padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10,top: 10),
                    child: Wrap(
                      children: const <Widget>[
                        Text('CityFixr LLC (“CityFixr” “we” “our”) takes your privacy seriously.'
                            ' At CityFixr, we pledge to follow the provisions of this privacy policy '
                            'in order to protect your privacy rights.This Privacy Policy (the “Policy”)'
                            ' outlines our general policy and practices for implementing the Principles '
                            'and protecting your private information.  This includes the types of information we gather, how we use it, and the notice and choice affected individuals have regarding our use of and their ability to correct their information. This Policy applies to all personal information received by the Company whether in electronic, written, or verbal format.'
                            '\n1. Definitions.\n.1 “Information” is any data, personal or otherwise,'
                            ' that is\na) is transferred from you to CityFixr, regardless of its country'
                            ' of origin; and\nb) is recorded in any form.\n1.2 “Personal information” '
                            'is about or pertains to a specific individual whether the individual is you'
                            ' or not and can be linked to that individual.\n 1.3 “Sensitive Personal '
                            'Information” means personal information that reveals race, ethnic origin, '
                            'sexual orientation, political opinions, religious or philosophical beliefs, trade union membership or that concerns an individual’s health.\n1.4 The “website” includes all pages and content found or accessed under the cityfixr.com domain name.\n1.5 The “web portal” includes all password protected areas of cityfixr.com and all content downloaded, viewed, or accessed there.\n1.6 “Software” includes the app, programs, routines, and symbolic languages downloaded or accessed through the website or web portal or otherwise provided by CityFixr that control any functionality or direct any operations on a computer.\n1.7 Collectively the app, website, and other software are referred to as the “Services.”\n1.5 “User” means anyone accessing or using Services provided by CityFixr, whether they are approved users, applicants, guests, or internet users even if they did not directly access the Service used.  This includes applicants even if their application to become an approved user is rejected or denied.  It also includes users of the Software even if they never access the website or app.'
                            '\n1.6 “Content” includes any text, images, descriptions, videos, pictures,'
                            ' or any other information that is posted, displayed, or published on or in '
                            'connection with the Services.  This includes Content posted by approved users,'
                            ' CityFixr, and any third party affiliates of CityFixr.  '
                            '\n2. Information CityFixr Receives from You.\n2.1	Location and route data '
                            'is collected in the form of timestamped GPS signals and other information '
                            'sent by your mobile device on which the application is installed. '
                            'This information may be saved to a history of the journeys you have made'
                            ' while using CityFixr. CityFixr may also collect information such as “favorited” or frequented destinations, search queries, calendar information, voice and audio commands, and communication conducted through the CityFixr app.\n2.2	Meta data. Once you have installed the app, CityFixr will collect information about the use of the app as well as information from the device on which CityFixr is installed. For example, CityFixr may record how often you use the app and for how long, your device’s make and model, operating system type, crash reports and glitches, battery usage, advertisements that you view and click on, and third party apps or programs that you may connect with CityFixr.\n2.3 Any time a User accesses the website or web portal they receive a “cookie” from us.  We use cookies (small pieces of data stored for an extended period of time on a computer, mobile phone, or other device) to make the Services easier to use and to protect both you and CityFixr. These cookies give CityFixr information about your use of the Services.  You can remove or block cookies using the settings in your browser, but in some cases that may impact your ability to use the Services.\n2.4 As part of the process to become an approved user, CityFixr requires an applicant to provide the following information:\na) name;\nb) username;\nc) password;\nd) email;\nCityFixr stores and compiles this data and may retain it from applicants who do not become approved users or who voluntarily end their approved user status or who have their approved user status revoked by CityFixr.  To retain your approved user status you are required to keep this information up to date and accurate by informing CityFixr of any changes to the information.\n2.5 When you access the Services from a computer, mobile phone, or other device, we may collect information from that device about your browser type, location, and IP address, as well as the pages you visit\n2.6 You may also upload Content from time to time that is based partly or totally on protected health information.  CityFixr requires the content by de-identified per HIPAA protocols.  For more information about CityFixr’s policies for this information please read the Terms and Conditions of Use found [here].  Content uploaded is kept by CityFixr for research purposes.  Any or all of the information the Content contains may be aggregated or otherwise indexed or cross referenced.'
                          ,

                          style: TextStyle(color: Color(0xff3A3131), fontSize: 14.0), softWrap: false, maxLines: 1114, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 10,),
                        Center(child: Text('Email:\ne_courier@gmail.com\n',style: TextStyle(color: Color(0xff3A3131), fontSize: 14.0), softWrap: false, maxLines: 1114, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,))
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
