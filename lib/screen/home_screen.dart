import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // textstyle 지정
    final textStyle = TextStyle(fontSize: 16);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: streamNumbers(),
            builder: (context, snapshot) {

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'StreamBuilder',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),

                  // connectionState.active // 스트림이 끝나지 않았을 떼
                  // connectionState.done //  스트림이 완전히 끝났을 떄
                  Text(
                    'ConState : ${snapshot.connectionState}',
                    style: textStyle,
                  ),


                  Text(
                    'data : ${snapshot.data}',
                    style: textStyle,
                  ),
                  Text(
                    'error : ${snapshot.error}',
                    style: textStyle,
                  ),

                  OutlinedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('setState'),
                  ),
                ],
              );
            }),
      ),
    );
  }

  // 퓨처를 반환해주는 함수
  Future<int> getNumber() async {
    // 3초를 기다려줌
    await Future.delayed(Duration(milliseconds: 1500));

    // 랜덤으로 숫자 만듦
    final rendom = Random();

    // error가 발생했을 떄
    // error 값도 기억해둠
    // 데이터를 잘 받으면 null 값으로 변경
    // throw Exception('error 발생');

    // 최대값을 100으로 설정
    // 100보다 작은 랜덤 숫자를 반환해줌
    return rendom.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      if (i == 5) {
        // error 가 실행되면 data 가 null로 들어감
        throw Exception('i = 5');
      }

      await Future.delayed(Duration(milliseconds: 1500));

      yield i;
    }
  }
}
