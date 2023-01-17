import 'dart:async';
import 'package:flutter/material.dart';
import 'package:picklist_ui/components/dialogs/error_dialog.dart';

import 'package:picklist_ui/components/dialogs/success_dialog.dart';
import 'package:picklist_ui/components/dialogs/timeout_dialog.dart';
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
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'Liberação de picklist',
              ),
            ),
            body: const PicklistList(
                // getPicklistUrl: setFilter(),
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
                      onPressed: onPressed(),
                      child: const Text('Liberar'),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  showTimeoutDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const TimeoutDialog(),
    );
  }

  onPressed() {
    return isButtonDisabled
        ? null
        : () async {
            setState(() => loading = true);
            final response = await Http.postPicklist(
              SelectedPickListRepository.selectedPickLists,
            );

            setState(() => loading = false);
            if (response == TimeoutException) {
              showTimeoutDialog();
            } else if (response.statuscode == 200) {
              showDialog(
                context: context,
                builder: (BuildContext context) => const SuccessDialog(),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) => const ErrorDialog(),
              );
            }
            SelectedPickListRepository.clear();
          };
  }
}
