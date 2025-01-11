class TimelineItem {
  String title;
  String noteText;
  String category;
  int position;

  TimelineItem({
    required this.title,
    required this.noteText,
    required this.category,
    required this.position,
  });

  factory TimelineItem.fromJson(Map<String, dynamic> json) {
    return TimelineItem(
      title: json['title'],
      noteText: json['noteText'],
      category: json['category'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'noteText': noteText,
      'category': category,
      'position': position,
    };
  }
}
