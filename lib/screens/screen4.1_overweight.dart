import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/screens/screen5.dart';

class OverWeight extends StatefulWidget {
  const OverWeight({Key? key}) : super(key: key);
  @override
  State<OverWeight> createState() => _OverWeightState();
}

class _OverWeightState extends State<OverWeight> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('over_weight').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text('OverWeight Diet',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 35.0,
                      color: Colors.white)),
              centerTitle: true,
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: _userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error while processing the request...');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading the data...');
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Material(
                  child: ListTile(
                    leading: Image.network(data['image'],
                        height: 100, width: 60, fit: BoxFit.fill),
                    title: Text(
                      data['name'],
                      style: const TextStyle(
                          fontSize: 30.0,
                          color: Color.fromARGB(255, 32, 24, 24)),
                    ),
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16.0),
                    subtitle: Text(
                      data['weight'],
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 32, 24, 24)),
                    ),
                    trailing: const Icon(Icons.forward),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                heroTag: '${data['image']}',
                                foodName: '${data['name']}',
                                description: '${data['description']}',
                                calories: '${data['calories']}',
                                proteins: '${data['proteins']}',
                                vitamins: '${data['vitamins']}',
                                weight: '${data['weight']}'),
                          ));
                    },
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
