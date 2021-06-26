import 'package:counter/BLoC/cubit/connectivity_cubit.dart';
import 'package:counter/BLoC/cubit/counter_cubit.dart';
import 'package:counter/Constants/Enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).doubleX();
        } else if (state is ConnectivityConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).half();
        } else if (state is ConnectivityDisconnected) {
          BlocProvider.of<CounterCubit>(context).triple();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("widget"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<ConnectivityCubit, ConnectivityState>(
                  builder: (context, state) {
                    if (state is ConnectivityConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return Text(
                        "Wifi",
                        style: TextStyle(color: Colors.red),
                      );
                    } else if (state is ConnectivityConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return Text(
                        "Mobile",
                        style: TextStyle(color: Colors.pink),
                      );
                    } else if (state is ConnectivityDisconnected) {
                      return Text(
                        "Not Connected",
                        style: TextStyle(color: Colors.pink),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 5,
                ),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.valueX < 0) {
                      return Text(
                        'BRR, NEGATIVE ' + state.valueX.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else if (state.valueX < 0) {
                      return Text(
                        'YAAAY ' + state.valueX.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else if (state.valueX > 5) {
                      return Text(
                        'HMM, greate 5\n' + state.valueX.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else
                      return Text(
                        state.valueX.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).doubleX();
                      },
                      child: Icon(Icons.two_k),
                    ),
                    MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).triple();
                      },
                      child: Icon(Icons.three_g_mobiledata),
                    ),
                    MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).half();
                      },
                      child: Icon(Icons.star_half),
                    ),
                    MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).one3rd();
                      },
                      child: Icon(Icons.one_x_mobiledata),
                    ),
                  ],
                ),
                MaterialButton(
                    child: Text("Other"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Other');
                    }),
              ],
            ),
          )),
    );
  }
}
