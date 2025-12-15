import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/size.dart';

import '../widgets/drawer_mobile.dart';
import '../widgets/footer.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';
import '../i18n/l_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: Stack(
          children: [
            // SCROLLOWALNY CONTENT
            SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(key: navbarKeys.first),
                  
                  // Odstęp na sticky header
                  const SizedBox(height: 80),

                  // MAIN
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    const MainDesktop()
                  else
                    const MainMobile(),

                  // SKILLS
                  Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    color: CustomColor.bgLight1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // title
                        const LText(
                          'skills_section',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 50),

                        // platforms and skills
                        if (constraints.maxWidth >= kMedDesktopWidth)
                          const SkillsDesktopTwoColumns()
                        else
                          const SkillsMobile(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // PROJECTS
                  ProjectsSection(
                    key: navbarKeys[2],
                  ),

                  const SizedBox(height: 0),

                  // FOOTER
                  const Footer(),
                ],
              ),
            ),

            // STICKY HEADER NA GÓRZE
            if (constraints.maxWidth >= kMinDesktopWidth)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: HeaderDesktop(onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                }),
              )
            else
              HeaderMobile(
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
          ],
        ),
      );
    });
  }

  void scrollToSection(int navIndex) async {
    if (navIndex == 4) {
      // Otwórz link w nowej karcie
      final url = Uri.parse(SnsLinks.blog);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}