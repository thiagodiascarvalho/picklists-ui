import 'package:flutter/material.dart';
import 'package:picklist_ui/constants/colors.dart';
import 'package:picklist_ui/models/picklist_model.dart';

import 'package:intl/intl.dart';
import 'package:picklist_ui/repositories/selected_picklists_repository.dart';

class PickListItem extends StatefulWidget {
  PickListItem({Key? key, required this.item}) : super(key: key);
  final PickListModel item;
  bool isChecked = false;

  @override
  State<PickListItem> createState() => _PickListItem();
}

class _PickListItem extends State<PickListItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.only(left: 16, right: 16),
      // height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: removeCheckbox(widget.item.status)),
          Expanded(
            flex: 8,
            child: Text(
                '${widget.item.nomeCliente}${widget.item.cnpjCliente} ${widget.item.nomeLocal} \n${widget.item.endereco}'),
          ),
          Expanded(
            flex: 2,
            child: Text(DateFormat("dd/MM/yyyy").format(
                DateTime.tryParse(widget.item.dataCriacao.toString())!)),
          ),
          Expanded(
            flex: 1,
            child: Text('${widget.item.pickListId}'),
          ),
          removeErrorMessage(widget.item.status),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 24, right: 8),
              alignment: Alignment.center,
              height: 22,
              decoration: BoxDecoration(
                color: setStatusColor(widget.item.status),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                toBeginningOfSentenceCase(widget.item.status).toString(),
                style: TextStyle(
                  color: setStatusTextColor(widget.item.status),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setStatusColor(String status) {
    switch (status) {
      case 'pendente':
        return nsj_colors_status_warning;
      case 'processando':
        return nsj_colors_status_warning;
      case 'liberado':
        return nsj_colors_status_success;
      case 'erro':
        return nsj_colors_status_danger;
    }
  }

  setStatusTextColor(String status) {
    switch (status) {
      case 'pendente':
        return nsj_colors_text_primary;
      case 'processando':
        return nsj_colors_text_primary;
      case 'liberado':
        return nsj_colors_backgroung_primary;
      case 'erro':
        return nsj_colors_backgroung_primary;
    }
  }

  removeCheckbox(String status) {
    return status == 'pendente'
        ? Checkbox(
            checkColor: nsj_colors_primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: Colors.white,
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = !widget.isChecked;
              });
              (widget.isChecked == true)
                  ? SelectedPickListRepository.addPickListId(
                      widget.item.pickListId)
                  : SelectedPickListRepository.removePickListId(
                      widget.item.pickListId);
            })
        : const  SizedBox(
            width: 32,
            height: 32,
          );
  }

  removeErrorMessage(String status) {
    return status == 'erro'
        ? Expanded(
            flex: 3,
            child: Text('${widget.item.mensagemErro}'),
          )
        : const SizedBox();
  }

  @override
  bool get wantKeepAlive => true;
}
