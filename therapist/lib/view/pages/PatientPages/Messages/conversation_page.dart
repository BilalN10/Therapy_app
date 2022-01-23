import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/message_bar.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/message_input.dart';

class ConversationPage extends StatelessWidget {
  final Conversation _conversation = conversationsList[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leadingWidth: 18,
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        backgroundColor: kAppBarBGColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: kPrimaryColor.withOpacity(0.75),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: SvgPicture.asset(
                        _conversation.sender.gender == Gender.Male
                            ? 'assets/images/dr_m.svg'
                            : 'assets/images/dr_f.svg',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 5,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: _conversation.sender.isOnline
                            ? Colors.green
                            : Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Text(
              _conversation.sender.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          // IconButton(
          //   onPressed: () {

          //   },
          //   icon: const Icon(Icons.info),
          // ),
        ],
      ),
      body: Column(
        children: [
          MessageBar(),
          const MessageInput(),
        ],
      ),
    );
  }
}
