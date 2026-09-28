// 1. Abstract class TaiLieu
abstract class TaiLieu {
  String maSo;
  String tenNhaXuatBan;
  int soLuongPhatHanh;

  TaiLieu({
    required this.maSo,
    required this.tenNhaXuatBan,
    required this.soLuongPhatHanh,
  });

  // Phương thức trừu tượng
  void hienThiThongTin();
}

// 2. Class Sach kế thừa TaiLieu
class Sach extends TaiLieu {
  String tenTacGia;
  int soTrang;

  Sach({
    required String maSo,
    required String tenNhaXuatBan,
    required int soLuongPhatHanh,
    required this.tenTacGia,
    required this.soTrang,
  }) : super(
          maSo: maSo,
          tenNhaXuatBan: tenNhaXuatBan,
          soLuongPhatHanh: soLuongPhatHanh,
        );

  @override
  void hienThiThongTin() {
    print('--- THÔNG TIN SÁCH ---');
    print('Mã số: $maSo');
    print('Nhà xuất bản: $tenNhaXuatBan');
    print('Số lượng phát hành: $soLuongPhatHanh');
    print('Tác giả: $tenTacGia');
    print('Số trang: $soTrang');
  }
}

// 2. Class TapChi kế thừa TaiLieu
class TapChi extends TaiLieu {
  int soPhatHanh;
  int thangPhatHanh;

  TapChi({
    required String maSo,
    required String tenNhaXuatBan,
    required int soLuongPhatHanh,
    required this.soPhatHanh,
    required this.thangPhatHanh,
  }) : super(
          maSo: maSo,
          tenNhaXuatBan: tenNhaXuatBan,
          soLuongPhatHanh: soLuongPhatHanh,
        );

  @override
  void hienThiThongTin() {
    print('--- THÔNG TIN TẠP CHÍ ---');
    print('Mã số: $maSo');
    print('Nhà xuất bản: $tenNhaXuatBan');
    print('Số lượng phát hành: $soLuongPhatHanh');
    print('Số phát hành: $soPhatHanh');
    print('Tháng phát hành: $thangPhatHanh');
  }
}

// 2. Class Bao kế thừa TaiLieu
class Bao extends TaiLieu {
  DateTime ngayPhatHanh;

  Bao({
    required String maSo,
    required String tenNhaXuatBan,
    required int soLuongPhatHanh,
    required this.ngayPhatHanh,
  }) : super(
          maSo: maSo,
          tenNhaXuatBan: tenNhaXuatBan,
          soLuongPhatHanh: soLuongPhatHanh,
        );

  @override
  void hienThiThongTin() {
    print('--- THÔNG TIN BÁO ---');
    print('Mã số: $maSo');
    print('Nhà xuất bản: $tenNhaXuatBan');
    print('Số lượng phát hành: $soLuongPhatHanh');
    print(
      'Ngày phát hành: ${ngayPhatHanh.day}/${ngayPhatHanh.month}/${ngayPhatHanh.year}',
    );
  }
}

// 4. Hàm main
void main() {
  // Tạo List<TaiLieu>
  List<TaiLieu> danhSachTaiLieu = [
    Sach(
      maSo: 'S01',
      tenNhaXuatBan: 'Kim Đồng',
      soLuongPhatHanh: 1000,
      tenTacGia: 'Nguyễn Nhật Ánh',
      soTrang: 200,
    ),
    TapChi(
      maSo: 'TC01',
      tenNhaXuatBan: 'Tuổi Trẻ Cuối Tuần',
      soLuongPhatHanh: 500,
      soPhatHanh: 12,
      thangPhatHanh: 9,
    ),
    Bao(
      maSo: 'B01',
      tenNhaXuatBan: 'Thanh Niên',
      soLuongPhatHanh: 3000,
      ngayPhatHanh: DateTime(2026, 9, 7),
    ),
  ];

  // Dùng vòng lặp for...in duyệt danh sách và in
  for (var tl in danhSachTaiLieu) {
    tl.hienThiThongTin();
    print(''); // Dòng trống ngăn cách
  }
}