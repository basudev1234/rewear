import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddCalendarEvent extends StatefulWidget {
  @override
  State<AddCalendarEvent> createState() => _AddCalendarEventState();
}

class _AddCalendarEventState extends State<AddCalendarEvent> {
  final _formKey = GlobalKey<FormState>();
  DateTime _dateTime = DateTime.now();
  DateTime _endDateTime = DateTime.now().add(
    const Duration(
      days: 30,
    ),
  );
  int defaultChoiceIndex = 0;
  int defaultFreq = 0;
  List<String> _choicesList = [
    'Hourly',
    'Daily',
    'Weekly',
    "Monthly",
  ];
  List<String> _freq = [
    '1',
    '2',
    "3",
    '4',
    "5",
  ];
  List<Days> _days = <Days>[
    const Days('Mon'),
    const Days('Tue'),
    const Days('Wed'),
    const Days('Thu'),
    const Days('Fri'),
    const Days('Sat'),
    const Days('Sun'),
  ];
  List<Days> _filters = <Days>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(
          22,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Please enter a title';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  labelText: "Title",
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Please enter a title';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  labelText: "Hash Tag",
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FormField(
                builder: ((field) => Container(
                      height: Get.height * 0.12,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Start Date & Time",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                DateFormat.yMMMEd()
                                    .format(_dateTime)
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _showDatePicker(isEnd: false);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: Colors.amber,
                              padding: const EdgeInsets.all(8),
                            ),
                            child: const Icon(
                              CupertinoIcons.calendar,
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  CupertinoIcons.right_chevron,
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    // expand: true,
                    builder: (context) => StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(
                                  16,
                                ),
                                height: Get.height * 0.4,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Choose Frequency",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text("CUSTOM"))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    defaultChoiceIndex == 0 ||
                                            defaultChoiceIndex == 3
                                        ? const Text("Choose Occurence")
                                        : const Text(""),
                                    defaultChoiceIndex == 0 ||
                                            defaultChoiceIndex == 3
                                        ? Wrap(
                                            spacing: 8,
                                            children: List.generate(
                                                _freq.length, (index) {
                                              return ChoiceChip(
                                                labelPadding:
                                                    const EdgeInsets.all(2.0),
                                                label: Text(
                                                  _freq[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                ),
                                                selected: defaultFreq == index,
                                                selectedColor: Colors.black,
                                                onSelected: (value) {
                                                  setState(() {
                                                    defaultFreq = value
                                                        ? index
                                                        : defaultFreq;
                                                  });
                                                },
                                                // backgroundColor: color,
                                                elevation: 1,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                              );
                                            }),
                                          )
                                        : Wrap(
                                            spacing: 8,
                                            children: List.generate(
                                                _days.length, (index) {
                                              return FilterChip(
                                                avatar: CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  child: Text(_days[index]
                                                      .name[0]
                                                      .toUpperCase()),
                                                ),
                                                label: Text(_days[index].name),
                                                selected: _filters
                                                    .contains(_days[index]),
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    if (selected) {
                                                      _filters.add(
                                                        _days[index],
                                                      );
                                                    } else {
                                                      _filters.remove(
                                                        _days[index],
                                                      );
                                                    }
                                                  });
                                                },
                                              );
                                            }),
                                          ),
                                    Wrap(
                                      spacing: 8,
                                      children: List.generate(
                                          _choicesList.length, (index) {
                                        return ChoiceChip(
                                          labelPadding:
                                              const EdgeInsets.all(2.0),
                                          label: Text(
                                            _choicesList[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                          ),
                                          selected: defaultChoiceIndex == index,
                                          selectedColor: Colors.black,
                                          onSelected: (value) {
                                            setState(() {
                                              defaultChoiceIndex = value
                                                  ? index
                                                  : defaultChoiceIndex;
                                            });
                                          },
                                          // backgroundColor: color,
                                          elevation: 1,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                        );
                                      }),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Confirm",
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      );
                    }),
                  );
                },
                title: Text(
                  "Repeat  ${_choicesList[defaultChoiceIndex]}",
                  // "Repeat Every ${_freq[defaultFreq]} ${_choicesList[defaultChoiceIndex]} ",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: Get.height * 0.1,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "End Date & Time",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          DateFormat.yMMMEd().format(_endDateTime).toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showDatePicker(isEnd: true);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.redAccent,
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Icon(
                        CupertinoIcons.calendar,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Priority",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ToggleSwitch(
                minHeight: Get.height * 0.05,
                minWidth: Get.width * 0.3,
                fontSize: 16.0,
                activeBorders: [
                  Border.all(
                    color: const Color(
                      0XFF116AA6,
                    ),
                  ),
                ],
                initialLabelIndex: 1,
                activeBgColor: [Colors.black],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey.shade300,
                inactiveFgColor: Colors.black,
                totalSwitches: 2,
                labels: const [
                  'Low',
                  'High',
                ],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    29,
                  ),
                  gradient: const LinearGradient(colors: [
                    Color(0XFF279AC6),
                    Color(0XFF0059B9),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("yes");
                    } else {
                      _formKey.currentState!.save();
                    }
                  },
                  minWidth: double.infinity,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "New Reminder",
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }

  void _showDatePicker({required bool isEnd}) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        initialDateTime: isEnd
                            ? DateTime.now().add(
                                const Duration(
                                  days: 30,
                                ),
                              )
                            : DateTime.now(),
                        onDateTimeChanged: (val) {
                          if (isEnd) {
                            setState(() {
                              _endDateTime = val;
                            });
                          } else {
                            setState(() {
                              _dateTime = val;
                            });
                          }
                        }),
                  ),

                  // Close the modal
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Confirm"))
                ],
              ),
            ));
  }
}

class Days {
  const Days(this.name);
  final String name;
}
