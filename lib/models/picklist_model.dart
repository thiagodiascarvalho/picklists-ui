class PickListModel {
  final int pickListId;
  final String dataCriacao;
  final String nomeLocal;
  final String endereco;
  final String? nomeCliente;
  final String? cnpjCliente;

  PickListModel({
    required this.pickListId,
    required this.dataCriacao,
    required this.nomeLocal,
    required this.endereco,
    this.nomeCliente,
    this.cnpjCliente,
  });

  factory PickListModel.fromJson(Map<String, dynamic> json) {
    return PickListModel(
      pickListId: json['pick_list_id'],
      dataCriacao: json['data_criacao'],
      nomeLocal: json['nome_local'],
      endereco: json['endereco'],
      nomeCliente: json['nome_cliente -'] ?? 'Cliente não informado -',
      cnpjCliente: json['cnpj_cliente -'] ?? '',
    );
  }
}
