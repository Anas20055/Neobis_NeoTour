part of '../../main.dart';

ThemeData _theme() {
  return ThemeData(
    fontFamily: 'SfProDisplay',
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.purple),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 30, vertical: 17),
        ),
      ),
    ),
    appBarTheme: _appBarThem(),
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
      ),
    ),
  );
}

AppBarTheme _appBarThem() {
  return const AppBarTheme(
    centerTitle: false,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
  );
}
