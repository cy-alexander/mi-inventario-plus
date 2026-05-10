import 'package:flutter/material.dart';

class ClientesScreen extends StatefulWidget {
  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  List<Map<String, dynamic>> clientes = [];

  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();
  final correoController = TextEditingController();

  void agregarCliente() {
    setState(() {
      clientes.add({
        "nombre": nombreController.text,
        "telefono": telefonoController.text,
        "correo": correoController.text,
      });
    });

    nombreController.clear();
    telefonoController.clear();
    correoController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Cliente"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),

                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Teléfono"),
                ),

                TextField(
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Correo"),
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

            ElevatedButton(onPressed: agregarCliente, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clientes")),

      body: clientes.isEmpty
          ? Center(child: Text("No hay clientes"))
          : ListView.builder(
              itemCount: clientes.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),

                    title: Text(clientes[index]["nombre"]),

                    subtitle: Text(
                      "Tel: ${clientes[index]["telefono"]}\nCorreo: ${clientes[index]["correo"]}",
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
