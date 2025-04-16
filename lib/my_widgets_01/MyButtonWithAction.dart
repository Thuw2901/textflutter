import "package:flutter/material.dart";

class MyButtonWithAction extends StatelessWidget {
  const MyButtonWithAction({super.key});

  @override
  Widget build(BuildContext context) {
    // Tra ve Scaffold - widget cung cap bo cuc Material Design co ban
    // Man hinh
    return Scaffold(
      // Tiêu đề của ứng dụng
      appBar: AppBar(
        title: Text("App 02"),
      ),
      backgroundColor: Colors.white,

      body: Center(child: Column(
        children: [
          SizedBox(height: 20,),

          ElevatedButton(onPressed: (){
            print("Button đã được nhấn");
          },
            onLongPress: (){
              print("Button đã được nhấn và giữ");
            },
            child: Text("Click!!",style: TextStyle(fontSize: 30,color: Colors.white,)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,

          ),
          ),

          
          SizedBox( height: 20,),
          FloatingActionButton(
            onPressed: null,

            child: const Icon(Icons.add),

          ),



        ],
      )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){print("pressed");},
        child: const Icon(Icons.add_ic_call),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
      ]),
    );
  }
}
