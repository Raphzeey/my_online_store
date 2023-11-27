import 'package:flutter/material.dart';
import 'package:my_online_store/models/product.dart';

class EditProductPage extends StatefulWidget {
  final Product product;

  EditProductPage({required this.product});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _namaController;
  late TextEditingController _deskripsiController;
  late TextEditingController _hargaController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.product.nama);
    _deskripsiController =
        TextEditingController(text: widget.product.deskripsi);
    _hargaController =
        TextEditingController(text: widget.product.harga.toString());
  }

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Produk')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Produk Nama'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            TextFormField(
              controller: _hargaController,
              decoration: InputDecoration(labelText: 'Produk Harga (Rp)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                String nama = _namaController.text.trim();
                String deskripsi = _deskripsiController.text.trim();
                double harga =
                    double.tryParse(_hargaController.text.trim()) ?? 0.0;

                if (nama.isNotEmpty && harga > 0) {
                  Product updatedProduct =
                      Product(nama: nama, deskripsi: deskripsi, harga: harga);
                  Navigator.pop(context, updatedProduct);
                } else {
                  final Product updatedProduct = Product(
                    nama: nama,
                    deskripsi: deskripsi,
                    harga: harga,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
