import 'package:counter/BLoC/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherX extends StatefulWidget {
  const OtherX({Key? key}) : super(key: key);

  @override
  _OtherXState createState() => _OtherXState();
}

class _OtherXState extends State<OtherX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget"),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.valueX.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
