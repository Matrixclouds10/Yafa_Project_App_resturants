class AppURL {

  static const String kAPIKey = "";
  static const String kBaseURL = "http://kogena.dev03.matrix-clouds.com/api/";

  ///Auth
  static const String kLoginURI = "auth/otp";
  static const String kOtpURI = "auth/login";
  static const String kRegisterURI = "auth/register";
  static const String kLogoutURI = "auth/logout";

  static const String kForgetPasswordURI = "auth/otp";
  static const String kCheckOTPURI = "auth/check-otp";
  static const String kResetPasswordURI = "";
  static const String kDeleteAccountURI = "";
  static const String kUpdateFCMTokenURI = "fcm_token";

  ///home
  static const String kHomeURI = "home";
  static  String kCategoriesURI (int id)=> "stores/all-categories?store_id=$id";
  static  String kItemExtraURI (int id)=> "stores/items/single?item_id=$id";
  static  String kCategoriesItemsURI ({required int categoryId,required int storeId})=> "stores/categories?category_id=$categoryId&store_id=$storeId";
  ///Cart
  static const String kGetCartURL = "shopping-cart";
  ///more
  static const String kGetProfileURL = "profile";
  static const String kUpdateProfileURL = "profile/update";
  static const String kUpdateImageProfileURL = "profile/uploadImage";

  ///setting
  static const String kGetCitiesURL = "";
  static const String kGetCategoriesURL = "";
  static const String kContactUsRequestURL = "";
  static const String kGetFAGsURL = "";

  ///notifications
  static const String kGetNotificationsURI = '';

  ///offer
  static const String kGetOffersURI = '';
  static const String kGetOfferDetailsURI = '';



}
