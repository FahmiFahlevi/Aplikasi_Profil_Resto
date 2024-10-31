class MenuMakanan {
  final String nama;
  final String harga;

  MenuMakanan({
    required this.nama,
    required this.harga,
  });

  static List<MenuMakanan> listMenu = [
    MenuMakanan(
      nama: "Nasi Goreng Spesial",
      harga: "Rp 25,000",
    ),
    MenuMakanan(
      nama: "Sate Ayam",
      harga: "Rp 30,000",
    ),
    MenuMakanan(
      nama: "Rendang Daging",
      harga: "Rp 45,000",
    ),
    MenuMakanan(
      nama: "Ayam Goreng Kremes",
      harga: "Rp 35,000",
    ),
    MenuMakanan(
      nama: "Gado-Gado",
      harga: "Rp 20,000",
    ),
    MenuMakanan(
      nama: "Mie Goreng Jawa",
      harga: "Rp 22,000",
    ),
    MenuMakanan(
      nama: "Ikan Bakar",
      harga: "Rp 50,000",
    ),
  ];
}
