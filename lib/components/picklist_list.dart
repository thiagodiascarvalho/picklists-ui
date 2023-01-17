import 'package:flutter/material.dart';
import 'package:picklist_ui/components/list_shimmer.dart';
import 'package:picklist_ui/components/picklist_item.dart';

import 'package:picklist_ui/components/picklist_list_title_row.dart';
import 'package:picklist_ui/constants/colors.dart';
import 'package:picklist_ui/http/http.dart';
import 'package:picklist_ui/http/http_mock.dart';

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
  int selectedIndex = 0;
  String filter = 'pending';

  @override
  Widget build(BuildContext context) {
    Future<List<PickListModel>> futurePicklist2 =
        Http.getPicklist(setUrlFilter(filter));
    // Future<dynamic> futurePicklist2 =
    //     HttpMock.getPicklist(setUrlFilter(filter));

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(4),
            height: 41,
            alignment: Alignment.topCenter,
            width: 400,
            child: BottomNavigationBar(
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  tooltip: null,
                  icon: Icon(
                    Icons.home,
                    size: 0,
                    color: Colors.transparent,
                  ),
                  label: 'Pendentes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 0,
                    color: Colors.transparent,
                  ),
                  label: 'Processando',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 0,
                    color: Colors.transparent,
                  ),
                  label: 'Liberadas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 0,
                    color: Colors.transparent,
                  ),
                  label: 'Com erro',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: nsj_colors_primary,
              onTap: (int index) {
                switch (index) {
                  case 0:
                    setState(() {
                      filter = 'pending';
                    });
                    break;
                  case 1:
                    setState(() {
                      filter = 'processing';
                    });
                    break;
                  case 2:
                    setState(() {
                      filter = 'success';
                    });
                    break;
                  case 3:
                    setState(() {
                      filter = 'error';
                    });
                    break;
                }
                setState(
                  () {
                    selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(128, 32, 128, 80),
            child: Card(
              margin: const EdgeInsets.only(bottom: 80),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PicklistListTitleRow(
                    itemStatus: filter,
                  ),
                  FutureBuilder<List<PickListModel>>(
                    future: futurePicklist2,
                    builder: (context, snapshot) {
                      final picklists = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (picklists!.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 256.0),
                            child: Text(setEmptyListMessage(filter)),
                          );
                        } else {
                          return Expanded(
                            child: Scrollbar(
                              thumbVisibility: true,
                              child: ListView.builder(
                                primary: true,
                                shrinkWrap: true,
                                itemCount: picklists.length,
                                itemBuilder: ((context, int index) {
                                  final PickListModel item =
                                      picklists.elementAt(index);
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
          ),
        ),
      ],
    );
  }

  setUrlFilter(String filter) {
    switch (filter) {
      case 'error':
        return 'erro';
      case 'pending':
        return 'pendente';
      case 'success':
        return 'liberado';
      case 'processing':
        return 'processando';
    }
  }

  setEmptyListMessage(String filter) {
    switch (filter) {
      case 'error':
        return 'Não há picklists com erro';
      case 'pending':
        return 'Não há picklists pendentes';
      case 'success':
        return 'Não há picklists liberadas';
      case 'processing':
        return 'Não há picklists sendo processadas';
    }
  }
}
