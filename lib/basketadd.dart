import 'package:flutter/material.dart';
import 'model.dart';

class CartPage extends StatefulWidget {
  final List<Makanan> cart;

  const CartPage({super.key, required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(int index) {
    setState(() {
      widget.cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
        backgroundColor: Colors.lightGreen,
      ),
      body: widget.cart.isEmpty
          ? Center(
              child: Text("Keranjang masih kosong!"),
            )
          : ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final makanan = widget.cart[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.network(
                      makanan.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(makanan.nama),
                    subtitle: Text("Dari: ${makanan.toko}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: widget.cart.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Pesanan berhasil dibuat!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  setState(() {
                    widget.cart.clear();
                  });
                },
                child: Text("Checkout", style: TextStyle(fontSize: 18)),
              ),
            )
          : null,
    );
  }
}
