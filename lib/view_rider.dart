import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riders_ui/models/user_details.dart';
import 'package:riders_ui/widgets/custom_arrow_button.dart';
import 'package:riders_ui/widgets/custom_button.dart';
import 'package:riders_ui/widgets/custom_user_info_bar.dart';

import 'home_page.dart';

class ViewRider extends StatefulWidget {
  ViewRider({Key? key, required this.user, required this.onTapReject}) : super(key: key);

  final UserDetail user;
  final void Function() onTapReject;

  @override
  State<ViewRider> createState() => _ViewRiderState();
}

class _ViewRiderState extends State<ViewRider> {
  final CarouselController buttonCarouselController = CarouselController();

  int? pageNumber;
  List<String>? images;

  @override
  void initState() {
    pageNumber = 0;
    images = [
      widget.user.aadhar!,
      widget.user.panCard!,
      widget.user.dl!,
      widget.user.bankCheque!,
      widget.user.photo!,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: Text(
                'View Rider',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Row(children: <Widget>[
              CustomArrowButton(
                  onTap: () => buttonCarouselController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear),
                  iconData: Icons.arrow_back_ios_new),
              Expanded(
                child: CarouselSlider(
                  items: images!
                      .map((e) =>
                          Image.file(File(e.substring(0, e.indexOf(':')))))
                      .toList(),
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (page, reason) => setState(() {
                            pageNumber = page;
                          })),
                ),
              ),
              CustomArrowButton(
                  onTap: () => buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear),
                  iconData: Icons.arrow_forward_ios),
            ]),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  images![pageNumber!]
                      .substring(images![pageNumber!].indexOf(':') + 1),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
              child: Container(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            CustomUserInfoBar(
                userInfoType: 'Name',
                userData: widget.user.nameController!.text),
            CustomUserInfoBar(
                userInfoType: 'Phone Number',
                userData: widget.user.phoneNumberController!.text),
            CustomUserInfoBar(
                userInfoType: 'Address',
                userData: widget.user.currentAddressController!.text),
            CustomUserInfoBar(
                userInfoType: 'Localities',
                userData: widget.user.localites!.join(', ')),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    },
                    title: 'Approve',
                  ),
                  CustomButton(
                    onTap: () {
                      widget.onTapReject();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false);
                    },
                    title: 'Reject',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
