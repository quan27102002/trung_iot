class User {
  final String uid;
  final String email;

  User({required this.uid, required this.email});

  // Factory constructor để tạo một đối tượng User từ một document snapshot
  factory User.fromFirestore(Map<String, dynamic> data) {
    return User(
      uid: data['uid'],
      email: data['email'],
    );
  }

  // Phương thức để chuyển đổi đối tượng User thành map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
