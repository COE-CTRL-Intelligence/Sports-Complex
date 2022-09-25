import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xC7FFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 500),
          child: Column(
            children: const [
              SizedBox(
                height: 15,
                width: 80,
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 500,
                child: Text(
                  ' \n______________________________________________________________',
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 0,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 230,
                width: 400,
                child: Text(
                  '              Sportify is a mobile app for \n              students of Kwame Nkrumah University of \n              Science and Technology and non-stuudent \n              which serves as a mobile \n              companion for the GUSSS sports complex.\n              Its main objective is to bring \n              functions related to using \n              the GUSSS sports complex to mobile \n              devices.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 100,
                child: Text(
                  '\n   Developer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 200,
                child: Text(
                  '        Kwame Nkrumah \n     University of Science \n      and Technology \n             (KNUST)',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
