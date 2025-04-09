import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ssl_pinning/rest_news.dart';

import 'main.dart';
import 'model_news.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Client? client;
  RESTNews? apiService;
  List<ModelNewsArticles> articles = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchSSL().then((value) {
      fetchNewsDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: SafeArea(
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    ModelNewsArticles article = articles[index];

                    return ListTile(title: Text(article.title!), subtitle: Text(article.description ?? ""));
                  },
                ),
      ),
    );
  }

  Future<void> fetchSSL() async {
    client = await getSSL();
    apiService = RESTNews(client!);
  }

  Future<void> fetchNewsDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await apiService!.getArticles();

      if (response!.status == "ok") {
        articles = response.articles!;
        isLoading = false;
        setState(() {});
      } else {
        log("Could not fetch the news.");
        isLoading = false;
        setState(() {});
      }
    } catch (error) {
      log("Something went wrong with error: $error");
      isLoading = false;
      setState(() {});
    }
  }
}
