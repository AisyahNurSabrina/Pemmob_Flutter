import 'package:flutter/material.dart';
import 'sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? namauser;

  Future<void> _loadUsername() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();

    setState(() {
      namauser = prefs.getString('username');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text('Ini adalah halaman User ${namauser ?? ""}'),
      ),
      drawer: const Sidemenu(),
    );
  }
}