import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';
import '../Widgets/cart_total.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Stack(
        children: [buildProfileImage(), customAppBar(), customAppBar2()],
      ),
      const SizedBox(
        height: 60,
      ),
      const Text("Tony Stark",
          style: TextStyle(
              fontSize: 27.0,
              color: Color.fromARGB(255, 47, 61, 68),
              letterSpacing: 2.0,
              fontWeight: FontWeight.w500)),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Kilcoole, Waterford",
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.black38,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300),
      ),
      CartTotal()
    ]));
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          backgroundImage: NetworkImage("/Image/perfil.jpg"),
          radius: 60.0,
        ),
      ],
    );
  }

  Widget customAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          title: Text(
            'Inicio',
            style: TextStyle(color: Colors.amber),
          ),
          leading: Icon(
            Icons.home,
            color: Colors.blue,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget customAppBar2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 1)),
            child: const Icon(
              Icons.shopping_cart,
              size: 35,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
