import 'package:flutter/material.dart';

class StockScreen extends StatefulWidget {
  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  List<Map<String, dynamic>> stock = [];

  final productoController = TextEditingController();
  final cantidadController = TextEditingController();
  final estadoController = TextEditingController();

  void agregarStock() {
    setState(() {
      stock.add({
        "producto": productoController.text,
        "cantidad": cantidadController.text,
        "estado": estadoController.text,
      });
    });

    productoController.clear();
    cantidadController.clear();
    estadoController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Stock"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: productoController,
                  decoration: InputDecoration(labelText: "Producto"),
                ),

                TextField(
                  controller: cantidadController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Cantidad"),
                ),

                TextField(
                  controller: estadoController,
                  decoration: InputDecoration(labelText: "Estado"),
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

            ElevatedButton(onPressed: agregarStock, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stock")),

      body: stock.isEmpty
          ? Center(child: Text("No hay stock"))
          : ListView.builder(
              itemCount: stock.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.inventory)),

                    title: Text(stock[index]["producto"]),

                    subtitle: Text(
                      "Cantidad: ${stock[index]["cantidad"]}\nEstado: ${stock[index]["estado"]}",
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
