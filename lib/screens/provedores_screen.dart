import 'package:flutter/material.dart';

class ProvedoresScreen extends StatefulWidget {
  @override
  State<ProvedoresScreen> createState() => _ProvedoresScreenState();
}

class _ProvedoresScreenState extends State<ProvedoresScreen> {
  List<Map<String, dynamic>> provedores = [];

  final nombreController = TextEditingController();
  final empresaController = TextEditingController();
  final telefonoController = TextEditingController();

  void agregarProvedor() {
    setState(() {
      provedores.add({
        "nombre": nombreController.text,
        "empresa": empresaController.text,
        "telefono": telefonoController.text,
      });
    });

    nombreController.clear();
    empresaController.clear();
    telefonoController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Provedor"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),

                TextField(
                  controller: empresaController,
                  decoration: InputDecoration(labelText: "Empresa"),
                ),

                TextField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Teléfono"),
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

            ElevatedButton(onPressed: agregarProvedor, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provedores")),

      body: provedores.isEmpty
          ? Center(child: Text("No hay provedores"))
          : ListView.builder(
              itemCount: provedores.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.business)),

                    title: Text(provedores[index]["nombre"]),

                    subtitle: Text(
                      "Empresa: ${provedores[index]["empresa"]}\nTel: ${provedores[index]["telefono"]}",
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
