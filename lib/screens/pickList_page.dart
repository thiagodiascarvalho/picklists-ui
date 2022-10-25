import 'package:flutter/material.dart';
import 'package:liberacao_picklist/components/dialogs/error_dialog.dart';
import 'package:liberacao_picklist/components/dialogs/multistatus_dialog.dart';
import 'package:liberacao_picklist/components/dialogs/success_dialog.dart';
import 'package:liberacao_picklist/components/nasajon_loader.dart';
import 'package:liberacao_picklist/components/picklist_list.dart';
import 'package:liberacao_picklist/http/http.dart';
import 'package:liberacao_picklist/repositories/selected_picklists_repository.dart';

class PickListPage extends StatefulWidget {
  const PickListPage({Key? key}) : super(key: key);
  static final List<int> selectedPickLists = [];

  @override
  State<PickListPage> createState() => _PickListPageState();
}

class _PickListPageState extends State<PickListPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const NsjLoader()
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'Liberação de picklist',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
            ),
            body: const Padding(
              padding: EdgeInsets.only(
                top: 32,
                left: 32,
                right: 32,
              ),
              child: Center(
                child: SizedBox(
                  width: 800,
                  child: PicklistList(),
                ),
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.only(bottom: 64.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 94,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 0, 69, 155))),
                      onPressed: () async {
                        setState(() => loading = true);
                        var response = await Http.postPicklist(
                            SelectedPickListRepository.selectedPickLists);

                        setState(() => loading = false);
                        switch (response.globalStatus) {
                          case "ERROR":
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => ErrorDialog(
                                    codigoErro: response
                                        .responseList.first.status
                                        .toString(),
                                    descricaoErro: response
                                        .responseList.first.body.message
                                        .substring(0, 52)));
                            break;
                          case "OK":
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    const SuccessDialog());
                            break;
                          case "MULTI-STATUS":
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    MultistatusDialog(
                                      list: response,
                                    ));
                            break;
                        }
                        SelectedPickListRepository.clear();
                      },
                      child: const Text('Liberar'),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
