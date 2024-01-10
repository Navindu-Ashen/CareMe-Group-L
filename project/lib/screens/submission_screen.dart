import 'package:flutter/material.dart';
import 'package:project/screens/results_screen.dart';

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  final _form = GlobalKey<FormState>();
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Patient Information"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Image.asset(
                  "assets/images/logoTN2.png",
                  width: 150,
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter patient name.";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Age",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {
                            if (value == null ||
                                int.parse(value) != num ||
                                int.parse(value) < 120) {
                              return "Enter a valid age";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        const SizedBox(height: 10),

                        DropdownButtonFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Age",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          dropdownColor: Color.fromARGB(255, 240, 247, 255),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Male', 'Female']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Gender",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter patient name.";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Patient State",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter patient name.";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter patient name.";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              fillColor: Color.fromARGB(255, 240, 247, 255),
                              filled: true,
                              hintText: "Travel Time",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter patient name.";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // forgot password?
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(22),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Submit Patient Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need some help ? ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Help',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
