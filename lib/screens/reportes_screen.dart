import 'package:flutter/material.dart';

class ReportesScreen extends StatefulWidget {
  @override
  State<ReportesScreen> createState() => _ReportesScreenState();
}

class _ReportesScreenState extends State<ReportesScreen> {
  List<Map<String, dynamic>> reportes = [];

  final tituloController = TextEditingController();
  final detalleController = TextEditingController();
  final fechaController = TextEditingController();

  void agregarReporte() {
    setState(() {
      reportes.add({
        "titulo": tituloController.text,
        "detalle": detalleController.text,
        "fecha": fechaController.text,
      });
    });

    tituloController.clear();
    detalleController.clear();
    fechaController.clear();

    Navigator.pop(context);
  }

  void mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Reporte"),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TextField(
                  controller: tituloController,
                  decoration: InputDecoration(labelText: "Título"),
                ),

                TextField(
                  controller: detalleController,
                  decoration: InputDecoration(labelText: "Detalle"),
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

            ElevatedButton(onPressed: agregarReporte, child: Text("Guardar")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reportes")),

      body: reportes.isEmpty
          ? Center(child: Text("No hay reportes"))
          : ListView.builder(
              itemCount: reportes.length,

              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),

                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.bar_chart)),

                    title: Text(reportes[index]["titulo"]),

                    subtitle: Text(
                      "Detalle: ${reportes[index]["detalle"]}\nFecha: ${reportes[index]["fecha"]}",
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
