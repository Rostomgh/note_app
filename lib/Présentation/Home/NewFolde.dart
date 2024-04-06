import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Custom/Constant.dart';
import 'package:note_app/Custom/CustomButton.dart';
import 'package:note_app/Custom/CustomDescription.dart';
import 'package:note_app/Custom/TextFieldCustom.dart';

class NewFolder extends StatefulWidget {
  const NewFolder({Key? key}) : super(key: key);

  @override
  State<NewFolder> createState() => _NewFolderState();
}

class _NewFolderState extends State<NewFolder> {
  GlobalKey<FormState> forms = GlobalKey();
  final TextEditingController description = TextEditingController();
  final TextEditingController newfolder = TextEditingController();
  final CollectionReference folder =
      FirebaseFirestore.instance.collection("folder");

  addfolder() async {
    if (forms.currentState!.validate()) {
      try {
        DocumentReference response = await folder.add({'name': newfolder.text,'descrip':description.text});
        Navigator.of(context).pushReplacementNamed('Home');
      } catch (e) {
        print("Error $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 9,
        backgroundColor: AppBarColor,
        title: const Text('Add Folder'),
        centerTitle: true,
      ),
      body: Form(
        key: forms,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              CustomTextField(
                text: 'Name Of Folder',
                mycontroller: newfolder,
                obc: false,
                validator: (val) {
                  if (val == "") {
                    return "can't be empty ";
                  }
                  return null;
                },
              ),
              CustomDescription(
                mycontroller: description,
                valid: (val) {
                  if (val == "") {
                    return "can't be empty";
                  }
                  return null;
                },
              ),
              CustomButton(
                text: 'ADD',
                cs: Colors.orange,
                onPressed: () {
                  addfolder();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
