import 'package:flutter/material.dart';

class NsjLoader extends StatelessWidget {
  const NsjLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://s3.sa-east-1.amazonaws.com/imagens.nasajon/logos/nasajon/nova-marca/loader-nasajon.gif',
        scale: 2.0,
      ),
    );
  }
}
