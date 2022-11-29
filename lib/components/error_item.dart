import 'package:flutter/material.dart';
import 'package:picklist_ui/models/response_model.dart';

class ErrorItem extends StatelessWidget {
  const ErrorItem({super.key, required this.item});
  final ResponseModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 64, right: 16, bottom: 16),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 109,
            child: Text('#${item.pickListId}'),
          ),
          SizedBox(
            width: 80,
            child: Text('${item.status}'),
          ),
          SizedBox(
            width: 650,
            child: Text('${item.body.message}'),
          ),
        ],
      ),
    );
  }
}
