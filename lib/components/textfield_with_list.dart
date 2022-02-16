import 'package:flutter/material.dart';

class TextfieldList extends StatelessWidget {
  final TextEditingController controller;
  const TextfieldList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = List.generate(10, (index) => index.toString());
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 45.0,
          child: Stack(
            children: [
              TextField(
                controller: controller,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Colors.transparent,
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
                          items.map<DropdownMenuItem<String>>((String value) {
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
            ],
          ),
        ),
      ),
    );
  }
}
