// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4F1EE),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth =
              constraints.maxWidth; // Calculate screenWidth from constraints

          // Determine the desired height and width based on screen size
          double firstContainerHeight = screenHeight * 0.3;
          double secondContainerWidth = screenWidth * 0.2;

          // Determine the left position based on screen size
          double leftPosition = screenWidth * 0.4;

          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: screenWidth, // Set maximum width to the screen width
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center content vertically
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DescriptionExpandable(
                      initialText:
                          "I'm Soumya Wats, a fourth-year Information Science & Engineering student at Dr. Ambedkar Institute of Technology. My academic journey has given me a strong programming foundation, and I actively engage in projects and hackathons, honing my problem-solving skills. I believe in the power of collaboration, constantly seeking opportunities to learn and grow in this dynamic tech world. Besides academics, I enjoy reading and listening to podcasts. My goal is to make a meaningful impact in the tech industry through innovation, continuous learning, and a deep commitment to excellence.",
                      maxWords: 50,
                      screenWidth:
                          screenWidth, // Pass screenWidth to DescriptionExpandable
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: screenWidth,
                          child: SingleChildScrollView(
                            child: DescriptionExpandable1(
                              initialText:
                                  "As a student who has been working in dart and flutter for almost over a year and has created multiple personal projects implementing various features, I am confident that I can bring a strong foundation to this role. Furthermore, I believe my collaborative nature and adaptability will contribute to the positive team dynamic at your organization. I am committed to continuous learning and like to stay updated regarding android development specially in flutter, further enhancing my expertise as a flutter developer. Overall, I am excited about the opportunity to contribute to your organization's success and leverage my skills to drive as a flutter developer.",
                              maxWords: 50,
                              screenWidth:
                                  screenWidth, // Pass screenWidth to DescriptionExpandable1
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: leftPosition,
                        width: secondContainerWidth,
                        height: screenHeight * 0.06,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFDEDAF4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cover Letter',
                                style: TextStyle(
                                  fontSize: screenWidth > 500
                                      ? screenWidth * 0.022
                                      : screenWidth * 0.022,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DescriptionExpandable extends StatefulWidget {
  final String initialText;
  final int maxWords;
  final double screenWidth;

  const DescriptionExpandable({
    super.key,
    required this.initialText,
    required this.maxWords,
    required this.screenWidth,
  });

  // ignore: duplicate_ignore
  @override
  _DescriptionExpandableState createState() => _DescriptionExpandableState();
}

class _DescriptionExpandableState extends State<DescriptionExpandable> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = isExpanded
        ? widget.initialText
        : ('${widget.initialText.split(' ').take(widget.maxWords).join(' ')}...');

    double greenContainerHeight = widget.screenWidth * 0.1;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(2, 2), // Offset of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          // Use SingleChildScrollView here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDAF4),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: widget.screenWidth > 500
                        ? widget.screenWidth * 0.022
                        : widget.screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                text,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: widget.screenWidth > 500
                      ? widget.screenWidth * 0.018
                      : widget.screenWidth * 0.035,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[200],
                ),
                height: greenContainerHeight, // Green-colored container
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionExpandable1 extends StatefulWidget {
  final String initialText;
  final int maxWords;
  final double screenWidth;

  const DescriptionExpandable1({
    super.key,
    required this.initialText,
    required this.maxWords,
    required this.screenWidth,
  });

  @override
  _DescriptionExpandableState1 createState() => _DescriptionExpandableState1();
}

class _DescriptionExpandableState1 extends State<DescriptionExpandable1> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = isExpanded
        ? '${widget.initialText.split(' ').take(widget.maxWords).join(' ')}...'
        : widget.initialText;

    double greenContainerHeight = widget.screenWidth * 0.1;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          // Use SingleChildScrollView here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: widget.screenWidth > 500
                      ? widget.screenWidth * 0.018
                      : widget.screenWidth * 0.035,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[200],
                ),
                height: greenContainerHeight, // Green-colored container
              ),
            ],
          ),
        ),
      ),
    );
  }
}
