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
        child: FutureBuilder(
            future: getNumber(),
            builder: (context, snapshot) {
              // connectionState에 따라 ui 변경하는 것 좋지 않음!
              // 로딩 화면을 보여줘야할 순간

              // headata가 false 일떄 -> 한 번도 데이터 요청을 안 했을 때
              // if (!snapshot.hasData) {
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }

              // hasData -> data 값이 넣인지 아닌지만 확이해줌
              //   bool get hasData => data != null;
              if (snapshot.hasData) {
                // 데이터가 있을 때 위젯 렌더링
              }

              if (snapshot.hasError) {
                // 에러가 닜을 때 위젯 렌더링
              }

              // 로딩중일 때 위젯 렌더링

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'FutureBuilder',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'ConState : ${snapshot.connectionState}',
                    style: textStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        'data : ${snapshot.data}',
                        style: textStyle,
                      ),
                      // 하나만 띡 보여주는 것보단 훨씬 보기 좋음
                      // if (snapshot.connectionState == ConnectionState.waiting)
                      //   CircularProgressIndicator(),
                    ],
                  ),
                  Text(
                    'error : ${snapshot.error}',
                    style: textStyle,
                  ),

                  // 빌더만 넣어주면 constate는 none, data error 도 null값
                  // 퓨처를 넣어주면 웨이팉으로 바뀜,데이터가 나오면서 던으로 바뀜
                  // connectionState 가 바뀔 때마다 빌더 함수가 새로 빌드됨

                  // setState 를 실행하면 connectionState 는 바뀌지만 data 가 null 안되고 기존으 값을 보여줌
                  // 퓨차빌더가 기존의 재실행값을 기억함
                  //
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
}
