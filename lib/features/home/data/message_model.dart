class MessageModel {
  final String message;
  final String sender;
  final String time;

  MessageModel({
    required this.message,
    required this.sender,
    required this.time,
  });

  // factory MessageModel.fromJson(Map<String, dynamic> json) {
  //   return MessageModel(
  //     message: json['message'],
  //     sender: json['sender'],
  //     time: json['time'],
  //   );
  // }
}

List<MessageModel> messages = [];
