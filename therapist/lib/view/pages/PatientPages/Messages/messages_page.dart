import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/conversation_tile.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/search_bar.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: conversationsList.length,
                itemBuilder: (context, index) {
                  return ConversationTile(
                    conversation: conversationsList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
