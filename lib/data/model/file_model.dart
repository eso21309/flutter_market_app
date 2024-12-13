// {
//     "id": 2,
//     "url": "http://192.168.35.33:8080/api/file/732daad1-6f3d-43d4-b682-da0b12ae84a7",
//     "originName": "burger.jpg",
//     "contentType": "image/jpeg",
//     "createdAt": "2024-12-13T07:19:21.275+00:00"
//   }

class FileModel {
  int id;
  String url;
  String originName;
  String contentType;
  DateTime createdAt;

  FileModel({
    required this.id,
    required this.url,
    required this.originName,
    required this.contentType,
    required this.createdAt,
  });

  // fromJson 생성자
  FileModel.fromJson(Map<String, dynamic> map)
      : this(
          id: map["id"],
          url: map["url"],
          originName: map["originName"],
          contentType: map["contentType"],
          createdAt: DateTime.parse(map["createdAt"]),
        );

  // toJson 메서드
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "url": url,
      "originName": originName,
      "contentType": contentType,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
