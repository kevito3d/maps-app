import 'package:flutter/material.dart';
import 'package:mapas_app/bloc/gps/gps_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:  BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return state.isGpsEnabled ? const _AccessButton() : const _EnableGpsMessage();
          },
        ),
        // child:_AccessButton(),
        // child:_EnableGpsMessage(),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el GPS para usar esta App'),
        const SizedBox(height: 10),
        MaterialButton(
          color: Colors.black,
          textColor: Colors.white,
          shape: const StadiumBorder(),
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsPermission();
          },
          elevation: 0,
          splashColor: Colors.transparent ,
          child: const Text('Solicitar Acceso'),
        ),
        
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe habilitar el GPS',
      style: TextStyle(fontSize: 18),
    );
  }
}
