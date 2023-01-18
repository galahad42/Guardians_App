import 'package:flutter/material.dart';

const TextStyle kFieldHeading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 6, 53, 92));

const TextStyle kCheckmarkText = TextStyle(
    fontSize: 15.0,
    fontStyle: FontStyle.italic,
    color: Color.fromARGB(255, 6, 53, 92));

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _mobileNumberController = TextEditingController();
  late TextEditingController _altMolbileNumberController =
      TextEditingController();
  late TextEditingController _firstNameController = TextEditingController();
  late TextEditingController _middleNameController = TextEditingController();
  late TextEditingController _lastNameController = TextEditingController();
  late TextEditingController _dobController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _flatController = TextEditingController();
  late TextEditingController _localityController = TextEditingController();
  late TextEditingController _districtController = TextEditingController();
  late TextEditingController _cityController = TextEditingController();
  late TextEditingController _stateController = TextEditingController();
  late TextEditingController _idProofController = TextEditingController();
  late TextEditingController _symptomsController = TextEditingController();
  late TextEditingController _diseasesController = TextEditingController();
  late TextEditingController _heightController = TextEditingController();
  late TextEditingController _weightController = TextEditingController();

  int currentstep = 0;
  bool isCompleted = false;
  List<Step> getSteps() => [
        Step(
            state: currentstep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 0,
            title: const Text('ID Proof'),
            content: newEntryPage1(context)),
        Step(
            state: currentstep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 1,
            title: const Text('Personal Details'),
            content: newEntryPage2(context)),
        Step(
            state: currentstep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 2,
            title: const Text('Health Status'),
            content: newEntryPage3(context)),
        Step(
            state: currentstep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 3,
            title: const Text('Symptoms'),
            content: newEntryPage4(context)),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 9,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: isCompleted
            ? newEntryPage5(context)
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                        primary: Color.fromARGB(255, 6, 53, 92))),
                child: Stepper(
                  physics: const ScrollPhysics(),
                  steps: getSteps(),
                  type: StepperType.horizontal,
                  currentStep: currentstep,
                  onStepContinue: () {
                    final isLastStep = currentstep == getSteps().length - 1;
                    if (isLastStep) {
                      isCompleted = true;
                      //Send data to the server
                    } else {
                      setState(() {
                        currentstep += 1;
                      });
                    }
                  },
                  onStepCancel: () {
                    (currentstep == 0)
                        ? null
                        : setState(() {
                            currentstep -= 1;
                          });
                  },
                  onStepTapped: (step) {
                    setState(() {
                      currentstep = step;
                    });
                  },
                ),
              ),
      ),
    );
  }

// newEntryPage3(context)
//SECTION - 1
  Container newEntryPage1(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFC3DFFF),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _commonTextField(
                    hintText: 'Select ID proof',
                    controller: _idProofController),
                _commonTextField(
                    hintText: 'Ennter ID proof number',
                    controller: _idProofController),
              ],
            ),
            Positioned(
              //FIXME - image does not load
              child: Image.asset('assets/login_page/id2.png'),
              left: 500,
              top: 200,
            )
          ],
        ),
      ),
    );
  }

//SECTION - 2
  Container newEntryPage2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFC3DFFF),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!SECTION1
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Adhar Card Number",
                  style: kFieldHeading,
                ),
                _commonTextField(
                    hintText: 'enter here', controller: _nameController),
              ],
            ),
            //!SECTION2
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Contacts",
                  style: kFieldHeading,
                ),
                Row(
                  children: [
                    _commonTextField(
                        hintText: 'mobile number',
                        controller: _mobileNumberController),
                    _commonTextField(
                        hintText: 'alternate number',
                        controller: _altMolbileNumberController),
                  ],
                ),
              ],
            ),
            //!SECTION3
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Patient's Name",
                  style: kFieldHeading,
                ),
                Row(
                  children: [
                    _commonTextField(
                        hintText: 'First Name',
                        controller: _firstNameController),
                    _commonTextField(
                        hintText: 'Middle Name',
                        controller: _middleNameController),
                    _commonTextField(
                        hintText: "Last Name", controller: _lastNameController),
                  ],
                )
              ],
            ),
            //!SECTION4
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Date of Birth",
                  style: kFieldHeading,
                ),
                _commonTextField(
                    hintText: '01-01-2001', controller: _dobController),
              ],
            ),
            //!SECTION5
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "E-mail",
                  style: kFieldHeading,
                ),
                _commonTextField(
                    hintText: 'abc123@gmail.com', controller: _emailController),
              ],
            ),

            //!SECTION6
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Address",
                  style: kFieldHeading,
                ),
                Row(
                  children: [
                    _commonTextField(
                        hintText: 'flat/house number',
                        controller: _flatController),
                    _commonTextField(
                        hintText: 'locality', controller: _localityController),
                    _commonTextField(
                        hintText: "district", controller: _districtController),
                  ],
                ),
                Row(
                  children: [
                    _commonTextField(
                        hintText: 'city', controller: _cityController),
                    _commonTextField(
                        hintText: 'state', controller: _stateController),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dynamic boolRelativeDisease = {
    'asthama': false,
    'cancer': false,
    'cardiac_disease': false,
    'diabetes': false,
    'hypertension': false,
    'psychiatric_disorder': false,
    'epilepsy': false,
  };

  dynamic boolCurrentSymptoms = {
    'chest_pain': false,
    'respiratory': false,
    'cardiac_disease': false,
    'cardiovascular': false,
    'hematological': false,
    'lymphatic': false,
    'neurological': false,
    'psychiatric': false,
    'gastrointestinal': false,
    'genitourinary': false,
    'weight_gain': false,
    'weight_loss': false,
  };

  dynamic boolCurrentMedicine = {
    'yes': false,
    'no': false,
  };

  //SECTION - 3
  Container newEntryPage3(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFC3DFFF),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!SECTION1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Body Measurement',
                    style: kFieldHeading,
                  ),
                  Row(
                    children: [
                      _commonTextField(
                          hintText: 'height', controller: _heightController),
                      const SizedBox(
                        width: 50,
                      ),
                      _commonTextField(
                          hintText: 'weight', controller: _weightController),
                    ],
                  ),
                ],
              ),

              //!SECTION2
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check the conditions that apply to you or to any members of your immediate relatives',
                    style: kFieldHeading,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ), //SizedBox
                      const Text(
                        'Asthama',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['asthama'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['asthama'] = value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Cancer',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['cancer'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['cancer'] = value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Cardiac Disease',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['cardiac_disease'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['cardiac_disease'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Diabetes',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['diabetes'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['diabetes'] = value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Hypertension',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['hypertension'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['hypertension'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Psychiatric disorder',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['psychiatric_disorder'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['psychiatric_disorder'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Epilepsy',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolRelativeDisease['epilepsy'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolRelativeDisease['epilepsy'] = value ?? false;
                            },
                          );
                        },
                      ),

                      //Checkbox
                    ], //<Widget>[]
                  ),
                ],
              ),

              //!SECTION3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check the symptoms that the patient is currently experiencing',
                    style: kFieldHeading,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ), //SizedBox
                      const Text(
                        'Chest pain',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['chest_pain'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['chest_pain'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Respiratory',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['respiratory'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['respiratory'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Cardiac Disease',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['cardiac_disease'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['cardiac_disease'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Cardiovascular',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['cardiovascular'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['cardiovascular'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Hematological',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['hematological'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['hematological'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Lymphatic',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['lymphatic'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['lymphatic'] = value ?? false;
                            },
                          );
                        },
                      ),

                      //Checkbox
                    ], //<Widget>[]
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ), //SizedBox
                      const Text(
                        'Neurological',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['neurological'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['neurological'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Psychiatric',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['psychiatric'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['psychiatric'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Gastrointestinal',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['gastrointestinal'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['gastrointestinal'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Genitourinary',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['genitourinary'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['genitourinary'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Weight gain',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['weight_gain'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['weight_gain'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      const SizedBox(
                        width: 20,
                      ), //SizedBox
                      const Text(
                        'Weight loss',
                        style: kCheckmarkText,
                      ), //Text
                      const SizedBox(width: 5), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: boolCurrentSymptoms['weight_loss'],
                        onChanged: (bool? value) {
                          setState(
                            () {
                              boolCurrentSymptoms['weight_loss'] =
                                  value ?? false;
                            },
                          );
                        },
                      ),

                      //Checkbox
                    ], //<Widget>[]
                  ),
                ],
              ),
            ],
          )),
    );
  }

  //SECTION - 4
  Container newEntryPage4(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFC3DFFF),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 110.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Symptoms',
                    style: kFieldHeading,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _commonTextField(
                      hintText: 'type here', controller: _symptomsController),
                ]),
                const SizedBox(
                  width: 60.0,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Diseases',
                    style: kFieldHeading,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  _commonTextField(
                      hintText: 'type here', controller: _diseasesController),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //SECTION - 5
  Container newEntryPage5(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFC3DFFF),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 110.0,
            ),
            const Icon(
              Icons.cloud_done,
              size: 100,
            )
          ],
        ),
      ),
    );
  }

  _commonTextField({
    required String hintText,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 8.0, bottom: 18.0),
      child: SizedBox(
        height: 40,
        width: 300,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            // return validator!(value);
          },
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
