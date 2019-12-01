import 'package:flutter/material.dart';
import 'package:swipe_counter/view/main_page/widgets/swipe_card.dart';

class CounterWidget extends StatefulWidget {

  final int count;
  final Function onSwipedRight;
  final Function onSwipedLeft;

  CounterWidget({Key key, this.count, this.onSwipedLeft, this.onSwipedRight})
      : super(key: key);
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>
    with TickerProviderStateMixin {

  AnimationController _swipeController, _scaleController;

  Animation<double> _swipeOutAnimation;
  Animation<double> _scaleAnimation;

  double _cardCoordinate = 0;
  bool _isSwipeDown = false;
  double _swipeDownCoordinate = 0;

  @override
  void initState() {
    _swipeController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..addStatusListener(_swipeStatusListener);

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..forward();

    _scaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_scaleController);

    super.initState();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _swipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          
            onHorizontalDragUpdate: (value) {
              setState(() {
                _cardCoordinate += value.primaryDelta;
              });
            },

            onHorizontalDragEnd: (value) => _onDragEnd(),

            child: AnimatedBuilder(
              animation: _swipeController,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: SwipeCard(
                  size: MediaQuery.of(context).size.width / 2,
                  count: widget.count,
                ),
              ),             
              builder: (BuildContext context, Widget child) {
                return Transform.translate(
                  offset: _isSwipeDown
                      ? Offset(_swipeOutAnimation.value, 0)
                      : Offset(_cardCoordinate, 0),
                  child: child,
                );
              },
            )));
  }

  void _onDragEnd() {
    _isSwipeDown = true;
    _swipeDownCoordinate = _cardCoordinate;

    _swipeOutAnimation = Tween<double>(
            begin: _swipeDownCoordinate,
            end: _swipeDownCoordinate < 0 ? -500 : 500)
        .animate(_swipeController);

    _swipeController.forward();
  }

  void _swipeStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed)
      _swipeDownCoordinate < 0 ? widget.onSwipedLeft() : widget.onSwipedRight();
  }
}
