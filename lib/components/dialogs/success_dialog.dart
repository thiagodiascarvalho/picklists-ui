import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                  onPressed: () => Navigator.pop(context)),
            ],
          ),
          const Icon(
            Icons.check_circle,
            size: 80,
            color: Color.fromARGB(255, 40, 167, 69),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: Text(
              'Lista enviada com sucesso',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'As notas fiscais serão geradas e aparecerão\nem breve no seu sistema.',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
