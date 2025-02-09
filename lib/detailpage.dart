import 'package:flutter/material.dart';
import 'model.dart';

class DetailPage extends StatefulWidget {
  final Makanan makanan;
  final List<Makanan> cart;

  const DetailPage({super.key, required this.makanan, required this.cart});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _jumlahBeli =
      1; // Default jumlah produk yang akan ditambahkan ke keranjang

  void addToCart() {
    if (_jumlahBeli > widget.makanan.jumlah) return;

    for (int i = 0; i < _jumlahBeli; i++) {
      widget.cart.add(widget.makanan);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$_jumlahBeli produk ditambahkan ke keranjang!"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int hargaDiskon = widget.makanan.harga ~/ 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.makanan.imageUrl,
                  height: 200,
                  width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Diskon 50%",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Tersedia: ${widget.makanan.jumlah}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.makanan.nama,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Rp ${widget.makanan.harga.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Rp ${hargaDiskon.toStringAsFixed(0)}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.store, color: Colors.blue),
                  const SizedBox(width: 5),
                  Text(
                    widget.makanan.toko,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.makanan.desc,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _jumlahBeli > 1
                        ? () {
                            setState(() {
                              _jumlahBeli--;
                            });
                          }
                        : null, // Disabled jika jumlah 1
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    _jumlahBeli.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: _jumlahBeli < widget.makanan.jumlah
                        ? () {
                            setState(() {
                              _jumlahBeli++;
                            });
                          }
                        : null, // Disabled jika jumlah mencapai stok
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // **Tombol Tambah ke Keranjang**
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: addToCart,
                  child: const Text("Tambah ke Keranjang",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
