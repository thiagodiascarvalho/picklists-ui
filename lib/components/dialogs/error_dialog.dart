import 'package:flutter/material.dart';
import 'package:picklist_ui/models/response_model.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.only(bottom: 24, left: 12, right: 12, top: 12),
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
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Icon(
            Icons.cancel,
            size: 80,
            color: Color.fromARGB(255, 217, 83, 79),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: Text(
              'Algo deu errado',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'Houve um problema ao enviar as picklists para liberação.',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
