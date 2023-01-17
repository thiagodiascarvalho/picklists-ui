class PickListModel {
  final int pickListId;
  final String dataCriacao;
  final String nomeLocal;
  final String endereco;
  final String? nomeCliente;
  final String? cnpjCliente;
  final String status;
  final String? mensagemErro;

  PickListModel(
      {required this.pickListId,
      required this.mensagemErro,
      required this.status,
      required this.dataCriacao,
      required this.nomeLocal,
      required this.endereco,
      this.nomeCliente,
      this.cnpjCliente});

  factory PickListModel.fromJson(Map<String, dynamic> json) {
    return PickListModel(
      dataCriacao: json['data_criacao'],
      endereco: json['endereco'],
      nomeLocal: json['nome_local'],
      pickListId: json['pick_list_id'],
      nomeCliente: json['nome_cliente'] ?? 'Cliente não informado -',
      cnpjCliente: json['cnpj_cliente'] ?? '',
      status: json['status'],
      mensagemErro: json['msg_erro'] ?? '',
    );
  }
}
