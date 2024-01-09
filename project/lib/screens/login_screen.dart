import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Image.asset(
                    "assets/images/logoTN2.png",
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome to the CareMe team!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(fontSize: 18),
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
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {},
                          onSaved: (value) {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 18),
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
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          validator: (value) {},
                          onSaved: (value) {},
                        ),
                        const SizedBox(height: 10),

                        // forgot password?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need some help ? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Help',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Copyright ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Icon(Icons.copyright, size: 15,),
                    Text(
                      ' 2024, CareMe',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
