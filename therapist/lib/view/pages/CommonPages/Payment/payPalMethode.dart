import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

class PayPalMethode extends StatelessWidget {
  PayPalMethode({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CreditCardForm(
            cvvCode: "",
            cardHolderName: "",
            cardNumber: "",
            cursorColor: Colors.red,
            cvvValidationMessage: "",
            dateValidationMessage: "",
            expiryDate: "",

            formKey: _formKey, // Required
            onCreditCardModelChange: (CreditCardModel data) {}, // Required
            themeColor: Colors.red,
            obscureCvv: true,
            obscureNumber: true,
            cardNumberDecoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  //  width: 1,
                ),
              ),
              labelText: 'Card Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  //  width: 1,
                ),
              ),
              labelText: 'Expiration Date',
              hintText: 'MM/YY',
            ),
            cvvCodeDecoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  //     width: 1,
                ),
              ),
              labelText: 'CSC',
              hintText: '',
            ),

            cardHolderDecoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  //     width: 1,
                ),
              ),
              labelText: 'Name on Card',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: const [
                Text(
                  "Billing address ",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: TextFormField(
                    // controller: _expiryDateController,
                    // cursorColor: widget.cursorColor ?? themeColor,
                    // focusNode: expiryDateNode,
                    // onEditingComplete: () {
                    //   FocusScope.of(context).requestFocus(cvvFocusNode);
                    // },
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          //     width: 1,
                        ),
                      ),
                      labelText: 'First Name',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    // validator: (String? value) {
                    //   if (value!.isEmpty) {
                    //     return widget.dateValidationMessage;
                    //   }

                    //   final DateTime now = DateTime.now();
                    //   final List<String> date = value.split(RegExp(r'/'));
                    //   final int month = int.parse(date.first);
                    //   final int year = int.parse('20${date.last}');
                    //   final DateTime cardDate = DateTime(year, month);

                    //   if (cardDate.isBefore(now) ||
                    //       month > 12 ||
                    //       month == 0) {
                    //     return widget.dateValidationMessage;
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
                  child: TextFormField(
                    //obscureText: widget.obscureCvv,
                    //focusNode: cvvFocusNode,
                    //controller: _cvvCodeController,
                    //cursorColor: widget.cursorColor ?? themeColor,
                    // onEditingComplete: () {
                    //   FocusScope.of(context).requestFocus(cardHolderNode);
                    // },
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          //     width: 1,
                        ),
                      ),
                      labelText: 'Last Name',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    // onChanged: (String text) {
                    //   setState(() {
                    //     cvvCode = text;
                    //   });
                    // },
                    // validator: (String? value) {
                    //   if (value!.isEmpty || value.length < 3) {
                    //     return widget.cvvValidationMessage;
                    //   }
                    //return null;
                    //},
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
            child: TextFormField(
              // controller: _cardHolderNameController,
              //cursorColor: widget.cursorColor ?? themeColor,
              //focusNode: cardHolderNode,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    //     width: 1,
                  ),
                ),
                labelText: 'Secret address',
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              // onEditingComplete: () {
              //   onCreditCardModelChange(creditCardModel);
              // },
            ),
          ),
        ],
      ),
    );
  }
}
