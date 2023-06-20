import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;

    if (phoneNumber.isEmpty) {
      return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text('Please enter your phone number'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (phoneNumber.length < 9) {
      return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text(
              'The phone number you entered is too short for the country: $countryName\n\nInclude your area code if you haven\'t',
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (phoneNumber.length > 10) {
      return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text(
              'The phone number you entered is too long for the country: $countryName',
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // Perform further actions here
  }

  showCountryPickerBottomSheet() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ET'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: CupertinoColors.systemGrey),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: CupertinoColors.systemGrey),
          prefixIcon: const Icon(
            CupertinoIcons.arrow_up_arrow_down_circle_fill,
            color: Colors.green,
          ),
          hintText: 'Search country by code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CupertinoColors.systemGrey.withOpacity(.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'India');
    countryCodeController = TextEditingController(text: '91');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        middle: Text(
          'Enter your phone number',
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'WhatsApp will need to verify your number. ',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: "What's my number?",
                      style: TextStyle(
                        color: CupertinoTheme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CupertinoTextField(
                padding: EdgeInsets.only(left: 15,right: 5,top: 7,bottom: 7),
                readOnly: true,
                controller: countryNameController,
                onTap: showCountryPickerBottomSheet,
                placeholder: 'Country',
                suffix: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    CupertinoIcons.arrow_up_arrow_down_circle_fill,
                    color: CupertinoColors.activeGreen,
                    size: 25,
                  ),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(color: Colors.grey,
                  width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: CupertinoTextField(
                      padding: EdgeInsets.only(left: 5,right: 5,top: 7,bottom: 7),
                      readOnly: true,
                      controller: countryCodeController,
                      onTap: showCountryPickerBottomSheet,
                      prefix: Icon(CupertinoIcons.plus,
                      size: 20,
                      ),
                      placeholder: 'Code',
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        border: Border.all(color: Colors.grey,
                            width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CupertinoTextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      placeholder: 'Phone number',
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        border: Border.all(color: Colors.grey,
                            width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CupertinoColors.black,
                    width: 0.5,
                  ),
                ),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Carrier charges may apply',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: Text('Next'),
              onPressed: sendCodeToPhone,
            ),
          ],
        ),
      ),
    );
  }
}
