import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/utils.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/pages/PatientPages/Messages/conversation_page.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    Key key,
    @required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final int _unseenMessages = _unseenCount(conversation.messagesList);
    return GestureDetector(
      onTap: () {
        Get.to(
          ConversationPage(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 28,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: kPrimaryColor.withOpacity(0.75),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SvgPicture.asset(
                      conversation.sender.gender == Gender.Male
                          ? 'assets/images/dr_m.svg'
                          : 'assets/images/dr_f.svg',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 5,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: conversation.sender.isOnline
                          ? Colors.green
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            conversation.sender.name,
          ),
          subtitle: Text(
            conversation.messagesList.last.message,
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _dateToString(conversation.messagesList.last.sentDateTime),
              ),
              const SizedBox(height: 4),
              _unseenMessages == -1
                  ? const SizedBox()
                  : CircleAvatar(
                      radius: 8,
                      backgroundColor: kPrimaryColor,
                      child: Center(
                        child: Text(
                          _unseenMessages.toString(),
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 8,
                              ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  int _unseenCount(List<Message> list) {
    final List<Message> unseen =
        list.where((m) => m.status == MessageStatus.Delivered).toList();
    return unseen.length > 0 ? unseen.length : -1;
  }

  String _dateToString(DateTime date) {
    final int diff = Utils.calculateDateDifference(date);
    switch (diff) {
      case 0:
        return DateFormat.jm().format(date);
      case -1:
        return 'Yesterday';
      default:
        return DateFormat.yMMMMd().format(date);
    }
  }
}
