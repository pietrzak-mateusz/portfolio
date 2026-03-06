import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_section.dart';

// Responsive breakpoints
const double kMinDesktopWidth = 600.0;
const double kMedDesktopWidth = 800.0;

/// Main portfolio homepage with responsive layout and navigation.
/// 
/// Contains: Header, Main section, Skills, Projects, and Footer.
/// Uses responsive breakpoints to switch between mobile and desktop layouts.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  
  // Keys for scroll navigation to different sections
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      final theme = Theme.of(context);
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.scaffoldBackgroundColor,
        // Mobile drawer for navigation on small screens
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: Stack(
          children: [
            // Scrollable page content
            SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(key: navbarKeys.first),
                  
                  // Spacing for sticky header
                  const SizedBox(height: 80),

                  // Main section - different layout for desktop/mobile
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    const MainDesktop()
                  else
                    const MainMobile(),

                  // Skills section
                  SkillsSection(
                    key: navbarKeys[1],
                    screenWidth: screenWidth,
                    maxWidth: constraints.maxWidth,
                  ),
                  const SizedBox(height: 30),

                  // Projects section
                  ProjectsSection(
                    key: navbarKeys[2],
                  ),

                  const SizedBox(height: 0),

                  // Footer with contact info and links
                  const Footer(),
                ],
              ),
            ),

            // Sticky header at the top
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
  
  /// Scrolls to a specific section or opens external link for blog.
  void scrollToSection(int navIndex) async {
    /*
    // Blog link (navIndex 4) opens in external browser
    if (navIndex == 4) {
      final url = Uri.parse(SnsLinks.blog);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
      return;
    }
    */

    // Scroll to other sections using their GlobalKey
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}