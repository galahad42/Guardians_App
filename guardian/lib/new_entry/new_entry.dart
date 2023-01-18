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
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _mobileNumberController = TextEditingController();
  late final TextEditingController _altMolbileNumberController =
      TextEditingController();
  late final TextEditingController _firstNameController = TextEditingController();
  late final TextEditingController _middleNameController = TextEditingController();
  late final TextEditingController _lastNameController = TextEditingController();
  late final TextEditingController _dobController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _flatController = TextEditingController();
  late final TextEditingController _localityController = TextEditingController();
  late final TextEditingController _districtController = TextEditingController();
  late final TextEditingController _cityController = TextEditingController();
  late final TextEditingController _stateController = TextEditingController();
  late final TextEditingController _idProofController = TextEditingController();
  late final TextEditingController _symptomsController = TextEditingController();
  late final TextEditingController _diseasesController = TextEditingController();
  late final TextEditingController _heightController = TextEditingController();
  late final TextEditingController _weightController = TextEditingController();

  int currentStep = 0;
  bool isCompleted = false;
  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('ID Proof'),
            content: newEntryPage1(context)),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Personal Details'),
            content: newEntryPage2(context)),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text('Health Status'),
            content: newEntryPage3(context)),
        Step(
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
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
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      isCompleted = true;
                      //Send data to the server
                    } else {
                      setState(() {
                        currentStep += 1;
                      });
                    }
                  },
                  onStepCancel: () {
                    (currentStep == 0)
                        ? null
                        : setState(() {
                            currentStep -= 1;
                          });
                  },
                  onStepTapped: (step) {
                    setState(() {
                      currentStep = step;
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
          color: const Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
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

  //SECTION - 3
  Container newEntryPage3(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
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
          color: const Color(0xFFC3DFFF), borderRadius: BorderRadius.circular(50)),
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
