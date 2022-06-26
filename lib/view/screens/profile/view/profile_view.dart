import 'package:kunlik/core/components/org_text_comp.dart';
import 'package:kunlik/core/constants/colors_const.dart';
import 'package:kunlik/core/constants/fonts_const.dart';
import 'package:kunlik/core/extensions/context_extensions.dart';
import 'package:kunlik/core/widgets/listTile_widget.dart';
import 'package:kunlik/view/base/base_view.dart';
import 'package:kunlik/view/screens/cart/pages/my_orders/my_orders_page.dart';
import 'package:kunlik/view/screens/profile/pages/account_password/account_password_page.dart';
import 'package:kunlik/view/screens/profile/pages/customer_service/customer_service_page.dart';
import 'package:kunlik/view/screens/profile/pages/edit_profile/edit_profile_page.dart';
import 'package:kunlik/view/screens/profile/pages/my_address/my_address_page.dart';
import 'package:kunlik/view/screens/profile/pages/payment_method/payment_method_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: ProfileView,
      onPageBuilder: (context, widget) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsConst.colorTransparent,
            elevation: 0,
            title: OrgText(
              text: 'Profile',
              size: FontsConst.kLargeFont20,
              fontWeight: WeightsConst.kLargeWeight800,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: context.w * 0.05),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/notification');
                  },
                  child: SvgPicture.asset(
                    'assets/icons/notificationview/notification.svg',
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: context.h * 0.02,
                    left: context.w * 0.3,
                    right: context.w * 0.3,
                    bottom: context.h * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: context.h * 0.09,
                        child: Image.asset('assets/images/avatar.png'),
                      ),
                      SizedBox(
                        height: context.h * 0.01,
                      ),
                      OrgText(
                        text: 'Jane Doe',
                        color: ColorsConst.colorBlack,
                        size: FontsConst.kMediumFont16 + 2,
                        fontWeight: WeightsConst.kLargeWeight800,
                      ),
                      OrgText(
                        text: '(307) 555-0133',
                        color: ColorsConst.color92929D,
                        size: FontsConst.kMediumFont16,
                        fontWeight: WeightsConst.kLargeWeight800,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.h * 0.6,
                  child: Column(
                    children: [
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_editProfile.svg',
                        title: 'Edit Profile',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfilePage(
                                avatar: 'assets/images/avatar.png',
                                title: 'Edit Profile',
                              ),
                            ),
                          );
                        },
                      ),
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_myOrder.svg',
                        title: 'My Orders',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrdersPage()),
                          );
                        },
                      ),
                      ListTileWidget(
                          icon: 'assets/icons/profile/profile_myWishlist.svg',
                          title: 'My Wishlist',
                          onPressed: () {
                            Navigator.pushNamed(context, '/my_wishlist');
                          }),
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_myAddress.svg',
                        title: 'My Address',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyAddressPage(
                                title: 'My Address',
                              ),
                            ),
                          );
                        },
                      ),
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_payment.svg',
                        title: 'Payment Method',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentMethodPage(
                                title: 'Payment Method',
                              ),
                            ),
                          );
                        },
                      ),
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_customer.svg',
                        title: 'Customer Service',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CustomerServicePage()),
                          );
                        },
                      ),
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_changePassword.svg',
                        title: 'Change Password',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountPasswordPage(
                                title: "Change Password",
                              ),
                            ),
                          );
                        },
                      ),
                      ListTileWidget(
                        icon: 'assets/icons/profile/profile_logOut.svg',
                        title: 'Logout',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomerServicePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
