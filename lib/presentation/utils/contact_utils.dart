import 'package:mysite/changes/links.dart';

class ContactUtils {
  final String url;
  final String icon;
  final String hoverMessage;

  ContactUtils({required this.url, required this.icon, this.hoverMessage = ''});
}

List<ContactUtils> contactUtils = [
  ContactUtils(
    url: gitHub,
    // icon: "https://img.icons8.com/ios-glyphs/60/000000/github.png",
    icon: "https://img.icons8.com/?size=96&id=Mhl1TfJLdkh5&format=png",
    hoverMessage: 'GitHub',
  ),

  ContactUtils(
    url: facebook,
    // icon: "https://img.icons8.com/ios-filled/50/000000/facebook-new.png",
    icon: "https://img.icons8.com/?size=96&id=uLWV5A9vXIPu&format=png",
    hoverMessage: 'Facebook',
  ),

  ContactUtils(
    url: whatsapp,
    // icon: "https://img.icons8.com/material-outlined/48/000000/whatsapp.png",
    icon: "https://img.icons8.com/?size=96&id=16713&format=png",
    hoverMessage: 'WhatsApp',
  ),
  ContactUtils(
    url: twitter,
    // icon: "https://img.icons8.com/fluency/48/000000/twitter.png",
    icon: "https://img.icons8.com/?size=100&id=phOKFKYpe00C&format=png",
    hoverMessage: 'Twitter',
  ),
  ContactUtils(
    url: linkedin,
    // icon: "https://img.icons8.com/ios-filled/50/000000/linkedin.png",
    icon: "https://img.icons8.com/?size=96&id=13930&format=png",
    hoverMessage: 'LinkedIn',
  ),
  ContactUtils(
    url: upwork,
    // icon: "https://img.icons8.com/ios-filled/50/000000/upwork.png",
    icon: 'https://img.icons8.com/?size=160&id=HKdmFbFm7xQV&format=png',
    hoverMessage: 'Upwork',
  ),
  ContactUtils(
    url: instagram,
    // icon: "https://img.icons8.com/glyph-neue/64/000000/instagram-new.png",
    icon: "https://img.icons8.com/?size=160&id=BrU2BBoRXiWq&format=png",
    hoverMessage: 'Instagram',
  ),
];
