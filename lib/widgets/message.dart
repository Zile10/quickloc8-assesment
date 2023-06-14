class Message {
  final String message;
  final String subject;
  final String display;

  Message({required this.message, required this.subject, required this.display});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String,
      subject: json['subject'] as String,
      display: json['display'] as String,
    );
  }
}
