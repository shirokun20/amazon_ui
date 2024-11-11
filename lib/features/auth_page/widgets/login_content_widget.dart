import 'package:amazon_ui/components/di/setup_di.dart';
import 'package:amazon_ui/store/auth_store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget({super.key});

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
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
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe7e7e7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      onChanged: (value) => authStore.onEvent(
                        AuthSetDataEvent(key: 'emailLogin', value: value),
                      ),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Email Id or phone number",
                        hintStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 25, right: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe7e7e7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) => authStore.onEvent(
                              AuthSetDataEvent(
                                key: 'passwordLogin',
                                value: value,
                              ),
                            ),
                            obscureText: !authStore.state.isShowPassword,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => authStore.onEvent(
                            AuthSetShowPasswordEvent(
                              value: !authStore.state.isShowPassword,
                            ),
                          ),
                          icon: Icon(authStore.state.isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, color: Color(0xFFbababa)),
                  ),
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
                    onPressed: () {
                      authStore.onEvent(AuthLoginEvent());
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFFFF9900)),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: authStore.state.isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Login with OTP",
                  style: TextStyle(
                    color: Color(0xFF7f7f7f),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 50,
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
}
