import 'package:flutter/material.dart';
import 'package:picklist_ui/components/dialogs/error_dialog.dart';
import 'package:picklist_ui/components/dialogs/success_dialog.dart';

import 'package:picklist_ui/components/nasajon_loader.dart';
import 'package:picklist_ui/components/picklist_list.dart';
import 'package:picklist_ui/http/http.dart';

import 'package:picklist_ui/repositories/selected_picklists_repository.dart';
import '../models/response_model.dart';

class PickListPage extends StatefulWidget {
  const PickListPage({Key? key}) : super(key: key);

  @override
  State<PickListPage> createState() => _PickListPageState();
}

class _PickListPageState extends State<PickListPage> {
  bool loading = false;
  bool isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    SelectedPickListRepository.selectedPickListsNotifier
        .addListener(() => setState(
              () => SelectedPickListRepository.selectedPickLists.isNotEmpty
                  ? isButtonDisabled = false
                  : isButtonDisabled = true,
            ));

    return loading
        ? const NsjLoader()
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'Liberação de picklist',
              ),
            ),
            body: const Padding(
              padding: EdgeInsets.fromLTRB(32, 32, 32, 80),
              child: Center(
                child: SizedBox(
                  width: 1050,
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
                      onPressed: isButtonDisabled
                          ? null
                          : () async {
                              setState(() => loading = true);

                              MultiStatusResponse response =
                                  await Http.postPicklist(
                                SelectedPickListRepository.selectedPickLists,
                              );

                              setState(() => loading = false);
                              showDialogSwitch(response);
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

  showDialogSwitch(MultiStatusResponse response) {
    if (response.globalStatus == "MULTI-STATUS" ||
        response.globalStatus == "ERROR") {
      return showDialog(
        context: context,
        builder: (BuildContext context) => ErrorDialog(
          list: response,
        ),
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) => const SuccessDialog(),
      );
    }
  }
}
