import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PicklistListTitleRow extends StatelessWidget {
  const PicklistListTitleRow({super.key, required this.itemStatus});

  final String itemStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.only(left: 64.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
                flex: 8,
                child: Text(
                  'Cliente',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            const Expanded(
                flex: 2,
                child: Text(
                  'Data de criação',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            const Expanded(
                flex: 1,
                child: Text(
                  'Picklist ID',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            removeErrorMessageTitle(itemStatus),
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 24, right: 16),
                  child: Text(
                    'Status',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  removeErrorMessageTitle(String status) {
    return status == 'error'
        ? const Expanded(
            flex: 3,
            child: Text(
              'Mensagem de erro',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ))
        : const SizedBox();
  }
}
