import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc.dart';

class PocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(snapshot.data); //when there is  not link is null
          return Container(
            child: Center(
              child: Text(
                'No deep link was used  ',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          );
        } else {
          print(!snapshot.hasData); //false
          if (snapshot.data == 'dev://oss.eurorenting.com.pe') {
            return Container(
              child: Center(
                child: Text(
                  'Welcome home',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,
                    fontSize: 25.0,
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Redirected: ${snapshot.data}',
                      style: Theme.of(context).textTheme.title),
                ),
              ),
            );
          }
        }
      },
    );
  }
}