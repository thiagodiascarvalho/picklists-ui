import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {super.key, required this.codigoErro, required this.descricaoErro});

  final String codigoErro;
  final String descricaoErro;

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
            Icons.cancel,
            size: 80,
            color: Color.fromARGB(255, 217, 83, 79),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
            child: Text(
              'Parece que ocorreu um erro $codigoErro',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'A descrição do erro é:\n\n$descricaoErro.',
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
