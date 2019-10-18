import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internazionalization/clases/app_translations_delegate.dart';
import 'package:internazionalization/clases/application.dart';
import 'package:internazionalization/home_page.dart';
import 'package:internazionalization/idioma_page.dart';
 
class Demolocalizations{
  Demolocalizations(this.locale);
  final Locale locale;

  static Demolocalizations of(BuildContext context){
    return Localizations.of<Demolocalizations>(context, Demolocalizations);
  }
  static Map<String,Map<String,String>> _localizedValues = {
    'en': {
      'title': 'Hello World'
    },
    'es':{
      'title':'Hola Mundo'
    }
  };

  String get title{
    return _localizedValues[locale.languageCode]['title'];
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<Demolocalizations>{
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','es'].contains(locale.languageCode);
  }

  @override
  Future<Demolocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<Demolocalizations>(Demolocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<Demolocalizations> old) {
    // TODO: implement shouldReload
    return true;
  }
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Demolocalizations.of(context).title),
      ),
      body: Center(
        child: Text(Demolocalizations.of(context).title),
      ),
    );
  }
}
void main() => runApp(Demo());
 
class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
         // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
       },*/
      //onGenerateTitle: (BuildContext context)=>Demolocalizations.of(context).title,
      localizationsDelegates: [
        _newLocaleDelegate,
        //const DemoLocalizationsDelegate(),
        const AppTranslationsDelegate(),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support, traduce los elementos a los idiomas
        GlobalWidgetsLocalizations.delegate
      ],
     /* supportedLocales: [
        const Locale('en','US'),
        const Locale('es','ES')
      ],*/
      supportedLocales: application.supportedLocales(),
      //title: 'Material App',
      home: HomePage()
    );
  }

  void onLocaleChange(Locale locale){
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}