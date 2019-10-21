import 'package:flutter/material.dart';
import 'package:internazionalization/clases/app_translations.dart';
import 'package:internazionalization/clases/application.dart';

class IdiomasPage extends StatefulWidget {
  @override
  _IdiomasPageState createState() => _IdiomasPageState();
}

class _IdiomasPageState extends State<IdiomasPage> {
  //final List<String> languagesList = ["English", "Spanish"];
  //languagesList also moved to the Application class just like the languageCodesList
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList = 
    application.supportedLanguagesCodes;
  
  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          
          //'Select Language'
          
          AppTranslations.of(context).text("title"),
        ),
      ),
      body: _buildLanguagesList(),
    );
  }

 Widget _buildLanguagesList(){
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context,index){
        return _buildLanguageItem(languagesList[index]);
      },
    );
  }

 Widget _buildLanguageItem(String language){
    return InkWell(
      onTap: (){
        print(language);
        application.onLocaleChanged(Locale(languagesMap[language]));
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}