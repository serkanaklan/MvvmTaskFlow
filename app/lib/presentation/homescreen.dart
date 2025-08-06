import 'package:app/data/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Service1>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 YORUM LİSTESİ'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Consumer<Service1>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (value.data.isEmpty) {
            return Center(child: Text('Veri Yok'));
          }
          return ListView.builder(
            itemCount: value.data.length,
            itemBuilder: (context, index) {
              final item = value.data[index];
              return Card(
                margin: EdgeInsets.all(19.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    "${item.name} (${item.email})",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber,
                    ),
                  ),
                  subtitle: Text(item.body),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
