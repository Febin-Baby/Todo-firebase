// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:stripe_flutter/model/note_model.dart';

class WiidgetScreen extends StatefulWidget {
  const WiidgetScreen(this.note, {super.key});
  final Note note;
  @override
  State<WiidgetScreen> createState() => _WiidgetScreenState();
}

class _WiidgetScreenState extends State<WiidgetScreen> {
  bool idDone = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 9,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              imagee(),
              const SizedBox(width: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(widget.note.tittle),
                          Checkbox(
                            value: idDone,
                            onChanged: (value) {
                              setState(() {
                                idDone = !idDone;
                              });
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Text(widget.note.subtittle),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('hh:mm a')
                                      .format(widget.note.time),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 18)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Swipe left to edit'),
            Text('Swipe right delete'),
          ],
        )
      ],
    );
  }

  Container imagee() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(
            'https://cdn.pixabay.com/photo/2016/03/31/19/50/checklist-1295319_1280.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: 130,
      height: 100,
    );
  }
}

class Febin {
  final String? name;
  final String? address;
  final int? age;
  Febin({
    required this.name,
    required this.address,
    required this.age,
  }) {
    name ?? 'Febin';
    age ?? 24;
    address?.isNum;
  }
}
