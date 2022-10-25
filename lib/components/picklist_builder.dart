import 'package:flutter/material.dart';
import 'package:picklist_ui/components/picklist_item.dart';
import 'package:picklist_ui/models/picklist_model.dart';

class PickListBuilder extends StatelessWidget {
  const PickListBuilder({Key? key, required this.itens}) : super(key: key);
  final List<PickListModel> itens;

  @override
  Widget build(BuildContext context) {
    if (itens.isEmpty) {
      return const Center(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Não há picklists à liberar'),
      ));
    } else {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: itens.length,
            itemBuilder: ((context, int index) {
              var item = itens.elementAt(index);
              return PickListItem(item: item);
            }),
          ),
        ],
      );
    }
  }
}
