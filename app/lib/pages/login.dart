import 'package:flutter/material.dart';
import 'package:gen_ai/components/my_button.dart';
import 'package:gen_ai/components/my_textfield.dart';
import 'package:gen_ai/components/square_tile.dart';
import 'package:gen_ai/pages/type.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTap});
  final Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: emailController.text, password: passwordController.text);
    //   //pop the circle
    //   // ignore: use_build_context_synchronously
    //   Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   //pop the circle
    //   Navigator.pop(context);

    //   // wrong email
    //   if (e.code == 'user-not-found') {
    //     wrongAuthMessage('Incorrect Email');
    //   }
    //   // wrong password
    //   else if (e.code == 'wrong-password') {
    //     wrongAuthMessage('Incorrect Password');
    //   }
    // }
  }

  void wrongAuthMessage(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(msg),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/otter-swim.gif",
                      height: 140, width: 250, fit: BoxFit.cover),
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'What should we call you?',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'captain',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Pick a cool name!',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: () {
                    // login logic after backend
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Type()),
                    );
                  },
                  text: 'Continue',
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google button
                    SquareTile(
                      imagePath: 'assets/images/google.png',
                      text: "Continue with Google",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Sign In or Login with Google',
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
