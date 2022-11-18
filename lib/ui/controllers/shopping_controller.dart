import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    // TODO
    // calcular el valor total de los elementos en el carro de compras
    newTotal = (entries[0].quantity * entries[0].price) +
        (entries[1].quantity * entries[1].price);
    total.value = newTotal;
    total.refresh();
  }

  int get totalgeneral => total.value;

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // TODO
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado
    if (id == 0 || id == 1) {
      entries[id].quantity += 1;
      entries.refresh();
    }
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero
    if (id == 0 || id == 1) {
      if (entries[id].quantity <= 0) {
        entries[id].quantity = 0;
        entries.refresh();
      } else {
        entries[id].quantity -= 1;
        entries.refresh();
      }
    }
    calcularTotal();
  }
}
