import 'package:amazon_ui/components/di/setup_di.dart';
import 'package:amazon_ui/store/auth_store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterContentWidget extends StatefulWidget {
  const RegisterContentWidget({super.key});

  @override
  State<RegisterContentWidget> createState() => _RegisterContentWidgetState();
}

class _RegisterContentWidgetState extends State<RegisterContentWidget> {
  AuthStore authStore = sl<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Observer(builder: (_) {
                  return _formField(
                    hintText: "Full Name",
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _formField(
                    hintText: "Email",
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _formField(
                    hintText: "Password",
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _formField(
                    hintText: "Re-enter Password",
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Need Help?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, color: Color(0xFFbababa)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (_) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFFFF9900)),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        "Sign-up",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "English",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Indonesian",
                  style: TextStyle(
                    color: Color(0xFF7f7f7f),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Sundanese",
                  style: TextStyle(
                    color: Color(0xFF7f7f7f),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _formField({
    String? hintText,
    Function(String)? onChanged,
    TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFe7e7e7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
