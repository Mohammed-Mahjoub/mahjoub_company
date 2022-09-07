import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/get/language_getc_controller.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';
import 'package:mahjoub_company/widgets/settings_card.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _language;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      children: [
        Text(
          context.localizations.language,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text('العربية', style: GoogleFonts.cairo()),
                value: 'ar',
                groupValue: _language,
                onChanged: (String? value) {
                  setState(() => _language = value);
                  if(SharedPrefController().getValueFor(key: PrefKeys.language.name)!= value){
                    LanguageGetxController.to.changeLanguage();
                  }
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text('English', style: GoogleFonts.cairo()),
                value: 'en',
                groupValue: _language,
                onChanged: (String? value) {
                  setState(() => _language = value);
                  if(SharedPrefController().getValueFor(key: PrefKeys.language.name)!= value){
                    LanguageGetxController.to.changeLanguage();
                  }
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        SettingsCard(title: context.localizations.profile, buttonText: context.localizations.edit_profile, onPress: (){
          Navigator.pushNamed(context, '/edit_profile_screen');
        }),
        const SizedBox(height: 20),
        SettingsCard(title: context.localizations.mobile2, buttonText: context.localizations.edit_mobile, onPress: (){
          Navigator.pushNamed(context, '/edit_mobile_screen');
        }),
        const SizedBox(height: 20),
        SettingsCard(title: context.localizations.password, buttonText: context.localizations.edit_password, onPress: (){
          Navigator.pushNamed(context, '/edit_password_screen');
        }),
        const SizedBox(height: 20),
        SettingsCard(title: context.localizations.addresses, buttonText: context.localizations.show_addresses, onPress: (){
          Navigator.pushNamed(context, '/addresses_screen');
        }),
        const SizedBox(height: 20),
        SettingsCard(title: context.localizations.contact_us, buttonText: context.localizations.contact_with_admin, onPress: (){}),
        const SizedBox(height: 20),
        SettingsCard(title: context.localizations.about, buttonText: context.localizations.about_us, onPress: (){
          Navigator.pushNamed(context, '/about_us_screen');
        }),
      ],
    );
  }
}