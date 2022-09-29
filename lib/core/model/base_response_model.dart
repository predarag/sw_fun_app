class BaseResponseModel<T> {
  BaseResponseModel({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  int count;
  String? next;
  String? previous;
  List<T> results;

  factory BaseResponseModel.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    final items = json['results'].cast<Map<String, dynamic>>();
    return BaseResponseModel<T>(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<T>.from(
        items.map((itemsJson) => fromJsonModel(itemsJson)),
      ),
    );
  }
}
