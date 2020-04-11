import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticiaprovider/src/models/category_model.dart';
import 'package:noticiaprovider/src/models/news_models.dart';
import 'package:http/http.dart' as http;


final _URL_NEWS = 'http://newsapi.org/v2';
final _APIKEY = 'bf4b79ae5bf641169c118565c955248a';
class NewService with ChangeNotifier {

  List<Article> headlines = [];
  String _selecteGategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building,'business'),
    // Category(FontAwesomeIcons.tv,'entertainment'),
    Category(FontAwesomeIcons.headSideVirus,'health'),
    Category(FontAwesomeIcons.addressCard,'general'),
    Category(FontAwesomeIcons.vials,'science'),
    Category(FontAwesomeIcons.volleyballBall,'sports'),
    // Category(FontAwesomeIcons.memory,'technology'),

  ];

  Map<String,List<Article>> categoryArticle = {};

  NewService() {

    this.getTopHeadlines();
    categories.forEach((f){
      this.categoryArticle[f.name] = new List();
    });
  }

  get selectCategroty => this._selecteGategory;

  set selectCategroty(String valor){
    this._selecteGategory = valor;

    this.getArticlesByCategory(valor);
    notifyListeners();
  }

    List<Article> get getArticleByCategoryselece => this.categoryArticle[this.selectCategroty];


  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY';

    final res = await http.get(url);
    final newsRes = newsResponseFromJson(res.body);

    this.headlines.addAll(newsRes.articles);

    notifyListeners();
  }

  


    getArticlesByCategory(String category) async {
      if(this.categoryArticle[category].length > 0){
        return this.categoryArticle[category];
      }
    final url = '$_URL_NEWS/top-headlines?country=us&category=$category&apiKey=$_APIKEY';

    final res = await http.get(url);
    final newsRes = newsResponseFromJson(res.body);

   this.categoryArticle[category].addAll(newsRes.articles);

    notifyListeners();
  }




  
}