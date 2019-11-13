import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LBLocalizations {
  bool isZh = false;

  LBLocalizations(
    this.isZh,
  );

  static LBLocalizations of(BuildContext context){
    return Localizations.of<LBLocalizations>(context, LBLocalizations);
  }

  String get title {
    return isZh?'首页':'Home';
  }
}

class LBLocalizationsDelegate extends LocalizationsDelegate<LBLocalizations>{
  const LBLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<LBLocalizations> load(Locale locale) {
    print('$locale');
    return SynchronousFuture<LBLocalizations>(
      LBLocalizations(locale.languageCode=='en')
    );
  }

  @override
  bool shouldReload(LocalizationsDelegate<LBLocalizations> old) {
    return false;
  }
  
}