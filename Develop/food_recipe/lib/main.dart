import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "category": "Burger",
        "imgUrl": "https://i.ibb.co/VtK43vv/burger.jpg",
      },
      {
        "category": "Well-Being",
        "imgUrl": "https://i.ibb.co/2KbN5pV/soup.jpg",
      },
      {
        "category": "Korean Traditional",
        "imgUrl": "https://i.ibb.co/KXJD0rN/korean-meals.jpg",
      },
      {
        "category": "Dessert",
        "imgUrl": "https://i.ibb.co/9Yn3t0w/tiramisu.jpg",
      },
      {
        "category": "Pizza",
        "imgUrl": "https://i.ibb.co/P9nKtt2/pizza.jpg",
      },
      {
        "category": "Rice",
        "imgUrl": "https://i.ibb.co/3svVzM1/shakshuka.jpg",
      },
    ];

    return Scaffold(
      // 화면 상단 영역
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Food Recipe",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("go my page");
            },
            icon: Icon(
              Icons.person_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    print("돋보기 아이콘 클릭");
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imgUrl = data["imgUrl"];

                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        imgUrl,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                          width: 62,
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "Nickname",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "example@example.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
                aspectRatio: 12 / 4,
                child: PageView(
                  children: [
                    Image.network(
                      "https://i.ibb.co/Q97cmkg/sale-event-banner1.jpg",
                    ),
                    Image.network(
                      "https://i.ibb.co/GV78j68/sale-event-banner2.jpg",
                    ),
                    Image.network(
                      "https://i.ibb.co/R3P3RHw/sale-event-banner3.jpg",
                    ),
                    Image.network(
                      "https://i.ibb.co/LRb1VYs/sale-event-banner4.jpg",
                    ),
                  ],
                )),
            ListTile(
              title: Text(
                "Purchase History",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Saved Recipe',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
