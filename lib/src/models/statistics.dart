class Statistics {
    String? viewCount;
    String? likeCount;
    String? favoriteCount;
    String? commentCount;
    String? subscriberCount;
    

    Statistics({
        this.viewCount,
        this.likeCount,
        this.favoriteCount,
        this.commentCount,
        this.subscriberCount,
    });

    factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
        subscriberCount: json["subscriberCount"],
    );

    Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
    };
}
