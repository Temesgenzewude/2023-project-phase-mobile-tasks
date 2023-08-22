import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _expertiseController = TextEditingController();
  bool _isObscureText = true;
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 21.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/a2sv_logo_blue.png',
                        width: 141.w,
                        height: 54.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 54.h),
                  Stack(children: [
                    Container(
                      height: 1000.h,
                      padding: EdgeInsets.only(top: 24.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r)),
                        color: const Color(0xFF376AED),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0.0),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isLogin = true;
                                });
                                _formKey.currentState?.reset();
                              },
                              child: Text('LOGIN',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: "UrbanistBold",
                                      color: _isLogin
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.75)))),
                          SizedBox(width: 84.w),
                          ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0.0),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isLogin = false;
                                });
                                _formKey.currentState?.reset();
                              },
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: "UrbanistBold",
                                      color: _isLogin
                                          ? Colors.white.withOpacity(0.75)
                                          : Colors.white))),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 96.h,
                      left: 0,
                      right: 0,
                      height: 1000.h,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 32.h, left: 40.w, right: 40.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.r),
                              topRight: Radius.circular(25.r)),
                          color: Colors.white,
                        ),
                        child: _isLogin
                            ? showLoginComponent()
                            : showSignUpComponent(),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Column showLoginComponent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Welcome Back!",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "UrbanistSemiBold",
              color: Color(0xFF0D253C))),
      SizedBox(height: 20.h),
      Text(
        "Sign in with your account",
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: "PoppinsBlack",
          color: Color(0xFF2D4379),
        ),
      ),
      SizedBox(height: 37.h),
      Form(
        key: _formKey,
        child: Column(children: [
          customTextFormField(
            controller: _usernameController,
            labelText: "Username",
          ),
          SizedBox(height: 10.h),
          passwordTextFormField(),
          SizedBox(height: 137.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print("username: ${_usernameController.text}");
                    print("password: ${_passwordController.text}");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF376AED)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    )),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "UrbanistBold",
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "PoppinsBlack",
                  color: Color(0xFF2D4379),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Reset here",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "UrbanistMedium",
                    color: Color(0xFF376AED),
                  ),
                ),
              ),
            ],
          ),
        ]),
      )
    ]);
  }

  Column showSignUpComponent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Welcome",
          style: TextStyle(
              fontSize: 24.sp,
              fontFamily: "UrbanistSemiBold",
              color: Color(0xFF0D253C))),
      SizedBox(height: 20.h),
      Text(
        "provide credentials to sign up",
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: "PoppinsBlack",
          color: Color(0xFF2D4379),
        ),
      ),
      SizedBox(height: 37.h),
      Form(
        key: _formKey,
        child: Column(children: [
          customTextFormField(
            controller: _fullNameController,
            labelText: "Full Name",
          ),
          SizedBox(height: 10.h),
          customTextFormField(
            controller: _usernameController,
            labelText: "Username",
          ),
          SizedBox(height: 10.h),
          passwordTextFormField(),
          SizedBox(height: 10.h),
          customTextFormField(
            controller: _expertiseController,
            labelText: "Expertise",
          ),
          SizedBox(height: 10.h),
          customTextFormField(
            controller: _bioController,
            labelText: "Short Bio",
          ),
          SizedBox(height: 137.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print("username: ${_usernameController.text}");
                    print("password: ${_passwordController.text}");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF376AED)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    )),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "UrbanistBold",
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account already?",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "PoppinsBlack",
                  color: Color(0xFF2D4379),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = true;
                  });
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "UrbanistMedium",
                    color: Color(0xFF376AED),
                  ),
                ),
              ),
            ],
          ),
        ]),
      )
    ]);
  }

  SizedBox passwordTextFormField() {
    return SizedBox(
      height: 66.h,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
        obscureText: _isObscureText,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontFamily: "UrbanistItalicThin",
            color: Color(0xFF2D4379),
          ),
          contentPadding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: TextButton(
            onPressed: () {
              setState(() {
                _isObscureText = !_isObscureText;
              });
            },
            child: Text(
              _isObscureText ? "Show" : "Hide",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "UrbanistMedium",
                color: _isObscureText ? Color(0xFF376AED) : Colors.red[300],
              ),
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: "UrbanistMedium",
          color: Color(0xFF0D253C),
        ),
      ),
    );
  }
}

class customTextFormField extends StatelessWidget {
  const customTextFormField({
    super.key,
    required TextEditingController controller,
    required this.labelText,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66.h,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _controller,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: "UrbanistItalicThin",
              color: Color(0xFF2D4379),
            ),
            contentPadding: EdgeInsets.only(top: 5.h, bottom: 5.h),
            floatingLabelBehavior: FloatingLabelBehavior.always),
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: "UrbanistMedium",
          color: Color(0xFF0D253C),
        ),
      ),
    );
  }
}
