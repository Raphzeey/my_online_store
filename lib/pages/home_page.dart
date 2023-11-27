import 'package:flutter/material.dart';
import 'package:my_online_store/models/product.dart';
import 'package:my_online_store/pages/product_details_page.dart';
import 'package:my_online_store/pages/edit_product_page.dart';
import 'package:my_online_store/pages/add_product_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [
    Product(nama: 'Produk 1', deskripsi: 'deskripsi 1', harga: 10000),
    Product(nama: 'Produk 2', deskripsi: 'deskripsi 2', harga: 20000),
    Product(nama: 'Produk 3', deskripsi: 'deskripsi 3', harga: 30000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PENYIMPANAN GUDANG')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].nama),
            subtitle:
                Text('Harga: Rp ${products[index].harga.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editProduct(context, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteProduct(index);
                  },
                ),
              ],
            ),
            onTap: () {
              _viewProductDetails(context, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addProduct(context);
        },
      ),
    );
  }

  void _addProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage()),
    ).then((newProduct) {
      if (newProduct != null) {
        setState(() {
          products.add(newProduct);
        });
      }
    });
  }

  void _editProduct(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProductPage(product: products[index])),
    ).then((updatedProduct) {
      if (updatedProduct != null) {
        setState(() {
          products[index] = updatedProduct;
        });
      }
    });
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Produk'),
          content: Text('Anda Yakin Akan Hapus Daftar Produk Ini!!!'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _viewProductDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsPage(product: products[index])),
    );
  }
}
