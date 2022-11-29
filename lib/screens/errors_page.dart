import 'package:flutter/material.dart';
import 'package:picklist_ui/components/error_item.dart';
import 'package:picklist_ui/models/response_model.dart';

import 'package:picklist_ui/screens/pickList_page.dart';

class ErrorsPage extends StatelessWidget {
  const ErrorsPage({super.key, required this.list});
  final MultiStatusResponse list;

  @override
  Widget build(BuildContext context) {
    final errorList = setErrorList(list.responseList);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PickListPage(),
                  ),
                ),
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Picklists não liberadas'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 156),
          child: SizedBox(
            width: 1050,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 64.0,
                        right: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                              width: 109,
                              child: Text(
                                'Picklist ID',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                              width: 80,
                              child: Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                              width: 650,
                              child: Text(
                                'Mensagem de erro',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        itemCount: errorList.length,
                        itemBuilder: ((context, int index) {
                          var item = errorList.elementAt(index);
                          return ErrorItem(item: item);
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<ResponseModel> setErrorList(List<ResponseModel> list) {
    final errorList = list.toList();
    for (final ResponseModel item in errorList) {
      if (item.status == 201) {
        errorList.remove(item);
      }
    }
    return errorList;
  }
}
