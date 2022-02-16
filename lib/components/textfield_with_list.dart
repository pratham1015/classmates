import 'package:classmates/constants/constants.dart';
import 'package:flutter/material.dart';

class TextfieldList extends StatelessWidget {
  final TextEditingController controller;
  final list;
  const TextfieldList({
    Key? key,
    required this.list,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = List.generate(10, (index) => index.toString());
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: Stack(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius10,
                ),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(fontSize: 20),
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: borderRadius10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: borderRadius10,
                      borderSide: const BorderSide(
                        color: Color(0xFF004FAC),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.8,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        enableFeedback: false,
                        isDense: true,
                        isExpanded: true,
                        menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.text = value;
                          }
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            child: Text(
                              value,
                            ),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
