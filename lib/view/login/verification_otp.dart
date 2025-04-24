import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_fitness/view/login/Aboard.dart';
// import the page you want to go to after verification

class VerifyPage extends StatefulWidget {
  final String email;
  final String password;

  const VerifyPage({super.key, required this.email, required this.password});


  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool emailSent = false;
  bool isLoading = false;
  bool isVerified = false;

  Future<void> sendVerificationEmail() async {
    setState(() {
      isLoading = true;
    });

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        setState(() {
          emailSent = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Verification email sent! Check your inbox."),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error sending email: $e")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> checkVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    user = FirebaseAuth.instance.currentUser;

    if (user != null && user.emailVerified) {
      setState(() {
        isVerified = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeAboardPage(
            email: widget.email,
            password: widget.password,
          ),
        ),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email not verified yet."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Your Email"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "A verification email will be sent to your email address. Please verify it before continuing.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: isLoading ? null : sendVerificationEmail,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Send Verification Email"),
              ),
              const SizedBox(height: 20),
              if (emailSent)
                ElevatedButton(
                  onPressed: checkVerification,
                  child: const Text("Continue"),
                ),
              const SizedBox(height: 20),

              // Only show cancel button if not yet verified
              if (!isVerified)
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
