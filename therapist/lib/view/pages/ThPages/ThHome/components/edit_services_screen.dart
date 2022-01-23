import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/my_button.dart';

class EditServicesScreen extends StatefulWidget {
  const EditServicesScreen(
      {Key key, this.description, this.price, this.time, this.title});
  final String title;
  final String description;
  final String time;
  final double price;

  @override
  State<EditServicesScreen> createState() => _EditServicesScreenState();
}

class _EditServicesScreenState extends State<EditServicesScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController desCriptionController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.title;
    desCriptionController.text = widget.description;
    timeController.text = widget.time;
    priceController.text = widget.price.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InputField(
              //isPassField: false,
              validator: (value) {
                if (value.isEmpty || value == null)
                  return 'Required';
                else
                  return null;
              },
              hint: "Title",
              label: 'Title',
              textInputType: TextInputType.visiblePassword,
              controller: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              //isPassField: false,
              validator: (value) {
                if (value.isEmpty || value == null)
                  return 'Required';
                else
                  return null;
              },
              hint: "Description",
              label: 'Description',
              //textInputType: TextInputType.visiblePassword,
              controller: desCriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              //isPassField: false,
              validator: (value) {
                if (value.isEmpty || value == null)
                  return 'Required';
                else
                  return null;
              },
              hint: "Time",
              label: 'Time',
              //textInputType: TextInputType.visiblePassword,
              controller: timeController,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              //isPassField: false,
              validator: (value) {
                if (value.isEmpty || value == null)
                  return 'Required';
                else
                  return null;
              },
              hint: "Price",
              label: 'Price',
              textInputType: TextInputType.number,
              controller: priceController,
            ),
            const SizedBox(
              height: 50,
            ),
            MyButton(
              label: "Save change",
              //loading: _controller.isLoading,
              onTap: () {
                Get.back();
                // _validateUserInput();
                // Get.offAll(
                //   () => RootPage(
                //     isTherapist: isTherapist,
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}
