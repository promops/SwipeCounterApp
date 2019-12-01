import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_counter/bloc/swipe_counter_bloc/swipe_counter.dart';
import 'package:swipe_counter/styles/colors.dart';
import 'package:swipe_counter/view/main_page/widgets/counter_widget.dart';
import 'package:swipe_counter/view/main_page/widgets/reset_button.dart';

import 'widgets/control_button.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SwipeCounterBloc _counterBloc;

  @override
  void initState() {
    _counterBloc = SwipeCounterBloc();
    _counterBloc.add(Init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Swipe Counter',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[

                  Positioned(
                    left: 16,
                    child: ControlButton(
                      action: () => _counterBloc.add(Decrement()),
                      title: '-',
                    ),
                  ),

                  Positioned(
                    right: 16,
                    child: ControlButton(
                      action: () => _counterBloc.add(Increment()),
                      title: '+',
                    ),
                  ),

                  BlocBuilder(
                    bloc: _counterBloc,
                    builder: (BuildContext context, SwipeCounterState state) {
                      if (state is InitialState) return CircularProgressIndicator();
                  

                      if (state is CounterState)
                        return CounterWidget(
                            key: UniqueKey(),
                            count: state.count,
                            onSwipedLeft: () => _counterBloc.add(Decrement()),
                            onSwipedRight: () => _counterBloc.add(Increment()));

                      return Container();
                    },
                  ),

                ],
              ),
            ),

            ResetButton(
              onTap: () => _counterBloc.add(Reset()),
            )

          ],
        )));
  }
}
