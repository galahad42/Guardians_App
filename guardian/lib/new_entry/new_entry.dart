import 'package:flutter/material.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  late TextEditingController _nameController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 9,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(50)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text("data title"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _commonTextField({
    required String hintText,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {
              validator!(value);
            },
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              hintStyle: TextStyle(color: Colors.grey),
              hintText: hintText,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            ),
          ),
        ],
      ),
    );
  }
}
