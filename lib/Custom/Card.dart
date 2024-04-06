import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardNotes extends StatefulWidget {
  const CardNotes({Key? key}) : super(key: key);

  @override
  State<CardNotes> createState() => _CardNotesState();
}

class _CardNotesState extends State<CardNotes> {
  late List<DocumentSnapshot> data = [];
  bool isLoading = true;
  int dataLength = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("folder").where("id",isEqualTo:FirebaseAuth.instance.currentUser!.uid ).get();
    isLoading = false;
    data = querySnapshot.docs;
    setState(() {
      dataLength = querySnapshot.docs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    onLongPress: () {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Warning',
                          desc: 'You Are Sur!!',
                          btnOkOnPress: () async {
                            await FirebaseFirestore.instance
                                .collection("folder")
                                .doc(data[i].id)
                                .delete();
                            Navigator.pushReplacementNamed(context, 'Home');
                          },
                          btnCancelOnPress: () {
                            Navigator.pushReplacementNamed(context, 'Home');
                          }).show();
                    },
                    onTap: () {},
                    title: Text(
                      data[i]["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          data[i]["descrip"],
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Text(
                          "22/03/2003",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
