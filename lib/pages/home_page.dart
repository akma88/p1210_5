import 'package:flutter/material.dart';
import 'package:p1210_5/bloc/user_bloc.dart';
import 'package:p1210_5/services/user_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>()),
        child: Scaffold(
          appBar: AppBar(title: const Text('User List'), centerTitle: true),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
