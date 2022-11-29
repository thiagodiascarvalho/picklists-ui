class MultiStatusResponse {
  MultiStatusResponse({
    required this.globalStatus,
    required this.responseList,
  });
  late final String globalStatus;
  late final List<ResponseModel> responseList;

  MultiStatusResponse.fromJson(Map<String, dynamic> json) {
    globalStatus = json['global_status'];
    responseList = List.from(json['response'])
        .map((e) => ResponseModel.fromJson(e))
        .toList();
  }
}

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.pickListId,
    required this.body,
  });
  late final int status;
  late final int pickListId;
  late final BodyModel body;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pickListId = json['pick_list_id'];
    body = BodyModel.fromJson(json['body']);
  }
}

class BodyModel {
  BodyModel({
    required this.message,
  });
  late final String? message;
  late final String? urlStatusEmissao;

  BodyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    urlStatusEmissao = json['url_status_emissao'];
  }
}
