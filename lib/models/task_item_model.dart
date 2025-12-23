class TaskItem {
  int? id;
  String? taskDescription;
  String? category;
  String? createdAt;
  DateTime? dueDateTime;
  DateTime? completedAt;
  String? userID;
  bool? isCompleted;

  TaskItem({
    this.id,
    this.taskDescription,
    this.category,
    this.createdAt,
    this.dueDateTime,
    this.completedAt,
    this.userID,
    this.isCompleted,
  });

  TaskItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskDescription = json['taskDescription'];
    category = json['category'];
    createdAt = json['createdAt'];
    dueDateTime = json['dueDateTime'];
    completedAt = json['completedAt'];
    userID = json['userID'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['taskDescription'] = taskDescription;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['dueDateTime'] = dueDateTime;
    data['completedAt'] = completedAt;
    data['userID'] = userID;
    data['isCompleted'] = isCompleted;
    return data;
  }
}
