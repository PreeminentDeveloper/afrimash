import 'package:afrimash/common/config/constants.dart';
import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/model/main_app_provider.dart';
import 'package:afrimash/service/create_delivery_address_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Delivery extends StatefulWidget {
  final MainAppProvider mainAppProvider;
  final TabController tabController;
  const Delivery({Key key, this.tabController, this.mainAppProvider})
      : super(key: key);

  @override
  DeliveryState createState() => DeliveryState();
}

class DeliveryState extends State<Delivery> {
  final TextEditingController deliveryAddressController =
      TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController deliveryMobileNumberController =
      TextEditingController();

  final GlobalKey<FormFieldState> deliveryAddressFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> stateFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> deliveryMobileNumberFormKey =
      GlobalKey<FormFieldState>();

  CreateDeliveryAddressService createDeliveryAddress =
      CreateDeliveryAddressService();

  bool isLoading = false;
  Map<String, dynamic> locationData;

  @override
  void dispose() {
    deliveryAddressController.dispose();
    stateController.dispose();
    deliveryMobileNumberController.dispose();
    super.dispose();
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

  callCreateDeliveryAddress(data) async {
    setState(() => isLoading = true);
    try {
      var response = await createDeliveryAddress.createDeliveryAddress(data);
      print("Create Delivery Address response: $response");
      var success = response["success"];
      if (success == false) {
        setState(() => isLoading = false);
        _failMessage(success['message'], context);
      } else {
        setState(() => isLoading = false);
        widget.tabController.animateTo((widget.tabController.index + 1) % 3);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  SharedPreferences prefs;
  int selectedValue;
  int selectedLocation;
  final List location = [
    {
      "state": "ABIA",
      "location": "ABA",
      "address":
          "Aba Owerri road, opp. Judies Filling Station, Aba Girls College, Aba."
    },
    {
      "state": "ABIA",
      "location": "UMUAHIA",
      "address": "16 Ohafia Street, Umuahia."
    },
    {
      "state": "ABIA",
      "location": "ABAJI",
      "address": "Old NNPC petrol station (Madiana)."
    },
    {
      "state": "ABUJA",
      "location": "KUBWA",
      "address": "22 Court, by God Is Good Motor Park, Kubwa."
    },
    {
      "state": "ABUJA",
      "location": "GWAGWALADA",
      "address": "Chimero Office At Gwagwalada."
    },
    {"state": "ABUJA", "location": "MARABA", "address": "Giza Plaza, Maraba."},
    {
      "state": "ADAMAWA",
      "location": "YOLA",
      "address":
          "Agro-Allied Enterprises, Damilu, Opposite Yola International Airport."
    },
    {
      "state": "AKWA-IBOM",
      "location": "IKOT-EKPENE",
      "address": "15, Deepway, Ikot-Ekpene, Akwa Ibom."
    },
    {
      "state": "AKWA-IBOM",
      "location": "UYO",
      "address": "Car Wash, Opposite Iran Park, Uyo."
    },
    {
      "state": "ANAMBRA",
      "location": "AWKA",
      "address": "Chisco Park, Opec filling station. Awka."
    },
    {
      "state": "ANAMBRA",
      "location": "ONITSHA",
      "address": "Lagos park, Onitsha."
    },
    {
      "state": "ANAMBRA",
      "location": "NNEWI",
      "address": "Opara Shop, Nnobi Road, Nnewi."
    },
    {
      "state": "ANAMBRA",
      "location": "EKWULOBIA",
      "address": "Keke Park, Ekwulobia."
    },
    {
      "state": "BAYELSA",
      "location": "YENAGOA",
      "address": "Tombia Roundabout at Agro Point."
    },
    {
      "state": "BENUE",
      "location": "MAKURDI",
      "address": "Behind Former Afribank, Wurukum, Makurdi."
    },
    {
      "state": "BENUE",
      "location": "GBOKO",
      "address": "Orcity Shop Along Express Road, Gboko."
    },
    {"state": "BENUE", "location": "OTUKPO", "address": "Okoti House, Otukpo."},
    {
      "state": "DELTA",
      "location": "ASABA",
      "address": "Metros place opposite Grand hotel, Asaba."
    },
    {
      "state": "DELTA",
      "location": "AGBOR",
      "address": "Mr Biggs, Along the road to Asaba, near bridge, Agbor."
    },
    {
      "state": "DELTA",
      "location": "WARRI",
      "address":
          "Magson Filling Station, Near Jack Filling Station, Towards Mercy Land, Benin-Effurun Express Way, Effurun."
    },
    {
      "state": "DELTA",
      "location": "SAPELE",
      "address": "Mega Filling Station before Roundabout, Sapele"
    },
    {"state": "DELTA", "location": "UGHELLI", "address": "Opposite Skye bank."},
    {
      "state": "EBONYI",
      "location": "ABAKALIKI",
      "address": "Spray and do garage, Abakaliki."
    },
    {"state": "EDO", "location": "AUCHI", "address": "We will call you."},
    {
      "state": "EDO",
      "location": "BENIN CITY",
      "address": "Conoil, By-pass, Oluku junction, Benin City."
    },
    {
      "state": "ENUGU",
      "location": "ENUGU",
      "address": "Enugu North Park (Holy Ghost Park)."
    },
    {
      "state": "ENUGU",
      "location": "NSUKKA",
      "address":
          "Feed Depot, Opp. Diamond Bank, along Enugu express Road (after Ogige market), Enugu."
    },
    {"state": "EKITI", "location": "EKITI", "address": "We will contact you."},
    {
      "state": "IMO",
      "location": "OWERRI",
      "address": "Relief Market, beside dust-bin."
    },
    {
      "state": "KADUNA",
      "location": "ABUJA JUNCTION",
      "address": "We will call you."
    },
    {
      "state": "KADUNA",
      "location": "KADUNA",
      "address": "Conoil Filling Station, Mando, Kaduna."
    },
    {
      "state": "KADUNA",
      "location": "ZARIA",
      "address":
          "Kwangila Over High Bridge, Behind Total Filling Station, Zaria."
    },
    {"state": "KATSINA", "location": "KATSINA", "address": "We will call you."},
    {
      "state": "KANO",
      "location": "KANO",
      "address": "Unguwa Uku / Nayibawa Garage, Kano."
    },
    {
      "state": "KEBBI",
      "location": "BIRNI-KEBBI",
      "address": "Jega By Roundabout, Birni-Kebbi."
    },
    {
      "state": "KOGI",
      "location": "ANYIGBA",
      "address": "Total Filling Station, Dekina local government, Anyigba."
    },
    {
      "state": "KOGI",
      "location": "LOKOJA",
      "address": "Nataco Park where Luxurious Bus do park."
    },
    {"state": "KOGI", "location": "OKENE", "address": "Top Feed, Okene."},
    {
      "state": "KWARA",
      "location": "ILORIN",
      "address": "9, Unity(Folawiyo) Road, Ilorin."
    },
    {
      "state": "LAGOS",
      "location": "LAGOS",
      "address": "We will call you for the pickup point."
    },
    {"state": "NASARAWA", "location": "LAFIA", "address": "Lafia."},
    {
      "state": "NIGER",
      "location": "MINNA",
      "address":
          "ECWA Church, Behind Paikoro Police Station, Opposite UK-Bell Art Theatre, Minna."
    },
    {
      "state": "NIGER",
      "location": "SULEJA",
      "address": "Old Minna Garage, Suleja."
    },
    {"state": "OGUN", "location": "OGUN", "address": "We will call you."},
    {
      "state": "ONDO",
      "location": "AKURE",
      "address": "Mania Filling Station, Akure."
    },
    {"state": "ONDO", "location": "ONDO TOWN", "address": "We will call you."},
    {
      "state": "ONDO",
      "location": "OWO",
      "address": "Tunji&Tunji petrol station."
    },
    {"state": "ONDO", "location": "ORE", "address": "Warri Garage, Ore."},
    {"state": "OSUN", "location": "OSOGBO", "address": "We will call you."},
    {"state": "OYO", "location": "IBADAN", "address": "We will call you."},
    {"state": "PLATEAU", "location": "JOS", "address": "Old Bukuru Road, Jos."},
    {
      "state": "RIVERS",
      "location": "PORT-HARCOURT",
      "address":
          "Rivers Transport Corporation (RTC) Park, Along Aba/PH Express Way, Obigbo, Rivers State OR Rukpoku Roundabout, Rukpoku Road, Port Harcourt."
    },
    {"state": "SOKOTO", "location": "SOKOTO", "address": "Old Market, Sokoto."}
  ];

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : SingleChildScrollView(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedValue = 1;
                          print(selectedValue);
                        });
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("Delivery"),
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                key: deliveryAddressFormKey,
                                controller: deliveryAddressController,
                                autofillHints: [AutofillHints.addressCity],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.streetAddress,
                                // onSubmitted: (_) => FocusScope.of(context)
                                //     .requestFocus(emailNode),
                                decoration: InputDecoration(
                                    labelText: 'Enter Delivery Address',
                                    hintText: 'Delivery Address'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                key: stateFormKey,
                                controller: stateController,
                                autofillHints: [AutofillHints.addressState],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.streetAddress,
                                // onSubmitted: (_) => FocusScope.of(context)
                                //     .requestFocus(emailNode),
                                decoration: InputDecoration(
                                    labelText: 'Enter State',
                                    hintText: 'State'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                key: deliveryMobileNumberFormKey,
                                controller: deliveryMobileNumberController,
                                autofillHints: [AutofillHints.telephoneNumber],
                                autocorrect: false,
                                enableSuggestions: false,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                // onSubmitted: (_) => FocusScope.of(context)
                                //     .requestFocus(emailNode),
                                decoration: InputDecoration(
                                    labelText: 'Enter Delivery Mobile Number',
                                    hintText: 'Delivery Mobile Number'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue = 2;
                      print(selectedValue);
                    });
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Pickup"),
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
                        horizontal: 30, vertical: 10),
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          children: [
                            Text(
                                "Please read this for more information about our pick up option"),
                            SizedBox(height: 30),
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: ListView(children: <Widget>[
                                ...location
                                    .asMap()
                                    .map((key, value) => MapEntry(
                                        key,
                                        GestureDetector(
                                          onTap: () {
                                            print(key);
                                            print(location[key].toString());

                                            setState(() {
                                              locationData = location[key];
                                              selectedLocation = key;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  color: selectedLocation != key
                                                      ? Colors.grey.shade100
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: selectedLocation !=
                                                              key
                                                          ? Colors.grey.shade500
                                                          : Colors.green,
                                                      style: BorderStyle.solid,
                                                      width: 2),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            "${value['state']}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Icon(
                                                          selectedLocation !=
                                                                  key
                                                              ? Icons
                                                                  .radio_button_unchecked
                                                              : Icons
                                                                  .check_circle,
                                                          color:
                                                              selectedLocation !=
                                                                      key
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .green,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "${value['location']}",
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text("${value['address']}")
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                            ],
                                          ),
                                        )))
                                    .values
                                    .toList(),
                              ]),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      color: Constants.primaryColor,
                      elevation: 0.0,
                      onPressed: () async {
                        prefs = await SharedPreferences.getInstance();
                        if (selectedValue == 1 || selectedValue == 2) {
                          if (selectedValue == 1) {
                            prefs.setString("shippingMethod", "DELIVERY");
                            prefs.setString("deliveryAddress",
                                deliveryAddressController.text);

                            String address = deliveryAddressController.text;
                            String state = stateController.text;
                            Map<String, dynamic> data = {
                              "address": address,
                              "state": state,
                              // "customerId": prefs.getInt("userID")
                              "customerId": 10
                            };
                            print(data);
                            callCreateDeliveryAddress(data);
                          } else if (selectedValue == 2) {
                            prefs.setString("shippingMethod", "PICK_UP");
                            Map<String, dynamic> data = {
                              "address": locationData['address'],
                              "state": locationData['state'],
                              // "customerId": prefs.getInt("userID")
                              "customerId": 10
                            };
                            print(data);
                            callCreateDeliveryAddress(data);
                          }
                        } else {
                          _failMessage("Select shiping method", context);
                        }
                      },
                      child: Text(
                        // "CONTINUE TO PREVIEW",
                        "CONTINUE TO PAYMENT",
                        style: CustomTheme.labelText3
                            .copyWith(color: Colors.white),
                      )),
                ),
              ],
            )),
          );
  }
}
