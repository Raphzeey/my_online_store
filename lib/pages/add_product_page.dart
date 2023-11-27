import 'package:flutter/material.dart';
import 'package:my_online_store/models/product.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Produk nama'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _hargaController,
              decoration: InputDecoration(labelText: 'Produk Harga (Rp)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                String nama = _namaController.text.trim();
                final String deskripsi = _deskripsiController.text.trim();
                double harga =
                    double.tryParse(_hargaController.text.trim()) ?? 0.0;

                if (nama.isNotEmpty && harga > 0) {
                  Product newProduct =
                      Product(nama: nama, deskripsi: deskripsi, harga: harga);
                  Navigator.pop(context, newProduct);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
