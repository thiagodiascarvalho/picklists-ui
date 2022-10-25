import 'package:flutter/material.dart';
import 'package:picklist_ui/models/response_model.dart';

class MultistatusDialog extends StatelessWidget {
  const MultistatusDialog({super.key, required this.list});
  final MultiStatusResponse list;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                  ),
                  onPressed: () => Navigator.pop(context)),
            ],
          ),
          const Icon(
            Icons.warning,
            size: 80,
            color: Color.fromARGB(250, 249, 130, 26),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: Text(
              'Parece que a lista foi parcialmente enviada',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Veja o que aconteceu com cada uma das picklists enviadas:',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 300,
              width: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.responseList.length,
                itemBuilder: ((context, int index) {
                  final ResponseModel item = list.responseList.elementAt(index);
                  return ListTile(
                      isThreeLine: true,
                      title: Text('Picklist ID: ${item.pickListId}'),
                      subtitle: setItemStatusMessage(item));
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setItemStatusMessage(ResponseModel item) {
    switch (item.status) {
      case 201:
        return Text('Status: ${item.status}\nPicklist liberada com sucesso.');
      case 404:
        return Text(
            'Status: ${item.status}\n${item.body.message.substring(0, 52)}');
    }
  }
}
