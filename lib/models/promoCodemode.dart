import 'dart:convert';

class PromoCode {
  String? Code;
  String? Discount;
  String? DiscountAmount;
  String? DiscountType;
  String? EndDate;
  String? Message;
  String? OrderAmount;
  String? Repeat;
  String? StartDate;
  String? Status;
  String? UserNumber;
  PromoCode({
    this.Code,
    this.Discount,
    this.DiscountAmount,
    this.DiscountType,
    this.EndDate,
    this.Message,
    this.OrderAmount,
    this.Repeat,
    this.StartDate,
    this.Status,
    this.UserNumber,
  });

  PromoCode copyWith({
    String? Code,
    String? Discount,
    String? DiscountAmount,
    String? DiscountType,
    String? EndDate,
    String? Message,
    String? OrderAmount,
    String? Repeat,
    String? StartDate,
    String? Status,
    String? UserNumber,
  }) {
    return PromoCode(
      Code: Code ?? this.Code,
      Discount: Discount ?? this.Discount,
      DiscountAmount: DiscountAmount ?? this.DiscountAmount,
      DiscountType: DiscountType ?? this.DiscountType,
      EndDate: EndDate ?? this.EndDate,
      Message: Message ?? this.Message,
      OrderAmount: OrderAmount ?? this.OrderAmount,
      Repeat: Repeat ?? this.Repeat,
      StartDate: StartDate ?? this.StartDate,
      Status: Status ?? this.Status,
      UserNumber: UserNumber ?? this.UserNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Code': Code,
      'Discount': Discount,
      'DiscountAmount': DiscountAmount,
      'DiscountType': DiscountType,
      'EndDate': EndDate,
      'Message': Message,
      'OrderAmount': OrderAmount,
      'Repeat': Repeat,
      'StartDate': StartDate,
      'Status': Status,
      'UserNumber': UserNumber,
    };
  }

  factory PromoCode.fromMap(Map<String, dynamic> map) {
    return PromoCode(
      Code: map['Code'],
      Discount: map['Discount'],
      DiscountAmount: map['DiscountAmount'],
      DiscountType: map['DiscountType'],
      EndDate: map['EndDate'],
      Message: map['Message'],
      OrderAmount: map['OrderAmount'],
      Repeat: map['Repeat'],
      StartDate: map['StartDate'],
      Status: map['Status'],
      UserNumber: map['UserNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PromoCode.fromJson(String source) =>
      PromoCode.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PromoCode(Code: $Code, Discount: $Discount, DiscountAmount: $DiscountAmount, DiscountType: $DiscountType, EndDate: $EndDate, Message: $Message, OrderAmount: $OrderAmount, Repeat: $Repeat, StartDate: $StartDate, Status: $Status, UserNumber: $UserNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PromoCode &&
        other.Code == Code &&
        other.Discount == Discount &&
        other.DiscountAmount == DiscountAmount &&
        other.DiscountType == DiscountType &&
        other.EndDate == EndDate &&
        other.Message == Message &&
        other.OrderAmount == OrderAmount &&
        other.Repeat == Repeat &&
        other.StartDate == StartDate &&
        other.Status == Status &&
        other.UserNumber == UserNumber;
  }

  @override
  int get hashCode {
    return Code.hashCode ^
        Discount.hashCode ^
        DiscountAmount.hashCode ^
        DiscountType.hashCode ^
        EndDate.hashCode ^
        Message.hashCode ^
        OrderAmount.hashCode ^
        Repeat.hashCode ^
        StartDate.hashCode ^
        Status.hashCode ^
        UserNumber.hashCode;
  }
}
