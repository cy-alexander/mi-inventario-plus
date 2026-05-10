import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

import 'screens/productos_screen.dart';
import 'screens/clientes_screen.dart';
import 'screens/provedores_screen.dart';
import 'screens/facturas_screen.dart';
import 'screens/ventas_screen.dart';
import 'screens/stock_screen.dart';
import 'screens/ganancias_screen.dart';
import 'screens/reportes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // LOGIN PRIMERO
      home: LoginScreen(),

      routes: {
        "/dashboard": (context) => DashboardScreen(),

        "/register": (context) => RegisterScreen(),
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Clientes", "value": "16"},
    {"title": "Provedores", "value": "10"},
    {"title": "Productos", "value": "185"},
    {"title": "Facturas", "value": "1"},
    {"title": "Stock", "value": "115"},
    {"title": "Ventas", "value": "33"},
    {"title": "Ganancia", "value": "\$89"},
    {"title": "Reportes", "value": "5"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inventario")),

      // ================= MENU LATERAL =================
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),

              child: Center(
                child: Text(
                  "Menú",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),

            // PRODUCTOS
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Productos"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductosScreen()),
                );
              },
            ),

            // CLIENTES
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Clientes"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ClientesScreen()),
                );
              },
            ),

            // PROVEDORES
            ListTile(
              leading: Icon(Icons.business),
              title: Text("Provedores"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProvedoresScreen()),
                );
              },
            ),

            // FACTURAS
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text("Facturas"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FacturasScreen()),
                );
              },
            ),

            // VENTAS
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Ventas"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VentasScreen()),
                );
              },
            ),

            // STOCK
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text("Stock"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StockScreen()),
                );
              },
            ),

            // GANANCIAS
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Ganancia"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GananciasScreen()),
                );
              },
            ),

            // REPORTES
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Reportes"),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReportesScreen()),
                );
              },
            ),
          ],
        ),
      ),

      // ================= DASHBOARD =================
      body: GridView.builder(
        padding: EdgeInsets.all(10),

        itemCount: items.length,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              String titulo = items[index]["title"]!;

              // PRODUCTOS
              if (titulo == "Productos") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductosScreen()),
                );
              }
              // CLIENTES
              else if (titulo == "Clientes") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ClientesScreen()),
                );
              }
              // PROVEDORES
              else if (titulo == "Provedores") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProvedoresScreen()),
                );
              }
              // FACTURAS
              else if (titulo == "Facturas") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FacturasScreen()),
                );
              }
              // VENTAS
              else if (titulo == "Ventas") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VentasScreen()),
                );
              }
              // STOCK
              else if (titulo == "Stock") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StockScreen()),
                );
              }
              // GANANCIAS
              else if (titulo == "Ganancia") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GananciasScreen()),
                );
              }
              // REPORTES
              else if (titulo == "Reportes") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReportesScreen()),
                );
              }
            },

            child: Card(
              elevation: 4,

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.inventory, size: 40),

                    SizedBox(height: 10),

                    Text(
                      items[index]["title"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      items[index]["value"]!,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
