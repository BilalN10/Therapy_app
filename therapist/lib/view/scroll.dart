import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MYScrollScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Coflutter'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text('To Top'),
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 300));
                    SchedulerBinding.instance?.addPostFrameCallback((_) {
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn);
                    });
                  },
                ),
                RaisedButton(
                  child: Text('To Bottom'),
                  onPressed: () async {
                    await Future.delayed(const Duration(milliseconds: 300));
                    SchedulerBinding.instance?.addPostFrameCallback((_) {
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn);
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: index % 2 == 0 ? Colors.red : Colors.green,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
