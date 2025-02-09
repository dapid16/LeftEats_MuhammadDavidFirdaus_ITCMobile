class Makanan {
  String nama;
  String toko;
  int jumlah;
  String desc;
  String imageUrl;
  int pesanan;
  int harga;
  Makanan({
    required this.nama,
    required this.toko,
    required this.jumlah,
    required this.desc,
    required this.imageUrl,
    this.pesanan = 0,
    required this.harga,
  });
}

List<Makanan> makananList = [
  Makanan(
      nama: "Premium Beef Burger",
      toko: "Berdua Coffee by SCBD",
      jumlah: 10,
      desc: "Promo Buy Premium Beef Burger selama stok tersedia",
      imageUrl:
          "https://images.unsplash.com/photo-1571091718767-18b5b1457add?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlZiUyMGJ1cmdlcnxlbnwwfHwwfHx8MA%3D%3D",
      harga: 90000),
  Makanan(
      nama: "Brownies Almond",
      toko: "Holland Bakery",
      jumlah: 5,
      desc:
          "Legitnya brownies panggang coklat yang renyah dibagian luar dan lembut dibagian dalam dengan kacang almond panggang premium dari Holland Bakery, sangat cocok menjadi sajian nikmat di sore hari.",
      imageUrl:
          "https://images.pexels.com/photos/887853/pexels-photo-887853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      harga: 86000),
  Makanan(
      nama: "Chiffon Chocolate Chips",
      toko: "Holland Bakery",
      jumlah: 7,
      desc:
          "Kesempurnaan kue Chiffon rasa coklat dengan teksturnya yang lembut berpadu dengan taburan dark chocolate chips yang berlimpah, diolah menggunakan bahan baku pilihan dan menjadi salah satu kue favorit pelanggan Holland Bakery.",
      imageUrl:
          "https://down-id.img.susercontent.com/file/8d2a8c4621ec85f7cf68a172ca91ab2b",
      harga: 86000),
  Makanan(
      nama: "Manggo Squash",
      toko: "Berdua Coffee by Seturan",
      jumlah: 15,
      desc: "Minuman menggunakan lemon yang menyegarkan.",
      imageUrl:
          "https://png.pngtree.com/thumb_back/fh260/background/20210730/pngtree-fresh-cool-and-sour-lemonade-image_754771.jpg",
      harga: 20000),
  Makanan(
      nama: "Caramel Latte",
      toko: "Kopi Janji Jiwa & Jiwa Toast",
      jumlah: 12,
      desc: "Mie ayam dengan pangsit dan bakso.",
      imageUrl:
          "https://t4.ftcdn.net/jpg/06/07/39/89/360_F_607398923_c2KlXJHKIDoftjK2Rhr5epcJndGposjI.jpg",
      harga: 24000),
];
