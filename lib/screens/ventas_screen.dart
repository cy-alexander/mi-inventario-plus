import 'package:flutter/material.dart';

class VentasScreen extends StatefulWidget {
  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  List<Map<String, dynamic>> ventas = [];

  final productoController = TextEditingController();
  final clienteController = TextEditingController();
  final totalController = TextEditingController();

  void agregarVenta() {
    setState(() {
      ventas.add({
        "producto": productoController.text,
        "cliente": clienteController.text,
        "total": totalController.text,
      });
    });

    productoController.clear();
    clienteController.clear();
    totalController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Venta"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: productoController,
                  decoration: InputDecoration(labelText: "Producto"),
                ),

                TextField(
                  controller: clienteController,
                  decoration: InputDecoration(labelText: "Cliente"),
                ),

                TextField(
                  controller: totalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Total"),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),

            ElevatedButton(onPressed: agregarVenta, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ventas")),

      body: ventas.isEmpty
          ? Center(child: Text("No hay ventas"))
          : ListView.builder(
              itemCount: ventas.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.shopping_cart)),

                    title: Text(ventas[index]["producto"]),

                    subtitle: Text(
                      "Cliente: ${ventas[index]["cliente"]}\nTotal: \$${ventas[index]["total"]}",
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: mostrarFormulario,
        child: Icon(Icons.add),
      ),
    );
  }
}
