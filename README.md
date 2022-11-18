# Muhammad Falensi Azmi - 2106630334 - Kelas D
# Tugas 7 PBP

1. 
- Stateless widget adalah widget yang state nya tidak bisa diubah setelah dibuilt. Dengan kata lain, setiap perubahan informasi (variabel, icon, button, data) tidak akan mengubah statenya. Oleh karena itu, stateless widget adalah widget yang bersifat statis. Contoh dari stateless widget adalah Text, RaisedButton, dan IconButtons.
- Berbeda dengan stateless widget, stateful widget adalah widget yang memiliki state yang bisa diubah. State ini dapat berubah setelah widget dibuilt. Stateful widget bersifat dinamis dan bisa berubah berkali-kali selama program dijalankan. Stateful widget dapat membuat tampilan sesuai dengan variabel, input, atau data yang ingin ditampilkan user secara dinamis(bisa berubah-ubah). Contoh dari stateful widget adalah CheckBox, RadioButton, dan TextField.

2. 
- MaterialApp: Menyediakan tools dan theme untuk digunakan di aplikasi.
- Scaffold: Menampilkan basic material design dari visual layout structure.
- AppBar: Menampilkan tampilan semacam header pada bagian atas aplikasi
- Center: Widget yang menampilkan child-child nya pada posisi tengah halaman.
- Column: Widget yang menampilkan child-child nya dalam bentuk vertikal (seperti kolom)
- Text: Menampilkan tulisan/teks
- Theme: Memberikan tema (warna, font) pada bagian tertentu di aplikasi
- Padding: Widget untuk menampilkan child-child nya dengan padding (jarak content dengan batas container).
- Row: Widget yang menampilkan child-child nya dalam bentuk horizontal (seperti baris)
- Align: Widget yang melakukan allignment (rata kiri/kanan/dll) pada child-child nya
- Visibility: Berfungsi untuk memunculkan/menghilangkan childnya.
- FloatingActionButton: Tombol yang melayang, berfungsi untuk menjalankan suatu fungsi (increment/decrement pada tugas ini).
- Icon: Menampilkan icon

3. Pemanggilan fungsi setState() berfungsi untuk memberitahu framework bahwa internal state dari objek tertentu sudah berubah sehingga ada kemungkinan tampilan user juga berubah. Selanjutnya, widget yang memanggil setState() akan dibuild ulang sehingga tampilan yang dilihat user akan terupdate sesuai dengan data terkini. Varibel yang terdampak adalah variabel-variabel yang ada di widget yang memanggil fungsi setState().

4. 
final: variabel final akan diinisiasi saat runtime dan hanya bisa di assign sekali saja. Final variable bisa didefinisikan dalam class dan fungsi.

const: variabel const akan diinisasi saat compile-time dan sudah ter-assign saat program berjalan (runtime). Const tidak dapat didefinisikan daam class, tapi bisa didefinisikan di dalam fungsi. Const tidak bisa diubah saat runtime.

5. 
- Membuat programm Flutter baru dengan perintah flutter create counter_7. Selanjutnya, program yang saya buat hanya memodifikasi bagian-bagian yang sudah ada dari Flutter Demo (defaultnya).

- Mengubah title homepage menjadi seperti pada soal (Program Counter)

- Mendefinisikan variabel-variabel yang dibutuhkan pada program (_counter, _fontColor, dll)

- Mendefinisikan fungsi _incrementCounter untuk melakukan increment counter dan melakukan modifikasi pada teks dan font color sesuai soal (terkait genap ganjil dan warnanya).

- Mendefinisikan fungsi _decrementCounter untuk melakukan decrement counter dan melakukan modifikasi pada teks, font color, dan visibility button sesuai soal (terkait genap ganjil dan warnanya). _decrementCounter akan menghilangkan tampilan button (-) jika counter=0 (bonus).

- Membuat dua buah floatingActionButton untuk tampilan tombol (-) dan (+) yang di align sesuai ketentuan soal. Tombol (-) akan memanggil fungsi _decrementCounter, sedangkan tombol (+) akan memanggil fungsi _incrementCounter.

# Tugas 8 PBP
1. Pada Navigator.push, halaman baru yang ingin ditampilkan akan di push ke stack. Karena sifat dari struktur data stack adalah LIFO, ketika kita melakukan Navigator.pop(), pengguna akan kembali ke halaman sebelumnya yang ditampilkan. Pada Navigator.pushReplacement, halaman baru yang ingin ditampilkan akan me-replace halaman sebelumnya pada stack sehingga pengguna tidak dapat kembali ke halaman sebelumnya.

2. 
- Scaffold: Struktur layout halaman aplikasi
- Center: Menampilkan child widgetnya di tengah
- DropdownButton: Menampilkan dropdown button
- ListView: Widget scrollable untuk menampilkan children-children nya
- ListTile: Sebuah baris yang mengandung teks, icon, dll.
- Form: Menampilkan input atau form field
- Drawer: Panel yang muncul dari pinggir untuk melakukan navigasi
- Column: Menampilkan children nya dalam bentuk kolom.
- Card: Widget card untuk menampilkan informasi dalam bentuk semacam kartu
- Form: Untuk melakukan grouping pada beberapa form field widgets.
- TextFormField: melakukan input (form) dalam bentuk teks
- OutlinedButton: sebuah button dengan outline border
- TextButton: untuk melakukan suatu aksi/perintah

3. onEnter, onExit, onHover, onSaved, onChanged, dan lain-lain.

4. Navigator bekerja dengan memanfaatkan prinsip struktur data stack dimana halaman yang ingin ditampilkan kepada pengguna berada pada top of stack. Jika pengguna ingin mengganti ke halaman baru, maka halaman tersebut akan di push ke stack. Jika pengguna ingin kembali ke halaman sebelumnya, maka stack akan di pop.

5. 
- Menambahkan drawer pada file terpisah (drawer.dart) yang terdiri dari 3 listile untuk navigasi.
- Membuat halaman form yang menerima input sesuai soal dan tombol submitnya. Membuat class mycard sebagai representasi card yang akan diisi di form. Dilakukan di file form.dart
- Membuat halaman data budget dan menampilkan semua data yang ada di card ke pengguna. Dilakukan di file data.dart
