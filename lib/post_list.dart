import 'package:echophare/main.dart';
import 'package:flutter/material.dart';
import 'utils/wordpress.api.dart';
import 'utils/wordpress.type.dart';
import 'package:html/parser.dart' as html_parser;

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: post.featuredMedia != null
                      ? Image.network(
                          post.featuredMedia!.sourceUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : null,
                  title: Text(
                    convertHtmlToText(post.title),
                    style: const TextStyle(fontSize: 12.0),
                  ),
                  subtitle: Text(
                    formatDate(post.date),
                    style: const TextStyle(fontSize: 10.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Aucun article disponible.'));
          }
        },
      ),
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(convertHtmlToText(post.title)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              post.featuredMedia != null
                  ? Image.network(post.featuredMedia!.sourceUrl)
                  : Container(),
              const SizedBox(height: 10),
              Text(
                convertHtmlToText(post.title),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(formatDate(post.date)),
                  const SizedBox(width: 5),
                  Text(formatTime(post.date))
                ],
              ),
              const SizedBox(height: 10),
              Text(convertHtmlToText(post.content)),
            ],
          ),
        ),
      ),
    );
  }
}

String convertHtmlToText(String htmlString) {
  final document = html_parser.parse(htmlString);
  return document.body?.text ?? '';
}
