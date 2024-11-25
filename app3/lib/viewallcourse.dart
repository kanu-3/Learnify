import 'package:flutter/material.dart';


class Viewallcourse extends StatefulWidget {
  const Viewallcourse({super.key});

  @override
  State<Viewallcourse> createState() => _ViewallcourseState();
}

class _ViewallcourseState extends State<Viewallcourse> {
  List<Map<String, dynamic>> courses = [
    {
      'id': 1,
      'title': 'Web development',
      'image': 'assets/images/Frame 33819.png',
      'price': 100
    },
    {
      'id': 2,
      'title': 'UI/UX Designing',
      'image': 'assets/images/Frame 33818.png',
      'price': 200
    },
    {
      'id': 3,
      'title': 'Game Development',
      'image': 'assets/images/Frame 33823.png',
      'price': 300
    },
    {
      'id': 4,
      'title': 'CGraphic Design',
      'image': 'assets/images/Frame 33822.png',
      'price': 400
    }
  ];

  List<Map<String, dynamic>> cart = [];

  void addCart(Map<String, dynamic> course) {
    setState(() {
      cart.add(course);
    });
  }

  void deleteCart(Map<String, dynamic> course) {
    setState(() {
      cart.remove(course);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Shop here!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160, top: 10, bottom: 20, right: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Shoppingcart(cart: cart)));
                      },
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.search),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for courses...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...courses.sublist(0, 2).map((course) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 220,
                      width: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(course['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => addCart(course),
                                icon: Icon(Icons.add),
                              ),
                              SizedBox(width: 70),
                              IconButton(
                                  onPressed: () => deleteCart(course),
                                  icon: Icon(Icons.remove))
                            ],
                          ),
                          Container(height: 150),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...courses.sublist(2, 4).map((course) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 220,
                      width: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(course['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => addCart(course),
                                icon: Icon(Icons.add),
                              ),
                              SizedBox(width: 70),
                              IconButton(
                                  onPressed: () => deleteCart(course),
                                  icon: Icon(Icons.remove))
                            ],
                          ),
                          Container(height: 150),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Shoppingcart extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  Shoppingcart({required this.cart});

  @override
  Widget build(BuildContext context) {
    int totalPrice = cart.fold(0, (sum, item) => sum + (item['price'] as int));

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final course = cart[index];
                      return ListTile(
                        title: Text(course['title']),
                        subtitle: Text("Rs.${course['price']}"),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Total: Rs.${totalPrice}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout(cart: cart)));
              },
              child: Text("Proceed to Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}
class Checkout extends StatelessWidget {
   final List<Map<String, dynamic>> cart;

  Checkout({required this.cart});

  @override
  Widget build(BuildContext context) {
    int totalprice = cart.fold(0, (sum, item) => sum + (item['price'] as int));
    

    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Cart",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final course = cart[index];
                      return ListTile(
                        title: Text(course['title']),
                        subtitle: Text("Rs.${course['price']}"),
                      );
                    },
                  ),
          ),
          SizedBox(height: 20),
            Text(
              "Total: Rs.$totalprice",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text("Proceed to Payment"),
            ),
            ],
        ),
      ),
    );
  }
}




