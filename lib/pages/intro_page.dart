import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            // Shop Name
            Text("STAROWL", 
              style: GoogleFonts.gothicA1(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: 25),

            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                "lib/images/starowl.png",
                height: 280,
                width: 280,
              ),
            ),

            const SizedBox(height: 25),
            // Title
            Text("Good coffee is always in season.",
              style: GoogleFonts.lora(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),
            // Description
            Text("Your favorite latte macchiato is just a tap away. Order ahead and skip the line.",
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.black87,
                height: 2,
              ),
            ),

            const SizedBox(height: 25),
            // Button
            MyButton(text: "Get Started", onTap: () {
              // Navigate to the next page
              Navigator.pushNamed(context, '/menu');
            }),
          ],
        ),
      ),
    );
  }
}
