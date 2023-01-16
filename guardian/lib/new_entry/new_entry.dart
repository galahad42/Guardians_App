import 'package:flutter/material.dart';

const TextStyle kFieldHeading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
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
            title: Text('ID Proof'),
            content: newEntryPage1(context)),
        Step(
            state: currentstep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 1,
            title: Text('Personal Details'),
            content: newEntryPage2(context)),
        Step(
            state: currentstep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 2,
            title: Text('Health Status'),
            content: newEntryPage3(context)),
        Step(
            state: currentstep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentstep >= 3,
            title: Text('Symptoms'),
            content: newEntryPage4(context)),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 9,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: isCompleted
            ? newEntryPage5(context)
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                        primary: Color.fromARGB(255, 6, 53, 92))),
                child: Stepper(
                  physics: ScrollPhysics(),
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFC3DFFF),
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
                Text(
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
                Text(
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
                Text(
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
                Text(
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
                Text(
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
                Text(
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

  //SECTION - 3
  Container newEntryPage3(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!SECTION1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Body Measurement',
                    style: kFieldHeading,
                  ),
                  Row(
                    children: [
                      _commonTextField(
                          hintText: 'height', controller: _heightController),
                      SizedBox(
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
                  Text(
                    'Check the conditions that apply to you or to any members of your immediate relatives',
                    style: kFieldHeading,
                  )
                ],
              )
            ],
          )),
    );
  }

  //SECTION - 4
  Container newEntryPage4(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 110.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Symptoms',
                    style: kFieldHeading,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _commonTextField(
                      hintText: 'type here', controller: _symptomsController),
                ]),
                SizedBox(
                  width: 60.0,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Diseases',
                    style: kFieldHeading,
                  ),
                  SizedBox(
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 110.0,
            ),
            Icon(
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
