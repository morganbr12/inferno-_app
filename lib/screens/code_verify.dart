import 'package:flutter/material.dart';


class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 34, 1),
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Phone Verification',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Enter OTP code here',
              style: TextStyle(
                  fontSize: 13,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 70,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 70,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 70,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: const TextField(
                    textAlign: TextAlign.center,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'I didn\'t  receive code?',
                  style: TextStyle(
                    color: Theme.of(context).accentColor
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: Text(
                      'Resend a new code',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(203, 160, 68, 1),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  )
              ),
              child: const Text(
                'Verify',
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
