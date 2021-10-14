// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferred languages`
  String get select_your_preferred_languages {
    return Intl.message(
      'Select your preferred languages',
      name: 'select_your_preferred_languages',
      desc: '',
      args: [],
    );
  }

  /// `Order Id`
  String get order_id {
    return Intl.message(
      'Order Id',
      name: 'order_id',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Payment Mode`
  String get payment_mode {
    return Intl.message(
      'Payment Mode',
      name: 'payment_mode',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Extras`
  String get extras {
    return Intl.message(
      'Extras',
      name: 'extras',
      desc: '',
      args: [],
    );
  }

  /// `Faq`
  String get faq {
    return Intl.message(
      'Faq',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `All data`
  String get all_data {
    return Intl.message(
      'All data',
      name: 'all_data',
      desc: '',
      args: [],
    );
  }

  /// `Help & Supports`
  String get help_supports {
    return Intl.message(
      'Help & Supports',
      name: 'help_supports',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get app_language {
    return Intl.message(
      'App Language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `I forgot password ?`
  String get i_forgot_password {
    return Intl.message(
      'I forgot password ?',
      name: 'i_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `I don't have an account?`
  String get i_dont_have_an_account {
    return Intl.message(
      'I don\'t have an account?',
      name: 'i_dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `TAX`
  String get tax {
    return Intl.message(
      'TAX',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Profile Settings`
  String get profile_settings {
    return Intl.message(
      'Profile Settings',
      name: 'profile_settings',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get app_settings {
    return Intl.message(
      'App Settings',
      name: 'app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help_support {
    return Intl.message(
      'Help & Support',
      name: 'help_support',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start with register!`
  String get lets_start_with_register {
    return Intl.message(
      'Let\'s Start with register!',
      name: 'lets_start_with_register',
      desc: '',
      args: [],
    );
  }

  /// `Should be more than 3 letters`
  String get should_be_more_than_3_letters {
    return Intl.message(
      'Should be more than 3 letters',
      name: 'should_be_more_than_3_letters',
      desc: '',
      args: [],
    );
  }

  /// `John Doe`
  String get john_doe {
    return Intl.message(
      'John Doe',
      name: 'john_doe',
      desc: '',
      args: [],
    );
  }

  /// `Should be a valid email`
  String get should_be_a_valid_email {
    return Intl.message(
      'Should be a valid email',
      name: 'should_be_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Should be more than 6 letters`
  String get should_be_more_than_6_letters {
    return Intl.message(
      'Should be more than 6 letters',
      name: 'should_be_more_than_6_letters',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `I have account? Back to login`
  String get i_have_account_back_to_login {
    return Intl.message(
      'I have account? Back to login',
      name: 'i_have_account_back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Tracking Order`
  String get tracking_order {
    return Intl.message(
      'Tracking Order',
      name: 'tracking_order',
      desc: '',
      args: [],
    );
  }

  /// `Discover & Explorer`
  String get discover__explorer {
    return Intl.message(
      'Discover & Explorer',
      name: 'discover__explorer',
      desc: '',
      args: [],
    );
  }

  /// `Reset Cart?`
  String get reset_cart {
    return Intl.message(
      'Reset Cart?',
      name: 'reset_cart',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shopping_cart {
    return Intl.message(
      'Shopping Cart',
      name: 'shopping_cart',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start with Login!`
  String get lets_start_with_login {
    return Intl.message(
      'Let\'s Start with Login!',
      name: 'lets_start_with_login',
      desc: '',
      args: [],
    );
  }

  /// `Should be more than 3 characters`
  String get should_be_more_than_3_characters {
    return Intl.message(
      'Should be more than 3 characters',
      name: 'should_be_more_than_3_characters',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Application Preferences`
  String get application_preferences {
    return Intl.message(
      'Application Preferences',
      name: 'application_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help__support {
    return Intl.message(
      'Help & Support',
      name: 'help__support',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message(
      'Light Mode',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get log_out {
    return Intl.message(
      'Log out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `D'ont have any item in your cart`
  String get dont_have_any_item_in_your_cart {
    return Intl.message(
      'D\'ont have any item in your cart',
      name: 'dont_have_any_item_in_your_cart',
      desc: '',
      args: [],
    );
  }

  /// `Start Exploring`
  String get start_exploring {
    return Intl.message(
      'Start Exploring',
      name: 'start_exploring',
      desc: '',
      args: [],
    );
  }

  /// `D'ont have any item in the notification list`
  String get dont_have_any_item_in_the_notification_list {
    return Intl.message(
      'D\'ont have any item in the notification list',
      name: 'dont_have_any_item_in_the_notification_list',
      desc: '',
      args: [],
    );
  }

  /// `Payment Settings`
  String get payment_settings {
    return Intl.message(
      'Payment Settings',
      name: 'payment_settings',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid number`
  String get not_a_valid_number {
    return Intl.message(
      'Not a valid number',
      name: 'not_a_valid_number',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid date`
  String get not_a_valid_date {
    return Intl.message(
      'Not a valid date',
      name: 'not_a_valid_date',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid CVC`
  String get not_a_valid_cvc {
    return Intl.message(
      'Not a valid CVC',
      name: 'not_a_valid_cvc',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid full name`
  String get not_a_valid_full_name {
    return Intl.message(
      'Not a valid full name',
      name: 'not_a_valid_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid email`
  String get not_a_valid_email {
    return Intl.message(
      'Not a valid email',
      name: 'not_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid phone`
  String get not_a_valid_phone {
    return Intl.message(
      'Not a valid phone',
      name: 'not_a_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid address`
  String get not_a_valid_address {
    return Intl.message(
      'Not a valid address',
      name: 'not_a_valid_address',
      desc: '',
      args: [],
    );
  }

  /// `Not a valid biography`
  String get not_a_valid_biography {
    return Intl.message(
      'Not a valid biography',
      name: 'not_a_valid_biography',
      desc: '',
      args: [],
    );
  }

  /// `Your biography`
  String get your_biography {
    return Intl.message(
      'Your biography',
      name: 'your_biography',
      desc: '',
      args: [],
    );
  }

  /// `Your Address`
  String get your_address {
    return Intl.message(
      'Your Address',
      name: 'your_address',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Recents Search`
  String get recents_search {
    return Intl.message(
      'Recents Search',
      name: 'recents_search',
      desc: '',
      args: [],
    );
  }

  /// `Verify your internet connection`
  String get verify_your_internet_connection {
    return Intl.message(
      'Verify your internet connection',
      name: 'verify_your_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Carts refreshed successfully`
  String get carts_refreshed_successfuly {
    return Intl.message(
      'Carts refreshed successfully',
      name: 'carts_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Category refreshed successfully`
  String get category_refreshed_successfuly {
    return Intl.message(
      'Category refreshed successfully',
      name: 'category_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Notifications refreshed successfully`
  String get notifications_refreshed_successfuly {
    return Intl.message(
      'Notifications refreshed successfully',
      name: 'notifications_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Order refreshed successfully`
  String get order_refreshed_successfuly {
    return Intl.message(
      'Order refreshed successfully',
      name: 'order_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Orders refreshed successfully`
  String get orders_refreshed_successfuly {
    return Intl.message(
      'Orders refreshed successfully',
      name: 'orders_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Data refreshed successfully`
  String get mainData_refreshed_successfuly {
    return Intl.message(
      'Data refreshed successfully',
      name: 'mainData_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Profile settings updated successfully`
  String get profile_settings_updated_successfully {
    return Intl.message(
      'Profile settings updated successfully',
      name: 'profile_settings_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Payment settings updated successfully`
  String get payment_settings_updated_successfully {
    return Intl.message(
      'Payment settings updated successfully',
      name: 'payment_settings_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Tracking refreshed successfully`
  String get tracking_refreshed_successfuly {
    return Intl.message(
      'Tracking refreshed successfully',
      name: 'tracking_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email or password`
  String get wrong_email_or_password {
    return Intl.message(
      'Wrong email or password',
      name: 'wrong_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Addresses refreshed successfuly`
  String get addresses_refreshed_successfuly {
    return Intl.message(
      'Addresses refreshed successfuly',
      name: 'addresses_refreshed_successfuly',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Addresses`
  String get delivery_addresses {
    return Intl.message(
      'Delivery Addresses',
      name: 'delivery_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `New Address added successfully`
  String get new_address_added_successfully {
    return Intl.message(
      'New Address added successfully',
      name: 'new_address_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `The address updated successfully`
  String get the_address_updated_successfully {
    return Intl.message(
      'The address updated successfully',
      name: 'the_address_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Long press to edit item, swipe item to delete it`
  String get long_press_to_edit_item_swipe_item_to_delete_it {
    return Intl.message(
      'Long press to edit item, swipe item to delete it',
      name: 'long_press_to_edit_item_swipe_item_to_delete_it',
      desc: '',
      args: [],
    );
  }

  /// `Add Delivery Address`
  String get add_delivery_address {
    return Intl.message(
      'Add Delivery Address',
      name: 'add_delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Home Address`
  String get home_address {
    return Intl.message(
      'Home Address',
      name: 'home_address',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `12 Street, City 21663, Country`
  String get hint_full_address {
    return Intl.message(
      '12 Street, City 21663, Country',
      name: 'hint_full_address',
      desc: '',
      args: [],
    );
  }

  /// `Full Address`
  String get full_address {
    return Intl.message(
      'Full Address',
      name: 'full_address',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message(
      'Dismiss',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Email to reset password`
  String get email_to_reset_password {
    return Intl.message(
      'Email to reset password',
      name: 'email_to_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Send link`
  String get send_password_reset_link {
    return Intl.message(
      'Send link',
      name: 'send_password_reset_link',
      desc: '',
      args: [],
    );
  }

  /// `I remember my password return to login`
  String get i_remember_my_password_return_to_login {
    return Intl.message(
      'I remember my password return to login',
      name: 'i_remember_my_password_return_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Your reset link has been sent to your email`
  String get your_reset_link_has_been_sent_to_your_email {
    return Intl.message(
      'Your reset link has been sent to your email',
      name: 'your_reset_link_has_been_sent_to_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Error! Verify email settings`
  String get error_verify_email_settings {
    return Intl.message(
      'Error! Verify email settings',
      name: 'error_verify_email_settings',
      desc: '',
      args: [],
    );
  }

  /// `Your have an order assigned to you`
  String get your_have_an_order_assigned_to_you {
    return Intl.message(
      'Your have an order assigned to you',
      name: 'your_have_an_order_assigned_to_you',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `This account not exist`
  String get thisAccountNotExist {
    return Intl.message(
      'This account not exist',
      name: 'thisAccountNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Tap back again to leave`
  String get tapBackAgainToLeave {
    return Intl.message(
      'Tap back again to leave',
      name: 'tapBackAgainToLeave',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `swipe left the notification to delete or read unread`
  String get swip_left_the_notification_to_delete_or_read_unread {
    return Intl.message(
      'swipe left the notification to delete or read unread',
      name: 'swip_left_the_notification_to_delete_or_read_unread',
      desc: '',
      args: [],
    );
  }

  /// `Pickup`
  String get pickup {
    return Intl.message(
      'Pickup',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `What They Say ?`
  String get whatTheySay {
    return Intl.message(
      'What They Say ?',
      name: 'whatTheySay',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Edit Order`
  String get editOrder {
    return Intl.message(
      'Edit Order',
      name: 'editOrder',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `General Information`
  String get generalInformation {
    return Intl.message(
      'General Information',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Hint`
  String get hint {
    return Intl.message(
      'Hint',
      name: 'hint',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any conversations`
  String get youDontHaveAnyConversations {
    return Intl.message(
      'You don\'t have any conversations',
      name: 'youDontHaveAnyConversations',
      desc: '',
      args: [],
    );
  }

  /// `New message from`
  String get newMessageFrom {
    return Intl.message(
      'New message from',
      name: 'newMessageFrom',
      desc: '',
      args: [],
    );
  }

  /// `Type to start chat`
  String get typeToStartChat {
    return Intl.message(
      'Type to start chat',
      name: 'typeToStartChat',
      desc: '',
      args: [],
    );
  }

  /// `This notification has marked as read`
  String get thisNotificationHasMarkedAsRead {
    return Intl.message(
      'This notification has marked as read',
      name: 'thisNotificationHasMarkedAsRead',
      desc: '',
      args: [],
    );
  }

  /// `This notification has marked as un read`
  String get thisNotificationHasMarkedAsUnRead {
    return Intl.message(
      'This notification has marked as un read',
      name: 'thisNotificationHasMarkedAsUnRead',
      desc: '',
      args: [],
    );
  }

  /// `Notification was removed`
  String get notificationWasRemoved {
    return Intl.message(
      'Notification was removed',
      name: 'notificationWasRemoved',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
