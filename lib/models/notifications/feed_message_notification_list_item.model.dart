class MessageFeedNotificationListItem {
  int conversationId;
  int fromId;
  String fromName;
  String fromPictureUrl;
  String body;
  String fromCountry;

  MessageFeedNotificationListItem();
  MessageFeedNotificationListItem.complete(
      this.conversationId,
      this.fromId,
      this.fromName,
      this.fromPictureUrl,
      this.body,
      this.fromCountry
      );
}