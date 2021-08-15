// class ProductsByLowestPrices {
//   List<Null> object;
//   Null errorMsg;
//   Null expiryDate;
//   String timestamp;
//   Null errorCode;
//   String status;

//   ProductsByLowestPrices(
//       {this.object,
//       this.errorMsg,
//       this.expiryDate,
//       this.timestamp,
//       this.errorCode,
//       this.status});

//   ProductsByLowestPrices.fromJson(Map<String, dynamic> json) {
//     if (json['object'] != null) {
//       object = new List<Null>();
//       json['object'].forEach((v) {
//         object.add(new Null.fromJson(v));
//       });
//     }
//     errorMsg = json['errorMsg'];
//     expiryDate = json['expiryDate'];
//     timestamp = json['timestamp'];
//     errorCode = json['errorCode'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.object != null) {
//       data['object'] = this.object.map((v) => v.toJson()).toList();
//     }
//     data['errorMsg'] = this.errorMsg;
//     data['expiryDate'] = this.expiryDate;
//     data['timestamp'] = this.timestamp;
//     data['errorCode'] = this.errorCode;
//     data['status'] = this.status;
//     return data;
//   }
// }
