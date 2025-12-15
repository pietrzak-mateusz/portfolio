import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/personal_info.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/i18n/strings.dart';
import 'package:url_launcher/url_launcher.dart';

/// Footer widget for the portfolio page.
/// 
/// Displays contact information, a GitHub link, and project credits.
/// Includes functionality to copy the email address and navigate to external links.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ---- EMAIL SECTION WITH COPY BUTTON ----
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LText(
                'contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(width: 8),

              // COPY BUTTON with dynamic tooltip text
              ValueListenableBuilder<String>(
                valueListenable: localeNotifier,
                builder: (context, locale, _) {
                  return Tooltip(
                    message: t('copy_email'),
                    child: IconButton(
                      icon: const Icon(Icons.copy, color: CustomColor.whitePrimary),
                      onPressed: () {
                        // Copy email to clipboard
                        Clipboard.setData(ClipboardData(text: PersonalInfo.contactAddress));
                        // Show confirmation snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: LText('email_copied'),
                            duration: Duration(milliseconds: 1300),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ----------------------------------
          // CLICKABLE GITHUB LINK
          // ----------------------------------
          InkWell(
            onTap: () {
              // Launches the GitHub URL (works on web and desktop)
              launchUrl(Uri.parse(SnsLinks.github));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/github.png",
                  width: 20,
                  height: 20,
                  color: CustomColor.whiteSecondary,
                ),
                const SizedBox(width: 8),
                const LText(
                  'github_source',
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColor.whiteSecondary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---- FOOTER CREDITS TEXT WITH FLUTTER ICON ----
          const LRichText(
            leftKey: 'made_by_p1',
            rightKey: 'made_by_p2',
            iconAsset: 'assets/flutter.png',
            iconHeight: 16,
          ),
        ],
      ),
    );
  }
}