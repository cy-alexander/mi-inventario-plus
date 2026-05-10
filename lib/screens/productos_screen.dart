import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  List<Map<String, dynamic>> productos = [];

  final nombreController = TextEditingController();
  final precioController = TextEditingController();
  final stockController = TextEditingController();

  void agregarProducto() {
    setState(() {
      productos.add({
        "nombre": nombreController.text,
        "precio": precioController.text,
        "stock": stockController.text,
      });
    });

    nombreController.clear();
    precioController.clear();
    stockController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Producto"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),

                TextField(
                  controller: precioController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Precio"),
                ),

                TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Stock"),
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

            ElevatedButton(onPressed: agregarProducto, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos")),

      body: productos.isEmpty
          ? Center(child: Text("No hay productos"))
          : ListView.builder(
              itemCount: productos.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    title: Text(productos[index]["nombre"]),

                    subtitle: Text(
                      "Precio: \$${productos[index]["precio"]} | Stock: ${productos[index]["stock"]}",
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        // EDITAR
                        IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.blue,

                          onPressed: () {
                            nombreController.text = productos[index]["nombre"];
                            precioController.text = productos[index]["precio"];
                            stockController.text = productos[index]["stock"];

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Editar Producto"),

                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,

                                      children: [
                                        TextField(
                                          controller: nombreController,
                                          decoration: InputDecoration(
                                            labelText: "Nombre",
                                          ),
                                        ),

                                        TextField(
                                          controller: precioController,
                                          decoration: InputDecoration(
                                            labelText: "Precio",
                                          ),
                                        ),

                                        TextField(
                                          controller: stockController,
                                          decoration: InputDecoration(
                                            labelText: "Stock",
                                          ),
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

                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          productos[index] = {
                                            "nombre": nombreController.text,
                                            "precio": precioController.text,
                                            "stock": stockController.text,
                                          };
                                        });

                                        Navigator.pop(context);
                                      },

                                      child: Text("Guardar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),

                        // ELIMINAR
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,

                          onPressed: () {
                            setState(() {
                              productos.removeAt(index);
                            });
                          },
                        ),
                      ],
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
