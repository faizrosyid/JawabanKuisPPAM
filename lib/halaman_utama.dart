import 'package:flutter/material.dart';
import 'package:kuis/halaman_detail.dart';
import 'package:kuis/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Data Buku", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: listBuku.length,
          itemBuilder: (context, index){
            final DataBuku buku = listBuku[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanDetail(buku: buku))
                );
              },
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Image.network(
                          buku.imageLink,
                          height: 200,
                      ),
                      Text(buku.title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            );
          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        )
    );
  }
}
