import 'package:flutter_youtube_d5354/src/models/statistics.dart';
import 'package:flutter_youtube_d5354/src/models/video.dart';

class Youtuber {
  Snippet? snippet;
  Statistics? statistics;

  Youtuber({
    this.snippet,
    this.statistics,
  });

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: Snippet.fromJson(json["snippet"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );
}
