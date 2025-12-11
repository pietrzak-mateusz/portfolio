import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/constants/colors.dart';

class ProjectDetailPage extends StatefulWidget {
  final ProjectUtils project;
  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // screen width to compute slider size responsively
    final screenWidth = MediaQuery.of(context).size.width;
    // maksymalna szerokość slidera (użytkownik chciał 800)
    const maxSliderWidth = 860.0;
    // obliczamy szerokość: na małych ekranach użyj 95% szerokości, na większych ogranicz do maxSliderWidth
    final sliderWidth = min(screenWidth * 0.95, maxSliderWidth);
    // wysokość wynikająca z proporcji 4:3 (szer.:wys.)
    final sliderHeight = sliderWidth * 3 / 4;

    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: Stack(
        children: [
          // ---------------------------------
          // CAŁA TWOJA STRONA (Scroll)
          // ---------------------------------
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 20), // dodany top padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.project.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 25),

                // ----------------------------
                // TECHNOLOGIE (wyrównane do sliderWidth)
                // ----------------------------
                Center(
                  child: SizedBox(
                    width: sliderWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Built with:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.whiteSecondary.withOpacity(0.7),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: widget.project.technologies.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: CustomColor.bgLight2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  color: CustomColor.whiteSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ----------------------------
                // GALERIA
                // ----------------------------
                Center(
                  child: SizedBox(
                    width: sliderWidth,
                    height: sliderHeight,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: widget.project.images.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    widget.project.images[index],
                                    fit: BoxFit.cover,
                                    width: sliderWidth,
                                    height: sliderHeight,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 12),

                        if (widget.project.images.length > 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.chevron_left, color: CustomColor.whiteSecondary),
                                onPressed: _currentPage > 0
                                    ? () {
                                        _pageController.previousPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    : null,
                              ),
                              Text(
                                '${_currentPage + 1} / ${widget.project.images.length}',
                                style: const TextStyle(
                                  color: CustomColor.whiteSecondary,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.chevron_right, color: CustomColor.whiteSecondary),
                                onPressed: _currentPage < widget.project.images.length - 1
                                    ? () {
                                        _pageController.nextPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    : null,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: sliderWidth,
                    child: Text(
                      widget.project.description ?? widget.project.subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),

          // ---------------------------------
          // FLOATING BACK BUTTON
          // ---------------------------------
          Positioned(
            top: 20,
            left: max(20, (screenWidth - maxSliderWidth) / 2 - 200),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: CustomColor.bgLight2,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CustomColor.whitePrimary,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: CustomColor.whitePrimary,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /*
  // ----------- Mały przycisk "← Wróć" ------------
  Widget _smallBackButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back, color: Colors.white, size: 18),
            SizedBox(width: 6),
            Text(
              "Powrót",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
  */
}
