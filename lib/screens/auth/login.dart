import 'package:afrimash/common/config/loading.dart';
import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/screens/Orders/checkout/checkout.dart';
import 'package:afrimash/screens/auth/register.dart';
import 'package:afrimash/screens/home/home.dart';
import 'package:afrimash/service/get_logged_in_details_service.dart';
import 'package:afrimash/service/login_service.dart';
import 'package:afrimash/widgets/common/login_animation.dart';
// import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_banner/dropdown_banner.dart';

import '../../common/base/base_screen.dart';

class LoginScreenArgument {
  final bool fromCart;
  final MainAppProvider mainAppProvider;

  LoginScreenArgument({@required this.fromCart, this.mainAppProvider});
}

class LoginScreen extends StatefulWidget {
  final bool fromCart;
  final MainAppProvider mainAppProvider;

  LoginScreen({this.fromCart = false, this.mainAppProvider});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseScreen<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _emailFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  var parentContext;
  bool isLoading = false;
  bool isAvailableApple = false;
  bool _isSubmitButtonEnabled = false;
  bool isVisible = true;
  // bool _isFormValid() {
  //   return ((_emailFormKey.currentState?.isValid &&
  //       _passwordFormKey.currentState?.isValid));
  // }

  GetLoggedInDetailsService getLoggedInDetailsService =
      GetLoggedInDetailsService();

  validateEmail(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid Email";
    }
  }

  validatePassword(value) {
    if (value.isEmpty || value.trim().length == 0) {
      return "Password can't be empty";
    } else if (value.length <= 8) {
      return "Password must be more than 8 characters";
    }
  }

  LoginService loginService = LoginService();

  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
  }

  userLogin(data) async {
    setState(() => isLoading = true);
    try {
      var response = await loginService.loginUser(data);
      print("Login response: $response");
      var success = response["success"];
      if (success == false) {
        setState(() => isLoading = false);
        _displayMessage("${response['message']}", context, Colors.red);
      } else {
        setState(() => isLoading = false);
        _displayMessage("Login successfully", context, Colors.green);
        widget.fromCart == true
            ? Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => Checkout()))
            : Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomeView()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  // Future<void> afterFirstLayout(BuildContext context) async {
  //   try {
  //     isAvailableApple = await AppleSignIn.isAvailable();
  //     setState(() {});
  //   } catch (e) {
  //     // printLog('[Login] afterFirstLayout error');
  //   }
  // }

  @override
  void dispose() {
    _loginButtonController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _loginButtonController.forward();
    } on TickerCanceled {
      // printLog('[_playAnimation] error');
    }
  }

  Future<Null> _stopAnimation() async {
    try {
      await _loginButtonController.reverse();
      setState(() {
        isLoading = false;
      });
    } on TickerCanceled {
      // printLog('[_stopAnimation] error');
    }
  }

  // void _preloadAddress(BuildContext context) {
  //   Provider.of<CartModel>(context, listen: false).getAddress();
  // }

  // Future _welcomeMessage(user, context) async {
  //   Provider.of<CartModel>(context, listen: false).setUser(user);
  //   if (user.cookie != null &&
  //       (kAdvanceConfig['EnableSyncCartFromWebsite'] ?? true)) {
  //     await Services().widget.syncCartFromWebsite(user.cookie, context);
  //     await Provider.of<PointModel>(context, listen: false)
  //         .getMyPoint(user.cookie);
  //   }

  //   _preloadAddress(context);

  //   if (widget.fromCart) {
  //     Navigator.of(context).pop();
  //   } else {
  //     if (user.name != null) {
  //       Tools.showSnackBar(
  //           Scaffold.of(context), S.of(context).welcome + ' ${user.name} !');
  //     }
  //     final canPop = ModalRoute.of(context).canPop;
  //     if (canPop) {
  //       // When not required login
  //       Navigator.of(context).pop();
  //     } else {
  //       // When required login
  //       await Navigator.of(App.fluxStoreNavigatorKey.currentContext)
  //           .pushReplacementNamed(RouteList.dashboard);
  //     }
  //   }
  // }

  void _displayMessage(message, context, Color color) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.black,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    _scaffoldKey.currentState
      // ignore: deprecated_member_use
      ..removeCurrentSnackBar()
      // ignore: deprecated_member_use
      ..showSnackBar(snackBar);
  }

  // // custom not working
  // void _loginTwitter(context) async {
  //   //showLoading();
  //   await _playAnimation();
  //   await Provider.of<UserModel>(context, listen: false).loginFB(
  //       success: (user) {
  //         //hideLoading();
  //         _stopAnimation();
  //         _welcomeMessage(user, context);
  //       },
  //       fail: (message) {
  //         //hideLoading();
  //         _stopAnimation();
  //         _failMessage(message, context);
  //       },
  //       context: context);
  // }

  @override
  Widget build(BuildContext context) {
    parentContext = context;
    // final appModel = Provider.of<AppModel>(context);
    final screenSize = MediaQuery.of(context).size;

    // var forgetPasswordUrl = Config().forgetPassword;

    // Future launchForgetPassworddWebView(String url) async {
    //   await Navigator.push(
    //     context,
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) =>
    //           WebView(url: url, title: S.of(context).resetPassword),
    //       fullscreenDialog: true,
    //     ),
    //   );
    // }

    // void launchForgetPasswordURL(String url) async {
    //   if (url != null && url != '') {
    //     /// show as webview
    //     await launchForgetPassworddWebView(url);
    //   } else {
    //     /// show as native
    //     await Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => ForgotPassword()),
    //     );
    //   }
    // }

    // void _login(context) async {
    //   if (username.text.isEmpty || password.text.isEmpty) {
    //     print('password is empty')
    //     // Tools.showSnackBar(Scaffold.of(context), S.of(context).pleaseInput);
    //   } else {
    //     await _playAnimation();
    //     await Provider.of<UserModel>(context, listen: false).login(
    //       username: username.text.trim(),
    //       password: password.text.trim(),
    //       success: (user) {
    //         _stopAnimation();
    //         _welcomeMessage(user, context);
    //       },
    //       fail: (message) {
    //         _stopAnimation();
    //         _failMessage(message, context);
    //       },
    //     );
    //   }
    // }

    // void _loginSMS(context) {
    //   Navigator.of(context).pushNamed(
    //     RouteList.loginSMS,
    //     arguments: widget.fromCart,
    //   );
    // }

    // void _loginGoogle(context) async {
    //   await _playAnimation();
    //   await Provider.of<UserModel>(context, listen: false).loginGoogle(
    //       success: (user) {
    //         //hideLoading();
    //         _stopAnimation();
    //         _welcomeMessage(user, context);
    //       },
    //       fail: (message) {
    //         //hideLoading();
    //         _stopAnimation();
    //         _failMessage(message, context);
    //       },
    //       context: context);
    // }
    final provider = Provider.of<MainAppProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: isLoading
          ? Loading()
          : SafeArea(
              child: Builder(
                builder: (context) => GestureDetector(
                  // onTap: () => Utils.hideKeyboard(context),
                  behavior: HitTestBehavior.opaque,
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: screenSize.width /
                                  (2 / (screenSize.height / screenSize.width)),
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: AutofillGroup(
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 40.0),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 100.0,
                                                // width: 70.0,
                                                child: Image.asset(
                                                  'assets/images/logo.png',
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 80.0),
                                    // Text(
                                    //     "${getLoggedInDetailsService.getLoggedInDetails.status}"),
                                    TextFormField(
                                      key: _emailFormKey,
                                      controller: emailController,
                                      autofillHints: [AutofillHints.email],
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      // onSubmitted: (_) => FocusScope.of(context)
                                      //     .requestFocus(emailNode),
                                      decoration: InputDecoration(
                                          labelText: 'Email Address',
                                          hintText: 'Enter email address'),
                                      onChanged: (value) {
                                        setState(() {
                                          _emailFormKey.currentState
                                              ?.validate();
                                        });
                                      },
                                      // ignore: missing_return
                                      validator: (value) {
                                        return validateEmail(value);
                                      },
                                    ),
                                    const SizedBox(height: 12.0),
                                    TextFormField(
                                      key: _passwordFormKey,
                                      controller: passwordController,
                                      autofillHints: [AutofillHints.password],
                                      obscureText: isVisible,
                                      textInputAction: TextInputAction.done,
                                      focusNode: passwordNode,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'Enter Password',
                                        suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isVisible = !isVisible;
                                              });
                                            },
                                            child: Icon(
                                              isVisible
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              size: 18,
                                            )),
                                      ),
                                      // onChanged: (value) {
                                      //   _isFormValid();
                                      //   _passwordFormKey.currentState
                                      //       .validate();
                                      // },
                                      validator: (value) {
                                        return validatePassword(value);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        // onTap: () {
                                        //   // launchForgetPasswordURL(
                                        //       forgetPasswordUrl);
                                        // },
                                        child: Text(
                                          'Forgot your Password?',
                                          style: TextStyle(color: Colors.cyan),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50.0,
                                    ),
                                    StaggerAnimation(
                                        titleButton: 'Sign in',
                                        buttonController:
                                            _loginButtonController.view,
                                        onTap: () {
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState
                                                  .validate()) {
                                            Map<String, dynamic> data = {
                                              "username": emailController.text,
                                              "password":
                                                  passwordController.text,
                                            };
                                            print(data);
                                            userLogin(data);
                                          } else {
                                            setState(() => isLoading = false);
                                            print("Fields must not be empty");
                                          }
                                        }),
                                    Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: <Widget>[
                                        SizedBox(
                                            height: 50.0,
                                            width: 200.0,
                                            child: Divider(
                                                color: Colors.grey.shade300)),
                                        Container(
                                            height: 30,
                                            width: 40,
                                            color: Colors.white),
                                        Text(
                                          'Or',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade400),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // InkWell(
                                        //   // onTap: () => _loginApple(context),
                                        //   child: Container(
                                        //     padding: const EdgeInsets.all(12),
                                        //     decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.circular(40),
                                        //       color: Colors.black87,
                                        //     ),
                                        //     child: const Icon(
                                        //       FontAwesomeIcons.apple,
                                        //       color: Colors.white,
                                        //       size: 24.0,
                                        //     ),
                                        //   ),
                                        // ),

                                        InkWell(
                                          // onTap: () => _loginFacebook(context),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: const Color(0xFF4267B2),
                                            ),
                                            child: const Icon(
                                              FontAwesomeIcons.facebookF,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),

                                        InkWell(
                                          // onTap: () => _loginGoogle(context),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: const Color(0xFF4267B2),
                                            ),
                                            child: const Icon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),

                                        InkWell(
                                          // onTap: () => _loginGoogle(context),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: const Color(0xFFEA4336),
                                            ),
                                            child: const Icon(
                                              FontAwesomeIcons.google,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Don't have an account"),
                                          GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterScreen())),
                                            child: Text(
                                              ' Sign up',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          //   }),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child: Container(
          padding: const EdgeInsets.all(50.0),
          child: kLoadingWidget(context),
        ));
      },
    );
  }

  void hideLoading() {
    Navigator.of(context).pop();
  }
}
