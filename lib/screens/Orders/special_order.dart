import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/screens/Orders/widget/custom_date.dart';
import 'package:afrimash/service/special_order_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:intl/intl.dart';

class SpecialOrder extends StatefulWidget {
  // const SpecialOrder({ Key? key }) : super(key: key);

  @override
  _SpecialOrderState createState() => _SpecialOrderState();
}

class _SpecialOrderState extends State<SpecialOrder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final GlobalKey<FormFieldState> _productNameFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _quantityFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _descriptionFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _noteFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _nameFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _emailFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _mobileNumberFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _addressFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _locationFormKey =
      GlobalKey<FormFieldState>();

  SepcialOrderService sepcialOrderService = SepcialOrderService();

  bool isLoading = false;

  @override
  void dispose() {
    productNameController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
    noteController.dispose();
    nameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    locationController.dispose();
    super.dispose();
  }

  specialOrder(data) async {
    setState(() => isLoading = true);
    try {
      var response = await sepcialOrderService.specialOrder(data);
      print("Login response: $response");
      var success = response["success"];
      if (success == false) {
        setState(() => isLoading = false);
        _displayMessage("${response['message']}", context, Colors.red);
      } else {
        setState(() => isLoading = false);
        _displayMessage("Login successfully", context, Colors.green);
        // Navigator.pushReplacement(
        //         context, MaterialPageRoute(builder: (_) => HomeView()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

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

  validateEmail(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid Email";
    }
  }

  validateField(value) {
    if (value.isEmpty || value.trim().length == 0) {
      return "Field can't be empty";
    }
  }

  DateTime _dateTime;
  String deliveryDate;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Loading()
          : SafeArea(
              child: Builder(
                builder: (context) => GestureDetector(
                    // onTap: () => Utils.hideKeyboard(context),
                    behavior: HitTestBehavior.opaque,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Make Large or Special Purchases at Good Rates",
                                  textAlign: TextAlign.center,
                                  style: CustomTheme.headline3),
                              SizedBox(
                                height: 20,
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: RichText(
                              //     strutStyle: StrutStyle(
                              //       height: 1.4,
                              //     ),
                              //     text: TextSpan(
                              //         style: CustomTheme.textContent,
                              //         children: <TextSpan>[
                              //           TextSpan(text: "Make "),
                              //           TextSpan(
                              //               text:
                              //                   "large or special purchases at a good bargain.",
                              //               style: CustomTheme.textContent
                              //                   .copyWith(fontWeight: FontWeight.bold)),
                              //           TextSpan(
                              //               text:
                              //                   " Get quotations from Afrimash and make payments safely using Afrimash Holding Account. Learn more about our"),
                              //           TextSpan(
                              //               text: " Buyer Protection Service ",
                              //               style: CustomTheme.textContent
                              //                   .copyWith(color: Colors.cyan)),
                              //         ]),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Text(
                              //   "We will provide you a high level of support as well as a dedicated relationship manager to ensure you get a smooth and hitch-free shopping experience with us.",
                              //   style: CustomTheme.textContent,
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Text(
                              //   "Enter your detailed specification here, and we would reply you with our quotations.",
                              //   style: CustomTheme.textContent,
                              // ),

                              // Product Information
                              SizedBox(
                                height: 20,
                              ),
                              Text("Product Information",
                                  textAlign: TextAlign.left,
                                  style: CustomTheme.headline3),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Product Name",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter product name",
                                    hintStyle: CustomTheme.labelText),
                                key: _productNameFormKey,
                                controller: productNameController,
                                // autofillHints: [AutofillHints.name],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  setState(() {
                                    _productNameFormKey.currentState
                                        ?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Estimated Quantity",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter quantity",
                                    hintStyle: CustomTheme.labelText),
                                key: _quantityFormKey,
                                controller: quantityController,
                                // autofillHints: [AutofillHints.telephoneNumber],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    _quantityFormKey.currentState?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Detailed Specification",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter description",
                                    hintStyle: CustomTheme.labelText),
                                key: _descriptionFormKey,
                                controller: descriptionController,
                                // autofillHints: [AutofillHints.addressCity],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    _descriptionFormKey.currentState
                                        ?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),

                              // Delivery Information
                              SizedBox(
                                height: 40,
                              ),
                              Text("Delivery Information",
                                  textAlign: TextAlign.left,
                                  style: CustomTheme.headline3),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Name",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter your name",
                                    hintStyle: CustomTheme.labelText),
                                key: _nameFormKey,
                                controller: nameController,
                                autofillHints: [AutofillHints.name],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  setState(() {
                                    _nameFormKey.currentState?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Email",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter email",
                                    hintStyle: CustomTheme.labelText),
                                key: _emailFormKey,
                                controller: emailController,
                                autofillHints: [AutofillHints.email],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  setState(() {
                                    _emailFormKey.currentState?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateEmail(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Mobile Number",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter mobile number",
                                    hintStyle: CustomTheme.labelText),
                                key: _mobileNumberFormKey,
                                controller: mobileNumberController,
                                autofillHints: [AutofillHints.telephoneNumber],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    _mobileNumberFormKey.currentState
                                        ?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Location",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter your location",
                                    hintStyle: CustomTheme.labelText),
                                key: _locationFormKey,
                                controller: locationController,
                                autofillHints: [AutofillHints.addressState],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    _locationFormKey.currentState?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Expected Delivery Date",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomDate(
                                // errorText: widget.provider.dob.error,
                                textHint: _dateTime == null
                                    ? "yyyy-mm-dd"
                                    : deliveryDate,
                                hintColor: _dateTime == null
                                    ? Colors.grey
                                    : Colors.black,
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                onTap: () {
                                  FocusManager.instance.primaryFocus.unfocus();
                                  showDatePicker(
                                          context: context,
                                          initialDate: _dateTime == null
                                              ? DateTime.now()
                                              : _dateTime,
                                          firstDate: DateTime(1870),
                                          lastDate: DateTime(2030))
                                      .then((date) => setState(() {
                                            if (date != null) {
                                              _dateTime = date;
                                              deliveryDate =
                                                  DateFormat('yyyy-MM-dd hh:mm')
                                                      .format(_dateTime);
                                              // widget.provider.seDeliveryDate(deliveryDate);
                                              print(deliveryDate.trim());
                                            } else {}
                                          }));
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Note",
                                style: CustomTheme.titleText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Drop a note",
                                    hintStyle: CustomTheme.labelText),
                                key: _noteFormKey,
                                controller: noteController,
                                autofillHints: [
                                  AutofillHints.addressCityAndState
                                ],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.streetAddress,
                                onChanged: (value) {
                                  setState(() {
                                    _noteFormKey.currentState?.validate();
                                  });
                                },
                                // ignore: missing_return
                                validator: (value) {
                                  return validateField(value);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: FlatButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    onPressed: () {
                                      if (_formKey.currentState != null &&
                                          _formKey.currentState.validate()) {
                                        Map<String, dynamic> data = {
                                          "customerName": nameController.text,
                                          "description":
                                              descriptionController.text,
                                          "quantity": quantityController.text,
                                          "notes": noteController.text,
                                          "email": emailController.text,
                                          "mobileNo":
                                              mobileNumberController.text,
                                          "productName":
                                              productNameController.text,
                                          "location": locationController.text,
                                          "expectedDeliveryDate":
                                              deliveryDate.trim(),
                                        };
                                        print(data);
                                        specialOrder(data);
                                      } else {
                                        setState(() => isLoading = false);
                                        print("Fields must not be empty");
                                      }
                                    },
                                    color: CustomTheme.green2,
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
    );
  }
}
