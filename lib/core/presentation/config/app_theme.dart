import 'package:flutter/material.dart';

const colorSchemeLight = ColorScheme.light(
    primary: Color(0xffFF5D12),
);

final themeLight = ThemeData(
    colorScheme: colorSchemeLight,
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white
    )
);

final themeDark = themeLight;

