class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://site.com";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  //url for google firebase messaging to send message using firebase messaging service
  static const String fcmUrl = "https://fcm.googleapis.com/fcm/send";
  //unique serverKey provided from firbase dashboard
  static const String fcmServerKey =
      "fcmServerKey";
}
