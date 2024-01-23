import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchController extends GetxController {
  int count = 0;
   StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    // onStopped: () {
    //   print('onStop');
    // },
    // onEnded: () {
    //   print('onEnded');
    // },
  );

  var isRunning = false.obs;
  final scrollController = ScrollController();

  void StartAndpause() {
    if(isRunning.value ){
      stopWatchTimer.onStopTimer();
    }else{
      stopWatchTimer.onStartTimer();
    }
    isRunning.value = !isRunning.value;
    update();
  }
  void Reset() {
    stopWatchTimer.onResetTimer();
    if(isRunning.value) isRunning.value  = !isRunning.value ;
    update();
  }


  void AddLap() {
    stopWatchTimer.onAddLap();



  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer.dispose();
  }

}