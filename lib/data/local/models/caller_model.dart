class CallerModel {
  final int? id;
  final String phoneNumber;
  final String customName;
  final DateTime createdAt;

  CallerModel({
    this.id,
    required this.phoneNumber,
    required this.customName,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert a CallerModel into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'customName': customName,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Extract a CallerModel from a Map.
  factory CallerModel.fromMap(Map<String, dynamic> map) {
    return CallerModel(
      id: map['id'],
      phoneNumber: map['phoneNumber'],
      customName: map['customName'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // Implement toString to make it easier to see information about
  // each caller when using the print statement.
  @override
  String toString() {
    return 'CallerModel{id: $id, phoneNumber: $phoneNumber, customName: $customName, createdAt: $createdAt}';
  }
}
