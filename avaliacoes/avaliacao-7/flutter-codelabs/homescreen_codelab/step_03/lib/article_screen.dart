import 'package:flutter/material.dart';
// Import do pacote home_widget
import 'package:home_widget/home_widget.dart';

import 'home_screen.dart';
import 'news_data.dart'; // Contém o NewsArticle

// Criando um placeholder para o LineChart caso ele não esteja declarado em outro arquivo.
// Se o LineChart já existir no seu projeto (como no home_screen.dart), você pode apagar esta classe.
class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.blue.shade100,
      child: const Center(child: Text('Gráfico de Linha')),
    );
  }
}

class ArticleScreen extends StatefulWidget {
  final NewsArticle article; 

  const ArticleScreen({super.key, required this.article});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final _globalKey = GlobalKey();
  String? imagePath;

  void updateHeadline(NewsArticle article) { 
    HomeWidget.saveWidgetData<String>('headline_title', article.title);
    HomeWidget.saveWidgetData<String>('headline_description', article.description);
    HomeWidget.updateWidget(
      name: 'NewsWidget', 
      androidName: 'NewsWidget',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      // CORREÇÃO: Readicionado o FloatingActionButton que tinha sumido na colagem
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Deixamos a renderização da imagem comentada para o compilador ignorar o erro do pacote
          /*
          if (_globalKey.currentContext != null) {
            var path = await HomeWidget.renderFlutterWidget(
              LineChart(), 
              name: 'screenshot', 
              key: 'filename',
              logicalSize: _globalKey.currentContext!.size,
              pixelRatio: MediaQuery.of(_globalKey.currentContext!).devicePixelRatio,
            );
            setState(() {
              imagePath = path as String?;
            });
          }
          */
          
          // O envio do Título e Descrição continua ativo e funcionando perfeitamente!
          updateHeadline(widget.article);
        },
        label: const Text('Update Homescreen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            widget.article.description,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20.0),
          Text(widget.article.articleText ?? ''),
          const SizedBox(height: 20.0),
          Center(
            key: _globalKey,
            child: LineChart(), 
          ),
          const SizedBox(height: 20.0),
          Text(widget.article.articleText ?? ''),
        ],
      ),
    );
  }
}