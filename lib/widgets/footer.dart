import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portfolio/i18n/l_text.dart';
import 'package:my_portfolio/i18n/locale_controller.dart';
import 'package:my_portfolio/services/portfolio_service.dart';
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
              ValueListenableBuilder<String>(
                valueListenable: localeNotifier,
                builder: (context, lang, _) {
                  return Text(
                    PortfolioService.data.translations['contact']?[lang] ?? PortfolioService.data.translations['contact']?['en'] ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),

              // COPY BUTTON with dynamic tooltip text
              ValueListenableBuilder<String>(
                valueListenable: localeNotifier,
                builder: (context, lang, _) {
                  return Tooltip(
                    message: PortfolioService.data.translations['copy_email']?[lang] ?? PortfolioService.data.translations['copy_email']?['en'] ?? '',
                    child: IconButton(
                      icon: Icon(Icons.copy, color: Theme.of(context).colorScheme.onSurface),
                      onPressed: () {
                        // ============================================
                        // BOT PROTECTION EXPLANATION:
                        // ============================================
                        // HOW IT WORKS:
                        // The email is split into 4 parts and each is encoded in Base64 in the JSON file.
                        // Base64 is a method of encoding text using only safe characters (A-Z, a-z, 0-9, +, /)
                        //
                        // WHY THIS WORKS:
                        // 1. Simple email-harvester bots look for patterns like "something@something.com" in HTML/JS code
                        // 2. In the compiled main.dart.js file there are only encoded strings
                        // 3. Bots don't know these strings are email fragments - they look like random data
                        // 4. Decoding happens ONLY in the user's browser (runtime)
                        //
                        // PROTECTION LEVEL:
                        // - Stops the vast majority of simple bots (they don't see the email pattern)
                        // - Does NOT stop advanced bots that execute JavaScript
                        //
                        // DECODING PROCESS:
                        // 1. Each part is decoded from Base64 back to text
                        // 2. Parts are combined into a complete email address
                        // 3. This happens at RUNTIME (when the user visits the page)
                        // 4. The full email is never in the static source code
                        // ============================================

                        // Copy email to clipboard
                        // format is _part1._part2@_part3._part4, so we decode base64
                        String decodeBase64(String b64) => String.fromCharCodes(Uri.parse('data:text/plain;base64,$b64').data!.contentAsBytes());
                        final emailAddress = '${decodeBase64(PortfolioService.data.personalInfo.emailParts[0])}.${decodeBase64(PortfolioService.data.personalInfo.emailParts[1])}@${decodeBase64(PortfolioService.data.personalInfo.emailParts[2])}.${decodeBase64(PortfolioService.data.personalInfo.emailParts[3])}';
                        Clipboard.setData(ClipboardData(text: emailAddress));
                        // Show confirmation snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(PortfolioService.data.translations['email_copied']?[lang] ?? PortfolioService.data.translations['email_copied']?['en'] ?? ''),
                            duration: const Duration(milliseconds: 1300),
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
            onTap: () async {
              // Launches the GitHub URL (works on web and desktop)
              launchUrl(Uri.parse(PortfolioService.data.socialLinks.github));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/github.png",
                  width: 20,
                  height: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                ValueListenableBuilder<String>(
                  valueListenable: localeNotifier,
                  builder: (context, lang, _) {
                    return Text(
                      PortfolioService.data.translations['github_source']?[lang] ?? PortfolioService.data.translations['github_source']?['en'] ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        decoration: TextDecoration.underline,
                      ),
                    );
                  },
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