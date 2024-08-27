class FeaturedMedia {
  final int id;
  final String sourceUrl;

  FeaturedMedia({
    required this.id,
    required this.sourceUrl,
  });

  factory FeaturedMedia.fromJson(Map<String, dynamic> json) {
    return FeaturedMedia(
      id: json['id'],
      sourceUrl: json['source_url'],
    );
  }
}

class Post {
  final int id;
  final String date;
  final String title;
  final String link;
  final String content;
  final FeaturedMedia? featuredMedia;

  Post({
    required this.id,
    required this.date,
    required this.title,
    required this.link,
    required this.content,
    this.featuredMedia,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      date: json['date'],
      title: json['title']['rendered'],
      link: json['link'],
      content: json['content']['rendered'],
      featuredMedia: json['featured_media'] != null
          ? FeaturedMedia(
              id: json['featured_media'], sourceUrl: '') // Placeholder
          : null,
    );
  }

  Post copyWith({FeaturedMedia? featuredMedia}) {
    return Post(
      id: id,
      date: date,
      title: title,
      link: link,
      content: content,
      featuredMedia: featuredMedia ?? this.featuredMedia,
    );
  }
}
