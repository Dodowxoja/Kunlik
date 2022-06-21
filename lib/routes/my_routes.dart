import 'package:flutter/material.dart';
import 'package:kunlik/view/auth/number/number_view.dart';
import 'package:kunlik/view/auth/password/forgot_password_view.dart';
import 'package:kunlik/view/auth/password/reset_password_view.dart';
import 'package:kunlik/view/auth/register/register_view.dart';
import 'package:kunlik/view/auth/sign_in/sign_in_view.dart';
import 'package:kunlik/view/screens/cart/pages/cancelation_reason/cancelation_reason_page.dart';
import 'package:kunlik/view/screens/cart/pages/history/history_page.dart';
import 'package:kunlik/view/screens/cart/pages/my_blog/my_blog_page.dart';
import 'package:kunlik/view/screens/cart/pages/my_orders/my_orders_page.dart';
import 'package:kunlik/view/screens/cart/pages/ongoing/ongoing_page.dart';
import 'package:kunlik/view/screens/cart/pages/order_status/order_status_page.dart';
import 'package:kunlik/view/screens/cart/pages/order_status_details/order_status_details_page.dart';
import 'package:kunlik/view/screens/cart/pages/rate_the_order/rate_the_order_page.dart';
import 'package:kunlik/view/screens/home/pages/coupon/coupon_page.dart';
import 'package:kunlik/view/screens/home/pages/detail/detail_page.dart';
import 'package:kunlik/view/screens/home/pages/my_wishlist/my_wishlist_page.dart';
import 'package:kunlik/view/screens/home/pages/search/search_page.dart';
import 'package:kunlik/view/screens/home/pages/search_result/search_result_page.dart';
import 'package:kunlik/view/screens/home/pages/vegetables/vegetables_page.dart';
import 'package:kunlik/view/screens/profile/pages/account_password/account_password_page.dart';
import 'package:kunlik/view/screens/profile/pages/add_payment_method/add_payment_method_page.dart';
import 'package:kunlik/view/screens/profile/pages/contact_seller/contact_seller_page.dart';
import 'package:kunlik/view/screens/profile/pages/contact_seller_with_keyboard/contact_seller_with_keyboard_page.dart';
import 'package:kunlik/view/screens/profile/pages/customer_service/customer_service_page.dart';
import 'package:kunlik/view/screens/profile/pages/edit_profile/edit_profile_page.dart';
import 'package:kunlik/view/screens/profile/pages/my_address/my_address_page.dart';
import 'package:kunlik/view/screens/profile/pages/notification/notification_page.dart';
import 'package:kunlik/view/screens/profile/pages/notification_settings/notification_settings_page.dart';
import 'package:kunlik/view/screens/profile/pages/payment_method/payment_method_page.dart';
import 'package:kunlik/view/screens/profile/pages/search_result_empty/search_result_empty_page.dart';
import 'package:kunlik/view/screens/screens_view.dart';
import 'package:kunlik/view/splash/splash_view.dart';

class MyRoutes {
  static final MyRoutes _instanse = MyRoutes.init();
  static MyRoutes get instanse => MyRoutes._instanse;
  MyRoutes.init();

  Route? onGenerate(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      //Splash Page
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashView());

      //Auth Page
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => const SignInView());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case '/forgot_password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case '/reset_password':
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case '/number':
        return MaterialPageRoute(builder: (_) => const NumberView());

      //Screens (TabBar) Page
      case '/screens':
        return MaterialPageRoute(builder: (_) => const ScreensView());

      //Home Page
      case '/detail':
        return MaterialPageRoute(builder: (_) => const DetailPage());
      case '/my_wishlist':
        return MaterialPageRoute(builder: (_) => const MyWishlistPage());
      case '/vegetables':
        return MaterialPageRoute(builder: (_) => const VegetablesPage());
      case '/coupon':
        return MaterialPageRoute(builder: (_) => const CouponPage());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case '/search_result':
        return MaterialPageRoute(builder: (_) => const SearchResultPage());

      //Cart Page
      case '/my_bag':
        return MaterialPageRoute(builder: (_) => const MyBlogPage());
      case '/my_orders':
        return MaterialPageRoute(builder: (_) => const MyOrdersPage());
      case '/ongoing':
        return MaterialPageRoute(builder: (_) => const OnGoingPage());
      case '/history':
        return MaterialPageRoute(builder: (_) => const HistoryPage());
      case '/order_status':
        return MaterialPageRoute(builder: (_) => const OrderStatusPage());
      case '/order_status_details':
        return MaterialPageRoute(
            builder: (_) => const OrderStatusDetailsPage());
      case '/rate_the_order':
        return MaterialPageRoute(builder: (_) => const RateTheOrderPage());
      case '/cancelation_reason':
        return MaterialPageRoute(builder: (_) => const CancelationReasonPage());

      //Profile Page
      case '/notification':
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case '/notification_settings':
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingsPage());
      case '/edit_profile':
        return MaterialPageRoute(builder: (_) => const EditProfilePage());
      case '/change_number':
        return MaterialPageRoute(builder: (_) => const CouponPage());
      case '/account_password':
        return MaterialPageRoute(builder: (_) => const AccountPasswordPage());
      case '/my_address':
        return MaterialPageRoute(builder: (_) => const MyAddressPage());
      // case '/select_location':
      //   return MaterialPageRoute(builder: (_) => const NoView()); //! NoView
      case '/payment_method':
        return MaterialPageRoute(builder: (_) => const PaymentMethodPage());
      case '/add_payment_method':
        return MaterialPageRoute(builder: (_) => const AddPaymentMethodPage());
      case '/customer_service':
        return MaterialPageRoute(builder: (_) => const CustomerServicePage());
      case '/contact_seller_with_keyboard':
        return MaterialPageRoute(
            builder: (_) => const ContactSellerWithKeyboardPage());
      case '/contact_seller':
        return MaterialPageRoute(builder: (_) => const ContactSellerPage());
      // case '/my_orders':
      //   return MaterialPageRoute(builder: (_) => const NoView());  //! NoView
      case '/search_result_empty ':
        return MaterialPageRoute(builder: (_) => const SearchResultEmptyPage());
    }
  }
}
