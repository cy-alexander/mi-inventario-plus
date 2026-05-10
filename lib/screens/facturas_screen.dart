import 'package:flutter/material.dart';

class FacturasScreen extends StatefulWidget {
  @override
  State<FacturasScreen> createState() => _FacturasScreenState();
}

class _FacturasScreenState extends State<FacturasScreen> {
  List<Map<String, dynamic>> facturas = [];

  final clienteController = TextEditingController();
  final montoController = TextEditingController();
  final fechaController = TextEditingController();

  void agregarFactura() {
    setState(() {
      facturas.add({
        "cliente": clienteController.text,
        "monto": montoController.text,
        "fecha": fechaController.text,
      });
    });

    clienteController.clear();
    montoController.clear();
    fechaController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Factura"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: clienteController,
                  decoration: InputDecoration(labelText: "Cliente"),
                ),

                TextField(
                  controller: montoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Monto"),
                ),

                TextField(
                  controller: fechaController,
                  decoration: InputDecoration(labelText: "Fecha"),
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

            ElevatedButton(onPressed: agregarFactura, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facturas")),

      body: facturas.isEmpty
          ? Center(child: Text("No hay facturas"))
          : ListView.builder(
              itemCount: facturas.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.receipt)),

                    title: Text(facturas[index]["cliente"]),

                    subtitle: Text(
                      "Monto: \$${facturas[index]["monto"]}\nFecha: ${facturas[index]["fecha"]}",
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
