// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "appName": "لوحة التحكم",
  "auth": {
    "login": "تسجيل الدخول",
    "register": "إنشاء حساب",
    "email": "البريد الإلكتروني",
    "password": "كلمة المرور",
    "emailIsRequired": "البريد الإلكتروني مطلوب",
    "passwordIsRequired": "كلمة المرور مطلوبة",
    "forgotPassword": "نسيت كلمة المرور؟",
    "loginPage": "صفحة تسجيل الدخول",
    "loginLabel": "تسجيل الدخول إلى حسابك",
    "logout": "تسجيل الخروج",
    "wrongEmailOrPassword": "لقد أدخلت بريدًا إلكترونيًا أو كلمة مرور خاطئة أو كلاهما. يرجى التحقق من معلوماتك والمحاولة مرة أخرى."
  },
  "daysOfWeek": {
    "sunday": "احد",
    "monday": "ثنین",
    "tuesday": "ثلاثاء",
    "wednesday": "أربعاء",
    "thursday": "خميس",
    "friday": "جمعة",
    "saturday": "سبت"
  },
  "common": {
    "loading": "جاري التحميل...",
    "error": "خطأ",
    "notificationTokenErrorPleaseFixItOnSettings": "خطأ في رمز الاشعارات. يرجى إصلاحه في الإعدادات!",
    "someThingWentWrongWhileShowNotification": "حدث خطأ أثناء عرض الإشعار",
    "anErrorHasOccurs": "حدث خطأ. حاول مرة أخرى بسحب الصفحة إلى الأسفل!",
    "noInternetPullDown": "يبدو أنك غير متصل بالإنترنت. تحقق من الاتصال وحاول مرة أخرى بسحب الصفحة إلى الأسفل!",
    "success": "نجاح",
    "retry": "إعادة المحاولة",
    "cancel": "إلغاء",
    "save": "حفظ",
    "delete": "حذف",
    "edit": "تعديل",
    "close": "إغلاق",
    "youMustEnableLocationServices": "يجب عليك تفعيل خدمات الموقع!",
    "youMustAcceptLocationPermission": "يجب عليك منح صلاحية الموقع!",
    "youDeniedLocationPermissionForever": "يبدو أنك رفضت صلاحية الموقع بشكل دائم. يجب أن تذهب إلى إعدادات الجهاز وتوافق عليها!",
    "add": "إضافة",
    "price": "السعر",
    "noThingToShow": "لا يوجد شيء للعرض",
    "pageNotFound": "الصفحة غير موجودة",
    "unexpectedErrorOccurred": "حدث خطأ غير متوقع",
    "yourSessionHasExpiredPleaseLoginAgain": "انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى.",
    "ok": "موافق",
    "tryAgain": "حاول مرة أخرى",
    "clear": "مسح"
  },
  "theme": {
    "choose": "اختر سمة",
    "system": "النظام",
    "light": "فاتح",
    "dark": "داكن"
  },
  "language": {
    "choose": "اختر لغة",
    "selected": "تم اختيار اللغة",
    "arabic": "العربية",
    "english": "الإنجليزية",
    "kurdish": "الكردية"
  },
  "validation": {
    "emailField": "يرجى إدخال بريد إلكتروني صالح.✉️ {email}",
    "passwordField": "حقل كلمة المرور مطلوب",
    "requiredField": "هذا الحقل مطلوب",
    "price": "يجب أن يكون السعر أكبر من 0",
    "quantity": "يجب أن تكون الكمية > 0"
  },
  "loginPage": {
    "welcomeBack": "مرحبًا بعودتك!",
    "pleaseLoginToYourAccount": "يرجى تسجيل الدخول إلى حسابك",
    "dontHaveAnAccount": "ليس لديك حساب؟",
    "registerNow": "سجل الآن"
  }
};
static const Map<String,dynamic> _en = {
  "appName": "Dashboard",
  "auth": {
    "login": "Login",
    "register": "Register",
    "email": "Email",
    "password": "Password",
    "emailIsRequired": "Email is required",
    "passwordIsRequired": "Password is required",
    "forgotPassword": "Forgot Password?",
    "loginPage": "Login Page",
    "loginLabel": "Login to your account",
    "logout": "Logout",
    "wrongEmailOrPassword": "you have entered a wrong Email/Password or both. Please check your information and try agin."
  },
  "daysOfWeek": {
    "sunday": "Sunday",
    "monday": "Monday",
    "tuesday": "Tuesday",
    "wednesday": "Wednesday",
    "thursday": "Thursday",
    "friday": "Friday",
    "saturday": "Saturday"
  },
  "common": {
    "loading": "Loading...",
    "error": "Error",
    "notificationTokenErrorPleaseFixItOnSettings": "Notification token error. Please fix it in settings!",
    "someThingWentWrongWhileShowNotification": "Something went wrong while showing the notification",
    "anErrorHasOccurs": "An error occurred. Please pull down the page to try again!",
    "noInternetPullDown": "It seems you are offline. Check your connection and pull down the page to try again!",
    "success": "Success",
    "retry": "Retry",
    "cancel": "Cancel",
    "save": "Save",
    "delete": "Delete",
    "edit": "Edit",
    "close": "Close",
    "youMustEnableLocationServices": "You must enable location services!",
    "youMustAcceptLocationPermission": "You must grant location permission!",
    "youDeniedLocationPermissionForever": "It seems you denied location permission permanently. You must go to device settings and allow it!",
    "add": "Add",
    "price": "Price",
    "noThingToShow": "Nothing to show",
    "pageNotFound": "Page not found",
    "unexpectedErrorOccurred": "An unexpected error occurred",
    "yourSessionHasExpiredPleaseLoginAgain": "Your session has expired. Please login again.",
    "ok": "OK",
    "tryAgain": "Try again",
    "clear": "Clear"
  },
  "theme": {
    "choose": "Choose theme",
    "system": "System",
    "light": "Light",
    "dark": "Dark"
  },
  "language": {
    "choose": "Choose language",
    "selected": "Language selected",
    "arabic": "Arabic",
    "english": "English",
    "kurdish": "Kurdish"
  },
  "validation": {
    "emailField": "please enter valid email.✉️ {email}",
    "passwordField": "Password field is REQUIRED",
    "requiredField": "This field is REQUIRED",
    "price": "Price must be larger than 0",
    "quantity": "Quantity must be > 0"
  },
  "loginPage": {
    "welcomeBack": "Welcome back!",
    "pleaseLoginToYourAccount": "Please login to your account",
    "dontHaveAnAccount": "Don't have an account?",
    "registerNow": "Register now"
  }
};
static const Map<String,dynamic> _fa = {
  "appName": "Dashboard",
  "auth": {
    "login": "چوونە ژوورەوە",
    "register": "تۆمارکردن",
    "email": "ئیمەیڵ",
    "password": "وشەی نهێنی",
    "emailIsRequired": "ئیمەیڵ پێویستە",
    "passwordIsRequired": "وشەی نهێنی پێویستە",
    "forgotPassword": "وشەی نهێنیت لەبیرکردووە؟",
    "loginPage": "پەڕەی چوونە ژوورەوە",
    "loginLabel": "چوونە ژوورەوە بۆ هەژمارەکەت",
    "logout": "چوونە دەرەوە",
    "wrongEmailOrPassword": "ئیمەیڵ یان وشەی نهێنی هەڵەیە (یان هەردووکیان). تکایە زانیارییەکانت پشکنەوە و دووبارە هەوڵبدەرەوە."
  },
  "daysOfWeek": {
    "sunday": "یەکشەممە",
    "monday": "دووشەممە",
    "tuesday": "سێشەممە",
    "wednesday": "چوارشەممە",
    "thursday": "پێنجشەممە",
    "friday": "هەینی",
    "saturday": "شەممە"
  },
  "common": {
    "loading": "چاوەڕێ بکە...",
    "error": "هەڵە",
    "notificationTokenErrorPleaseFixItOnSettings": "هەڵەی توکینی ئاگاداری. تکایە لە ڕێکخستنەکاندا چارەسەر بکە!",
    "someThingWentWrongWhileShowNotification": "هەڵەیەک ڕوودەدات کاتێک ئاگاداری نیشان دەدرێت",
    "anErrorHasOccurs": "هەڵەیەک ڕوودەدات. تکایە دووبارە هەوڵبدەرەوە لە ڕووی پەیجەکە!",
    "noInternetPullDown": "وەکوو دێت، وەڵامەیەکی ئینتەرنێت نیە. پەیوەندیت چیک بکە و دووبارە هەوڵبدەرەوە لە ڕووی پەیجەکە!",
    "success": "سەرکەوتوو",
    "retry": "دووبارە هەوڵدان",
    "cancel": "هەڵوەشاندنەوە",
    "save": "پاشەکەوت",
    "delete": "سڕینەوە",
    "edit": "دەستکاری",
    "close": "داخستن",
    "youMustEnableLocationServices": "پێویستە خزمەتی شوێنەکان چالاک بکەیت!",
    "youMustAcceptLocationPermission": "پێویستە مافەکانی شوێنەکان بپەسندیت!",
    "youDeniedLocationPermissionForever": "بەهەمان شێوە، پەیوەندیدانی مافەکانی شوێنەکان بەرز ناکەیت! پێویستە بڕۆیت بۆ ڕووکاری ئەندازە و پەسند بکەیت!",
    "add": "زیادکردن",
    "price": "قیمت",
    "noThingToShow": "هیچ شتێک بۆ نیشاندانی نیە",
    "pageNotFound": "پەیجەکە نەدۆزرایەوە",
    "unexpectedErrorOccurred": "هەڵەیەکی نەهەڵبژاردوو ڕوودەدات",
    "yourSessionHasExpiredPleaseLoginAgain": "کاتی نیشتەجێبوونت کۆتایی هات. تکایە دووبارە بچۆ ژوورەوە.",
    "ok": "باشە",
    "tryAgain": "دووبارە هەوڵبدەرەوە",
    "clear": "سڕینەوە"
  },
  "theme": {
    "choose": "مۆدێلێک هەڵبژێرە",
    "system": "سیستەم",
    "light": "ڕووناک",
    "dark": "تاریک"
  },
  "language": {
    "choose": "زمانێک هەڵبژێرە",
    "selected": "زمان هەڵبژێردرا",
    "arabic": "عەرەبی",
    "english": "ئینگلیزی",
    "kurdish": "کوردی"
  },
  "validation": {
    "emailField": "تکایە ئیمەیڵێکی دروست بنوسە.✉️ {email}",
    "passwordField": "بەشەکەی وشەی نهێنی پێویستە",
    "requiredField": "ئەم بەشە پێویستە",
    "price": "نرخ پێویستە گەورەتر بێت لە 0",
    "quantity": "ژمارە پێویستە گەورەتر بێت لە 0"
  },
  "loginPage": {
    "welcomeBack": "بەخێربێیت دووبارە!",
    "pleaseLoginToYourAccount": "تکایە بچۆ ژوورەوە بۆ هەژمارەکەت",
    "dontHaveAnAccount": "هەژمارت نیە؟",
    "registerNow": "ئێستا تۆماربکە"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en, "fa": _fa};
}
