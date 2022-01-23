import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/controller/subscription_contoller.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SubscriptionDetailPage extends StatefulWidget {
  @override
  State<SubscriptionDetailPage> createState() => _SubscriptionDetailPageState();
}

class _SubscriptionDetailPageState extends State<SubscriptionDetailPage> {
  SubscriptionController subscriptionController =
      Get.put(SubscriptionController());
  // int _groupValue = -1;

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: subscriptionController.groupValue.value,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 1,
        backgroundColor: kAppBarBGColor,
        title: Text(
          "Subscription Details",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            const _InfoTile(
              label: 'Subscription Type',
              value: 'monthly',
            ),
            const _InfoTile(
              label: 'Remaining Days',
              value: '30',
            ),
            const _InfoTile(
              label: 'Subscription Fee',
              value: '\$19.99',
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text("Promo code"),
            //       Container(
            //         alignment: Alignment.topCenter,
            //         height: 40,
            //         width: 130,
            //         decoration: BoxDecoration(
            //             border: Border.all(color: Colors.blue, width: 2)),
            //         child: const TextField(
            //           maxLines: 2,
            //           keyboardType: TextInputType.number,
            //           style: TextStyle(fontSize: 16),

            //           //  controller: controller,
            //           // style: GoogleFonts.poppins(
            //           //     fontSize: size.height * 0.02, fontWeight: FontWeight.w600),
            //           decoration: InputDecoration(
            //             hintText: "Enter Code",
            //             contentPadding:
            //                 EdgeInsets.symmetric(vertical: 11, horizontal: 4),
            //             border: InputBorder.none, counterText: '',
            //             //enabledBorder: InputBorder
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Buy adds free account"),
                  submitButton("Buy", context, () {
                    Get.defaultDialog(
                        title: "Buy Plan", content: dialogContent());
                  })
                ],
              ),
            )
            //  const   Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            //       child: const InputField(
            //           validator: null, hint: "Add Promo code", controller: null),
            //     )
          ],
        ),
      ),
    );
  }

  Widget dialogContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Promo code"),
              Container(
                alignment: Alignment.topCenter,
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2)),
                child: const TextField(
                  maxLines: 2,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16),

                  //  controller: controller,
                  // style: GoogleFonts.poppins(
                  //     fontSize: size.height * 0.02, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: "Enter Code",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    border: InputBorder.none,
                    counterText: '',
                    //enabledBorder: InputBorder
                  ),
                ),
              ),
            ],
          ),

          Obx(
            () => _myRadioButton(
                title: "Monthly      15\$",
                value: 1,
                onChanged: (newValue) =>
                    subscriptionController.groupValue.value = newValue),
          ),
          Obx(
            () => _myRadioButton(
                title: "Yearly        150\$ ",
                value: 2,
                onChanged: (newValue) =>
                    subscriptionController.groupValue.value = newValue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              submitButton("Confirm", context, () {}),
            ],
          )
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child:
          // ),
        ],
      ),
    );
  }

  Widget submitButton(
      String label, BuildContext context, VoidCallback onpress) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.symmetric(
            //horizontal: kDefaultPadding * 0.5,
            ),
        height: 40,
        width: 80,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                offset: const Offset(0, 5),
                color: kPrimaryColor.withOpacity(0.75),
              ),
            ]),
        child: Center(
          child:
              //  const SpinKitThreeBounce(
              //   color: Colors.white,
              //   size: 18,
              // )
              Text(label,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                      )),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
