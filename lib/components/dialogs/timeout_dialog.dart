import 'package:flutter/material.dart';

class TimeoutDialog extends StatelessWidget {
  const TimeoutDialog({super.key});

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
            Icons.warning,
            size: 80,
            color: Color.fromARGB(255, 217, 187, 79),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: Text(
              'Tempo esgotado',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'Houve uma instabilidade interna que fez com que a sua requisição levasse mais tempo que o esperado.\nPor favor, faça a requisição novamente.\nCódigo: 504',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
