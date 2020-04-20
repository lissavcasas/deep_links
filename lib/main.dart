import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc.dart';
import 'package:deep_links_flutter/poc.dart';

void main() => runApp(PocApp());

class PocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = DeepLinkBloc();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter and Deep Linsk PoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          title: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.blue,
            fontSize: 25.0,
          ),
        ),
      ),
      home: Scaffold(
        body: Provider<DeepLinkBloc>(
          create: (context) => _bloc,
          dispose: (context, bloc) => bloc.dispose(),
          child: PocWidget(),
        ),
      ),
    );
  }
}