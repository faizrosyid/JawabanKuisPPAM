import 'package:flutter/material.dart';
import "package:kuis/data_buku.dart";
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku buku;
  const HalamanDetail({super.key, required this.buku});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false; // Menambahkan status favorit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(widget.buku.title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              toggleFavorite();
            },
            icon: Icon(
              isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: isFavorite ? Colors.white : Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/2,
                child: Image.network(widget.buku.imageLink),
              ),
              SizedBox(height: 10,),
              Container(
                child:Row(
                  children: [
                    Text("Judul Buku : ", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.buku.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Container(
                child:Row(
                  children: [
                    Text("Pengarang : ", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.buku.author, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Container(
                child:Row(
                  children: [
                    Text("Tahun Terbit : ", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.buku.year.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Container(
                child:Row(
                  children: [
                    Text("Negara : ", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.buku.country, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Container(
                child:Row(
                  children: [
                    Text("Bahasa : ", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.buku.language, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Container(
                child:Row(
                  children: [
                    Text("Jumlah Halaman : ", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(widget.buku.pages.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _launchUrl(widget.buku.link);
        },
        child: Icon(Icons.search),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      final snackBar = SnackBar(
        backgroundColor: isFavorite ? Colors.green : Colors.red,
        content: Text(
          isFavorite
              ? 'Berhasil Menambahkan Bookmark'
              : 'Berhasil Menghapus Bookmark',
          style: TextStyle(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
