const String _montserratFont = 'Montserrat';
const String _openSans = 'OpenSans';
const String _mukta = 'Mukta';

enum FontFamily {
  montserrat(_montserratFont),
  opensans(_openSans),
  mukta(_mukta);

  const FontFamily(this.fontName);

  final String fontName;

  static FontFamily getFontFamily(String fontName) {
    for (FontFamily fontFamily in FontFamily.values) {
      if (fontName == fontFamily.fontName) {
        return fontFamily;
      }
    }
    return FontFamily.montserrat;
  }
}
