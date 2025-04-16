import "package:flutter/material.dart";


class Mybuttons extends StatelessWidget {
  const Mybuttons({super.key});

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
        SizedBox( height: 50,),
        ElevatedButton(
          onPressed: (){
          }, child: Text('Click Me!',style: TextStyle(fontSize: 30,color: Colors.white,)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
        ),


        SizedBox( height: 20,),
        TextButton(onPressed: (){},

          child: Text('Button 2',style: TextStyle(fontSize: 20,color: Colors.yellowAccent,)),
          style: ElevatedButton.styleFrom(

          ),
        ),
        SizedBox( height: 20,),
        OutlinedButton(onPressed: (){},

          child: Text('Button 3',style: TextStyle(fontSize: 20,color: Colors.greenAccent,)),
          style: ElevatedButton.styleFrom(

          ),
        ),

        SizedBox( height: 20,),
        TextButton(onPressed: (){},

          child: const Icon(Icons.favorite),

        ),

        SizedBox( height: 20,),
        FloatingActionButton(
            onPressed: (){},

          child: const Icon(Icons.add),

        ),

        SizedBox( height: 50,),
        ElevatedButton(
          onPressed: (){
          }, child: Text('Click Me!',style: TextStyle(fontSize: 30,)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
              elevation: 15,
          ),
        ),

        SizedBox( height: 50,),
        ElevatedButton.icon(
            onPressed:(){},
            icon: Icon(Icons.favorite),
            label: Text("Yêu Thích")
        ),

        SizedBox( height: 20,),
        InkWell(
            onTap: (){
              print("Inkwell được nhấn");

            },
            splashColor: Colors.blue.withOpacity(0.5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan),
              ),
              child: Text("button tủy chỉnh vs Inkwell"),
            )
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
