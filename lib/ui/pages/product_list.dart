import 'package:f_shopping_app_r2_template/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            // TODO
            // aquí debemos rodear el widget Expanded en un Obx para
            // observar los cambios en la lista de entries del shoppingController
            Expanded(
              child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: shoppingController.entries.length,
                  itemBuilder: (context, index) {
                    return _row(shoppingController.entries[index], index);
                  })),
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.lightBlueAccent,
              size: 35,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      color: Color.fromARGB(255, 3, 114, 158),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          product.name,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        Text(product.price.toString(),
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            )),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  // TODO
                  // aquí debemos llamar al método del controlador que
                  // incrementa el número de unidades del producto
                  // pasandole el product.id
                  shoppingController.agregarProducto(product.id);
                },
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Color.fromARGB(255, 18, 160, 22),
                )),
            IconButton(
                onPressed: () {
                  // TODO
                  // aquí debemos llamar al método del controlador que
                  // disminuye el número de unidades del producto
                  // pasandole el product.id
                  shoppingController.quitarProducto(product.id);
                },
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Color.fromARGB(255, 202, 36, 24),
                ))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
