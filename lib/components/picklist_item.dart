import 'package:flutter/material.dart';
import 'package:picklist_ui/components/checkbox_controller.dart';
import 'package:picklist_ui/models/picklist_model.dart';
import 'package:intl/intl.dart';
import 'package:picklist_ui/repositories/selected_picklists_repository.dart';

class PickListItem extends StatefulWidget {
  PickListItem({Key? key, required this.item}) : super(key: key);
  final PickListModel item;
  final CheckboxController controller = CheckboxController();

  @override
  State<PickListItem> createState() => _PickListItem();
}

class _PickListItem extends State<PickListItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: Text(
                    '${widget.item.nomeCliente}\n${widget.item.nomeLocal}'),
                content: Text(
                    'Data de Criação\n${DateFormat("dd/MM/yyyy").format(DateTime.tryParse(widget.item.dataCriacao.toString())!)}\n\nEndereço\n${widget.item.endereco}\n\nCNPJ\n${widget.item.cnpjCliente}\n\nPicklist ID\n${widget.item.pickListId}'),
              )),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Checkbox(
                    checkColor: const Color.fromARGB(255, 0, 69, 155),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    activeColor: Colors.white,
                    value: widget.controller.isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.controller.select();
                      });
                      if (widget.controller.isChecked == true) {
                        SelectedPickListRepository.addPickListId(
                            widget.item.pickListId);
                      } else {
                        SelectedPickListRepository.removePickListId(
                            widget.item.pickListId);
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 650,
                  child: Text(
                      '${widget.item.nomeCliente}${widget.item.cnpjCliente} ${widget.item.nomeLocal} \n${widget.item.endereco}'),
                ),
              ],
            ),
            SizedBox(
              width: 126,
              child: Text(DateFormat("dd/MM/yyyy").format(
                  DateTime.tryParse(widget.item.dataCriacao.toString())!)),
            ),
            SizedBox(
              width: 109,
              child: Text('#${widget.item.pickListId}'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
