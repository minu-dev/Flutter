import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        // 화면 상단 영역
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
            style: TextStyle(fontSize: 28),
          ),
          centerTitle: true,
        ),
        // 화면 중앙 영역
        body: SingleChildScrollView(
          // 키보드가 올라오면서 위젯이 가려지는 현상 해결을 위함
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                    width: 81,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "이메일을 입력하세요.",
                  ),
                ),
                TextField(
                  obscureText: true, // 입력된 텍스트 비화
                  decoration: InputDecoration(
                    labelText: "비밀번호를 입력하세요.",
                  ),
                ),
                Container(
                  // ElevatedButton 자체에는 width 속성이 없으므로
                  // 부모 위젯(Container)을 만들어 크기를 조절하는 방식
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("로그인"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
