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
    const maxSliderWidth = 920.0;
    // obliczamy szerokość: na małych ekranach użyj 95% szerokości, na większych ogranicz do maxSliderWidth
    final sliderWidth = min(screenWidth * 0.95, maxSliderWidth);
    // wysokość wynikająca z proporcji 4:3 (szer.:wys.)
    final sliderHeight = sliderWidth * 3 / 4;

    return Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------
            // GÓRNY PAS — Back + Tytuł
            // ----------------------------
            _smallBackButton(context),
            const SizedBox(height: 20),
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

            // ---------------------------------------
            // GALERIA OBRAZÓW — PAGEVIEW w ograniczonym rozmiarze
            // ---------------------------------------
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
                                fit: BoxFit.cover, // zachowuje proporcje w ramach pola 4:3
                                width: sliderWidth,
                                height: sliderHeight,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    // NAWIGACJA: licznik + strzałki (jeśli więcej niż 1)
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

            // ----------------------------
            // SZCZEGÓŁOWY OPIS (wyrównany do sliderWidth)
            // ----------------------------
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
    );
  }

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
              "Wróć",
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
}
