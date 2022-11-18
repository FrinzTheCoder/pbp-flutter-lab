import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/drawer.dart';

List<Widget> budgetList = [];

class MyCard extends StatelessWidget {
  String judul;
  int nominal;
  String jenis;
  DateTime tanggal;
  MyCard(
      {Key? key,
      required this.judul,
      required this.nominal,
      required this.jenis,
      required this.tanggal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Text(
                  "${tanggal.year.toString()}-${tanggal.month.toString()}-${tanggal.day.toString()}"),
              title: Text(judul),
              subtitle: Text(nominal.toString()),
              trailing: Text(jenis),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nominal = 0;
  String? jenis;
  DateTime tanggal = DateTime.now();
  List<String> jenis_pilihan = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Budget'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      int? number = int.tryParse(value!);
                      setState(() {
                        if (number == null) {
                          nominal = 0;
                        } else {
                          nominal = number;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      int? number = int.tryParse(value!);
                      setState(() {
                        if (number == null) {
                          nominal = 0;
                        } else {
                          nominal = number;
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButton(
                    value: jenis,
                    hint: const Text("Pilih Jenis"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: jenis_pilihan.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                        ).then((value) {
                          setState(() {
                            tanggal = value!;
                          });
                        });
                      },
                      child: Text("Pilih Tanggal")),
                  const SizedBox(height: 10),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        budgetList.add(MyCard(
                            judul: judul,
                            nominal: nominal,
                            jenis: jenis!,
                            tanggal: tanggal));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(
                                      child:
                                          Text('Data Berhasil Ditambahkan!')),
                                  const SizedBox(height: 50),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: DrawerWidget());
  }
}
