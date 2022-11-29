import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:picklist_ui/components/list_shimmer.dart';

import 'package:picklist_ui/components/nasajon_loader.dart';
import 'package:picklist_ui/components/picklist_item.dart';
import 'package:picklist_ui/http/http.dart';

import 'package:picklist_ui/models/picklist_model.dart';

class PicklistList extends StatefulWidget {
  const PicklistList({
    super.key,
  });
  static bool buttomIsDisable = true;

  @override
  State<PicklistList> createState() => _PicklistListState();
}

class _PicklistListState extends State<PicklistList> {
  List<PickListModel> picklists = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Future<dynamic> futurePicklist = Http.getPicklist();
    createListOfPicklist(futurePicklist);

    return loading
        ? const NsjLoader()
        : Align(
            alignment: Alignment.topCenter,
            child: Card(
              margin: EdgeInsets.only(bottom: 80),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 64.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                              width: 650,
                              child: Text(
                                'Cliente',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                              width: 126,
                              child: Text(
                                'Data de criação',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                              width: 109,
                              child: Text(
                                'Picklist ID',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder<dynamic>(
                    future: futurePicklist,
                    builder: (context, snapshot) {
                      final orderedPicklists = orderList(picklists).reversed;
                      if (snapshot.hasData) {
                        if (picklists.isEmpty) {
                          return const Center(
                              child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Não há picklists à liberar'),
                          ));
                        } else {
                          return Expanded(
                            child: Scrollbar(
                              thumbVisibility: true,
                              child: ListView.builder(
                                primary: true,
                                shrinkWrap: true,
                                itemCount: orderedPicklists.length,
                                itemBuilder: ((context, int index) {
                                  var item = orderedPicklists.elementAt(index);
                                  return PickListItem(
                                    item: item,
                                  );
                                }),
                              ),
                            ),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Não foi possível carregar a lista'),
                        ));
                      }
                      return const ListShimmer();
                    },
                  ),
                ],
              ),
            ),
          );
  }

  void createListOfPicklist(Future<dynamic> futureList) {
    futureList.then((response) {
      List list = jsonDecode(response.body);
      picklists = list.map((model) => PickListModel.fromJson(model)).toList();
    });
  }

  List<PickListModel> orderList(List<PickListModel> list) {
    list.sort((a, b) => a.dataCriacao.compareTo(b.dataCriacao));
    return list;
  }
}
