import 'package:flutter/material.dart';

class GananciasScreen extends StatefulWidget {
  @override
  State<GananciasScreen> createState() => _GananciasScreenState();
}

class _GananciasScreenState extends State<GananciasScreen> {
  List<Map<String, dynamic>> ganancias = [];

  final descripcionController = TextEditingController();
  final montoController = TextEditingController();
  final fechaController = TextEditingController();

  void agregarGanancia() {
    setState(() {
      ganancias.add({
        "descripcion": descripcionController.text,
        "monto": montoController.text,
        "fecha": fechaController.text,
      });
    });

    descripcionController.clear();
    montoController.clear();
    fechaController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Ganancia"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: descripcionController,
                  decoration: InputDecoration(labelText: "Descripción"),
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

            ElevatedButton(onPressed: agregarGanancia, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ganancias")),

      body: ganancias.isEmpty
          ? Center(child: Text("No hay ganancias"))
          : ListView.builder(
              itemCount: ganancias.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.attach_money)),

                    title: Text(ganancias[index]["descripcion"]),

                    subtitle: Text(
                      "Monto: \$${ganancias[index]["monto"]}\nFecha: ${ganancias[index]["fecha"]}",
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
