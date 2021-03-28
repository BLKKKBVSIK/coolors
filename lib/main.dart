import 'package:coolors/misc/themes.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'homepage/homepage_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          controller.setTheme('light');
        }
      },
      themes: <AppTheme>[
        lightTheme,
        darkTheme,
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Coolors',
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
