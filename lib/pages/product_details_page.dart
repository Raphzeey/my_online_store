import 'package:flutter/material.dart';
import 'package:my_online_store/models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${product.nama}'),
            SizedBox(height: 16.0),
            Text('Deskripsi: ${product.deskripsi}'),
            const SizedBox(height: 16.0),
            Text('harga: Rp ${product.harga.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
