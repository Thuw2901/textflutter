import "package:flutter/material.dart";

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    //Trả về 1 Scaffold - widget cung cấp bố cục Material Design
    return Scaffold(
      //man hinh
      //AppBar - thanh ứng dụng trên cùng
      appBar: AppBar(
        //Tiêu đề của AppBar
        title: const Text('MyScaffold Demo'),
        backgroundColor: Colors.blue,
        // Độ nâng (đổ bóng) của AppBar
        elevation: 4,
        // Danh sách các nút hành động bên phải AppBar
        actions: [
          // Nút biểu tượng tìm kiếm
          IconButton(
            onPressed: () {
              print("search");
            },
            icon: const Icon(Icons.search),
          ),
          // Nút biểu tượng ...
          IconButton(
            onPressed: () {
              print("...");
            },
            icon: const Icon(Icons.more_vert),
          ), // Nút biểu tượng ...
          IconButton(
            onPressed: () {
              print("abc");
            },
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text cơ bản
            const Text("văn bản thông thường"),

            const SizedBox(height: 20),

            //text vs style
            Text(
              "văn bản có định dạng",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
                letterSpacing: 1.5, //mong , day
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Văn bản dài bới các tùy chọn khác nhau ',
              style: TextStyle(color: Colors.blue, fontSize: 20),
              textAlign: TextAlign.center, //căn lề
              maxLines: 4, // giới hạn dòng
              overflow: TextOverflow.ellipsis, //overflow
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Ok");
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------
class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //man hinh
      appBar: AppBar(
        //tieu de
        title: const Text('MyScaffold Demo'),
        //mau nen
        backgroundColor: Colors.pink,
        //
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("search");
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("...");
            },
            icon: const Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {
              print("abc");
            },
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 25, 255, 1),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Align(
            alignment: Alignment.center,
            child: const Text(
              "Text abcxyz",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("OK");
        },
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
        ],
      ),
    );
  }
}

class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //man hinh
      appBar: AppBar(
        //tieu de
        title: const Text('MyScaffold Demo'),
        //mau nen
        backgroundColor: Colors.pink,
        //
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("search");
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("...");
            },
            icon: const Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {
              print("abc");
            },
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(width: 50, height: 50, color: Colors.pinkAccent),
              //Container(width: 50, height: 50, color: Colors.yellow,),
              Container(width: 50, height: 50, color: Colors.redAccent),
            ],
          ),
          Column(
            children: [
              Container(width: 50, height: 50, color: Colors.pinkAccent),
              //Container(width: 50, height: 50, color: Colors.yellow,),
              Container(width: 50, height: 50, color: Colors.cyan),
              Container(width: 50, height: 50, color: Colors.green),

              //Container(width: 120, height: 50, color: Colors.blue,),
            ],
          ),
          Row(
            children: [
              // Container(width: 50, height: 50, color: Colors.pinkAccent,),
              Container(width: 50, height: 50, color: Colors.yellow),
              Container(width: 50, height: 50, color: Colors.redAccent),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Ok");
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
        ],
      ),
    );
  }
}
