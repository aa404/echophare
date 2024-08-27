import 'dart:convert';
import 'package:echophare/config.dart';
import 'package:http/http.dart' as http;

import 'wordpress.type.dart';

Future<FeaturedMedia> fetchFeaturedMedia(int mediaId) async {
  final response =
      await http.get(Uri.parse('$baseUrl/wp-json/wp/v2/media/$mediaId'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    return FeaturedMedia.fromJson(jsonData);
  } else {
    throw Exception(
        'Échec de chargement du média vedette : ${response.statusCode}');
  }
}

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('$baseUrl/wp-json/wp/v2/posts'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    List<Post> posts = [];

    for (var item in jsonData) {
      if (item is Map<String, dynamic>) {
        final post = Post.fromJson(item);
        if (post.featuredMedia != null) {
          final media = await fetchFeaturedMedia(post.featuredMedia!.id);
          posts.add(post.copyWith(featuredMedia: media));
        } else {
          posts.add(post);
        }
      } else {
        throw Exception('Élément inattendu dans la liste : $item');
      }
    }

    return posts;
  } else {
    throw Exception(
        'Échec de chargement des articles : ${response.statusCode}');
  }
}
