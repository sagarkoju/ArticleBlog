import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vlogpost/Bloc/switch_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Theming With Bloc'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return SwitchListTile(
                secondary: Icon(
                    state.switchValue ? Icons.dark_mode : Icons.light_mode),
                title: Text(
                  state.switchValue ? 'Dark Mode' : 'Light Mode',
                  style: TextStyle(
                      color: state.switchValue ? Colors.white : Colors.black),
                ),
                value: state.switchValue,
                onChanged: (value) {
                  value
                      ? context.read<SwitchBloc>().add(SwitchOnEvents())
                      : context.read<SwitchBloc>().add(SwitchOffEvents());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
