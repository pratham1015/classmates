import 'package:classmates/components/custom_textfield.dart';
import 'package:classmates/components/reusable_button.dart';
import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

class AddBadgesSheet extends StatefulWidget {
  const AddBadgesSheet({Key? key}) : super(key: key);

  @override
  _AddBadgesSheetState createState() => _AddBadgesSheetState();
}

class _AddBadgesSheetState extends State<AddBadgesSheet> {
  String selectedToggle = "Skill";
  TextEditingController badgeDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      padding: const EdgeInsets.all(10.0),
      color: const Color(0xFF5C83E0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white30,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        RadioButton(
                          value: "Skill",
                          groupValue: selectedToggle,
                          onChanged: (String? val) {
                            setState(() {
                              if (val != null) {
                                selectedToggle = val;
                              }
                            });
                          },
                        ),
                        RadioButton(
                          value: "Awards",
                          groupValue: selectedToggle,
                          onChanged: (String? val) {
                            setState(() {
                              if (val != null) {
                                selectedToggle = val;
                              }
                            });
                          },
                        ),
                        RadioButton(
                          value: "Previous Jobs",
                          groupValue: selectedToggle,
                          onChanged: (String? val) {
                            setState(() {
                              if (val != null) {
                                selectedToggle = val;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add $selectedToggle",
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    controller: badgeDetailController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ReusableButton(
                    text: "Submit",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            value,
            style: roboto18regular.copyWith(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
