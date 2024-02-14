import '../../domain/entities/comitter_author.dart';

class ComitterAuthorModel extends ComitterAuthor {
  const ComitterAuthorModel({
    required super.login,
    required super.id,
    required super.nodeId,
    required super.avatarUrl,
    required super.gravatarId,
    required super.url,
    required super.htmlUrl,
    required super.followersUrl,
    required super.followingUrl,
    required super.gistsUrl,
    required super.starredUrl,
    required super.subscriptionsUrl,
    required super.organizationsUrl,
    required super.reposUrl,
    required super.eventsUrl,
    required super.receivedEventsUrl,
    required super.type,
    required super.siteAdmin,
  });

  factory ComitterAuthorModel.fromJson(Map<String, dynamic> json) {
    return ComitterAuthorModel(
      login: json["login"],
      id: json["id"],
      nodeId: json["node_id"],
      avatarUrl: json["avatar_url"],
      gravatarId: json["gravatar_id"],
      url: json["url"],
      htmlUrl: json["html_url"],
      followersUrl: json["followers_url"],
      followingUrl: json["following_url"],
      gistsUrl: json["gists_url"],
      starredUrl: json["starred_url"],
      subscriptionsUrl: json["subscriptions_url"],
      organizationsUrl: json["organizations_url"],
      reposUrl: json["repos_url"],
      eventsUrl: json["events_url"],
      receivedEventsUrl: json["received_events_url"],
      type: json["type"],
      siteAdmin: json["site_admin"],
    );
  }
}
