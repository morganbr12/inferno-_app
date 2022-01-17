import 'package:flutter/material.dart';


class VerifySignUp extends StatefulWidget {
  const VerifySignUp({Key? key}) : super(key: key);

  @override
  _VerifySignUpState createState() => _VerifySignUpState();
}

class _VerifySignUpState extends State<VerifySignUp> {
  
  void toCodeVerification(BuildContext ctx) {
    Navigator.of(context).pushNamed('/codeverify');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 34, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 220,
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'Verify Your Phone Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Theme.of(context).accentColor
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                      'We have sent you an SMS with a code to the number'
                          ' +1234567890',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: Theme.of(context).accentColor
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: const TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                    ),
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),


                Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: const TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () => toCodeVerification(context),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(203, 160, 68, 1),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  )
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
