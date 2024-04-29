// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

ConfigModel configModelFromJson(String str) =>
    ConfigModel.fromJson(json.decode(str));

String configModelToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  String? termsAndConditions;
  String? aboutUs;
  String? privacyPolicy;
  String? businessName;
  String? logo;
  String? phone;
  String? emailAddress;
  String? address;
  dynamic footerText;
  dynamic serviceCoinOnReferral;
  dynamic currency;
  dynamic timezone;
  dynamic customerVerification;
  dynamic orderDeliveryVerification;
  dynamic minimumShippingCharge;
  dynamic perKmShippingCharge;
  dynamic currencySymbolPosition;
  dynamic scheduleOrder;
  dynamic orderConfirmationModel;
  dynamic tax;
  dynamic adminCommission;
  dynamic country;
  String? defaultLocation;
  dynamic adminOrderNotification;
  dynamic freeDeliveryOver;
  dynamic dmMaximumOrders;
  dynamic timeformat;
  dynamic canceledByRestaurant;
  dynamic canceledByDeliveryman;
  dynamic showDmEarning;
  dynamic toggleVegNonVeg;
  dynamic toggleDmRegistration;
  dynamic toggleRestaurantRegistration;
  String? mailConfig;
  String? razorPay;
  String? maintenanceMode;
  String? razorPaySecret;

  ConfigModel({
    this.termsAndConditions,
    this.aboutUs,
    this.privacyPolicy,
    this.businessName,
    this.logo,
    this.phone,
    this.emailAddress,
    this.address,
    this.footerText,
    this.serviceCoinOnReferral,
    this.currency,
    this.timezone,
    this.customerVerification,
    this.orderDeliveryVerification,
    this.minimumShippingCharge,
    this.perKmShippingCharge,
    this.currencySymbolPosition,
    this.scheduleOrder,
    this.orderConfirmationModel,
    this.tax,
    this.adminCommission,
    this.country,
    this.defaultLocation,
    this.adminOrderNotification,
    this.freeDeliveryOver,
    this.dmMaximumOrders,
    this.timeformat,
    this.canceledByRestaurant,
    this.canceledByDeliveryman,
    this.showDmEarning,
    this.toggleVegNonVeg,
    this.toggleDmRegistration,
    this.toggleRestaurantRegistration,
    this.mailConfig,
    this.razorPay,
    this.maintenanceMode,
    this.razorPaySecret,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        termsAndConditions: json["terms_and_conditions"],
        aboutUs: json["about_us"],
        privacyPolicy: json["privacy_policy"],
        businessName: json["business_name"],
        logo: json["logo"],
        phone: json["phone"],
        emailAddress: json["email_address"],
        address: json["address"],
        footerText: json["footer_text"],
        serviceCoinOnReferral: json["service_coin_on_referral"],
        currency: json["currency"],
        timezone: json["timezone"],
        customerVerification: json["customer_verification"],
        orderDeliveryVerification: json["order_delivery_verification"],
        minimumShippingCharge: json["minimum_shipping_charge"],
        perKmShippingCharge: json["per_km_shipping_charge"],
        currencySymbolPosition: json["currency_symbol_position"],
        scheduleOrder: json["schedule_order"],
        orderConfirmationModel: json["order_confirmation_model"],
        tax: json["tax"],
        adminCommission: json["admin_commission"],
        country: json["country"],
        defaultLocation: json["default_location"],
        adminOrderNotification: json["admin_order_notification"],
        freeDeliveryOver: json["free_delivery_over"],
        dmMaximumOrders: json["dm_maximum_orders"],
        timeformat: json["timeformat"],
        canceledByRestaurant: json["canceled_by_restaurant"],
        canceledByDeliveryman: json["canceled_by_deliveryman"],
        showDmEarning: json["show_dm_earning"],
        toggleVegNonVeg: json["toggle_veg_non_veg"],
        toggleDmRegistration: json["toggle_dm_registration"],
        toggleRestaurantRegistration: json["toggle_restaurant_registration"],
        mailConfig: json["mail_config"],
        razorPay: json["razor_pay"],
        maintenanceMode: json["maintenance_mode"],
        razorPaySecret: json["razor_pay_secret"],
      );

  Map<String, dynamic> toJson() => {
        "terms_and_conditions": termsAndConditions,
        "about_us": aboutUs,
        "privacy_policy": privacyPolicy,
        "business_name": businessName,
        "logo": logo,
        "phone": phone,
        "email_address": emailAddress,
        "address": address,
        "footer_text": footerText,
        "service_coin_on_referral": serviceCoinOnReferral,
        "currency": currency,
        "timezone": timezone,
        "customer_verification": customerVerification,
        "order_delivery_verification": orderDeliveryVerification,
        "minimum_shipping_charge": minimumShippingCharge,
        "per_km_shipping_charge": perKmShippingCharge,
        "currency_symbol_position": currencySymbolPosition,
        "schedule_order": scheduleOrder,
        "order_confirmation_model": orderConfirmationModel,
        "tax": tax,
        "admin_commission": adminCommission,
        "country": country,
        "default_location": defaultLocation,
        "admin_order_notification": adminOrderNotification,
        "free_delivery_over": freeDeliveryOver,
        "dm_maximum_orders": dmMaximumOrders,
        "timeformat": timeformat,
        "canceled_by_restaurant": canceledByRestaurant,
        "canceled_by_deliveryman": canceledByDeliveryman,
        "show_dm_earning": showDmEarning,
        "toggle_veg_non_veg": toggleVegNonVeg,
        "toggle_dm_registration": toggleDmRegistration,
        "toggle_restaurant_registration": toggleRestaurantRegistration,
        "mail_config": mailConfig,
        "razor_pay": razorPay,
        "maintenance_mode": maintenanceMode,
        "razor_pay_secret": razorPaySecret,
      };
}
