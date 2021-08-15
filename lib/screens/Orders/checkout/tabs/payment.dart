import 'dart:convert';

import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/screens/Orders/checkout/payment_paystack_service.dart';
import 'package:afrimash/screens/Orders/checkout/success.dart';
import 'package:afrimash/service/create_order_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:afrimash/model/main_app_provider.dart';

class Payment extends StatefulWidget {
  final MainAppProvider mainAppProvider;
  final TabController tabController;
  const Payment({Key key, this.tabController, this.mainAppProvider})
      : super(key: key);

  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  int selectedValue;
  int selectedLocation;
  bool isLoading = false;
  SharedPreferences prefs;
  double totalPrice = 0.0;

  CreateOrderService createOrderService = CreateOrderService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalPrice();
  }

  getTotalPrice() async {
    setState(() => isLoading = true);
    prefs = await SharedPreferences.getInstance();
    totalPrice = prefs.getDouble("totalPrice");
    setState(() => isLoading = false);
  }

  generateOrder({payStack, bankTransfer}) async {
    String shippingMethod = prefs.getString("shippingMethod");
    int userID = prefs.getInt("userID");
    int deliverAddressID = prefs.getInt("deliverAddressID");
    List<dynamic> orderItemsTemp = json.decode(prefs.getString('item'));

    // print(orderItemsTemp);

    List<Map<String, dynamic>> orderItems = [];

    orderItemsTemp.forEach((element) {
      var orderDetails = {
        "productId": element['productId'],
        "itemQuantity": element['itemQuantity'],
        "itemPrice": element['itemPrice'],
        "totalPrice": totalPrice,
      };
      orderItems.add(orderDetails);
    });

    print("Pickup: $selectedValue");

    if (selectedValue == 1) {
      Map<String, dynamic> data = {
        "customerId": 10,
        "paymentMethod": payStack,
        "shippingMethod": shippingMethod,
        "deliveryAddress": deliverAddressID,
        "orderItems": orderItems,
      };
      print(data);
      createOrder(data);
    } else if (selectedValue == 2) {
      Map<String, dynamic> data = {
        "customerId": 10,
        "paymentMethod": bankTransfer,
        "shippingMethod": shippingMethod,
        "deliveryAddress": deliverAddressID,
        "orderItems": orderItems,
      };
      print(data);
      createOrder(data);
    }
  }

  void _failMessage(message, context) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    Scaffold.of(context)
      // ignore: deprecated_member_use
      ..removeCurrentSnackBar()
      // ignore: deprecated_member_use
      ..showSnackBar(snackBar);
  }

  createOrder(data) async {
    setState(() => isLoading = true);
    try {
      var response = await createOrderService.createOrder(data);
      print("Create Order response: $response");
      var success = response["success"];
      if (success == false) {
        setState(() => isLoading = false);
        _failMessage(success['message'], context);
      } else {
        setState(() => isLoading = false);
        // DropdownBanner.showBanner(
        //   text: 'Login successful',
        //   color: Colors.green,
        //   textStyle: TextStyle(color: Colors.white),
        // );

        MakePayment(
                ctx: context,
                email: "badaruoluwasegun@gmail.com",
                price: totalPrice)
            .chargeCardAndMakePayment();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = 1;
                        print(selectedValue);
                      });
                    },
                    child: ListTile(
                      title: Text("Debit / Credit Card (Immediate payment)"),
                      leading: Radio(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = 1;
                            print(selectedValue);
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedValue == 1 ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2022 Make sure your card is still valid"),
                            Text(
                                "\u2022 Ensure sufficient balance to cover this transaction")
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = 2;
                        print(selectedValue);
                      });
                    },
                    child: ListTile(
                      title: Text("Bank Transfer"),
                      leading: Radio(
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = 2;
                            print(selectedValue);
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedValue == 2 ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Pay Online With Bank",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 5),
                            Text(
                                "The following six (6) banks allow you to pay through their internet banking and using your bank account number directly, and your order is processed immediately payment goes through."),
                            SizedBox(
                              height: 20,
                            ),
                            Text("\u2022 Wema (Bank Account Number)"),
                            Text("\u2022 Firstbank (Internet Banking)"),
                            Text(
                                "\u2022 Guaranty Trust (Internet banking and USSD code)"),
                            Text("\u2022 Sterling bank (Bank Account Number)"),
                            Text("\u2022 UBA (Bank Account Number)"),
                            Text("\u2022 Zenith Bank (Bank Account Number)"),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Divider(),
                            ),
                            Text(
                              "Our Account Numbers",
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  "Please make payment only to any of the following Afrimash Holding Accounts:"),
                            ),
                            Text(
                              "First Bank Plc",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(text: ' \u2022   Account Name: '),
                                  TextSpan(
                                    text: ' AFRIMASH COMPANY LIMITED',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(text: ' \u2022   Account Number: '),
                                  TextSpan(
                                      text: ' 2035451334',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "UBA Plc",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(text: ' \u2022   Account Name: '),
                                  TextSpan(
                                    text: ' AFRIMASH COMPANY LIMITED',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(text: ' \u2022   Account Number: '),
                                  TextSpan(
                                      text: ' 2129087920',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  "Once you have made payments, you need to send us proof of payment should in case we are unable to match your payment with your order. You can do this on your orders page here. Go to My Account>orders>View>Add Note to upload your proof of payment."),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'Call ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' Afrimash '),
                                  TextSpan(
                                      text:
                                          ' on 0-809-409-1115 if you need help.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedValue = 3;
                        print(selectedValue);
                      });
                    },
                    child: ListTile(
                      title: Text("Wallet Payment"),
                      leading: Radio(
                        value: 3,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = 3;
                            print(selectedValue);
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedValue == 3 ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        padding: const EdgeInsets.all(12),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: const <TextSpan>[
                              TextSpan(text: 'Wallet Balance: '),
                              TextSpan(
                                text: 'N0.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Got an Afrimash coupon code(s)? Use it below:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Coupon Code",
                                labelText: "Coupon Code",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 45,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        color: Constants.primaryColor,
                        elevation: 0.0,
                        onPressed: () {
                          _failMessage("Coupon not available", context);
                        },
                        child: Text(
                          "APPLY COUPON(S)",
                          style: CustomTheme.labelText3
                              .copyWith(color: Colors.white),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "N$totalPrice",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Grand Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "N$totalPrice",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                color: Constants.primaryColor,
                                elevation: 0.0,
                                onPressed: () async {
                                  prefs = await SharedPreferences.getInstance();
                                  if (selectedValue == 1 ||
                                      selectedValue == 2 ||
                                      selectedValue == 3) {
                                    if (selectedValue == 1) {
                                      prefs.setString("PAYSTACK",
                                          "PAYMENT_METHOD_PAYSTACK");
                                      String payStack =
                                          prefs.getString("PAYSTACK");
                                      generateOrder(payStack: payStack);
                                    } else if (selectedValue == 2) {
                                      prefs.setString("BANK_TRANSFER ",
                                          "PAYMENT_METHOD_BANK_TRANSFER");
                                      String bankTransfer =
                                          prefs.getString("BANK_TRANSFER ");
                                      generateOrder(bankTransfer: bankTransfer);
                                    } else if (selectedValue == 3) {}
                                  } else {
                                    _failMessage(
                                        "Select payment method", context);
                                  }
                                },
                                child: Text(
                                  "CONFIRM ORDER",
                                  style: CustomTheme.labelText3.copyWith(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
