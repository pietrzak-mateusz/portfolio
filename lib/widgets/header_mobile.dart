import 'package:flutter/material.dart';

/// Mobile header widget with a hamburger menu button.
/// 
/// Appears on small screens (mobile/tablet) and provides access to the navigation drawer.
/// Positioned in the top-right corner for easy thumb reach on mobile devices.
class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    required this.onMenuTap,
  });

  /// Callback triggered when the menu button is tapped.
  /// Typically opens the mobile navigation drawer.
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Row(
        children: [
          // --------------------
          // HAMBURGER MENU BUTTON
          // --------------------
          Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: InkWell(
              onTap: onMenuTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}