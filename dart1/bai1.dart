// 2. Hàm tính điểm trung bình
double tinhDiemTrungBinh(List<double> diem) {
  if (diem.isEmpty) return 0.0;
  
  double tong = 0.0;
  for (double d in diem) {
    tong += d;
  }
  return tong / diem.length;
}

// 3. Hàm xếp loại học lực
String xepLoai(double dtb) {
  if (dtb >= 9.0) {
    return 'Xuất sắc';
  } else if (dtb >= 8.0) {
    return 'Giỏi';
  } else if (dtb >= 6.5) {
    return 'Khá';
  } else if (dtb >= 5.0) {
    return 'Trung bình';
  } else {
    return 'Yếu';
  }
}

// 4. Hàm main thực thi chương trình
void main() {
  // 1. Khai báo Map lưu điểm môn học
  Map<String, double> diemMonHoc = {
    'Toán': 9.0,
    'Văn': 7.5,
    'Anh': 8.0,
  };

  // Lấy danh sách điểm từ diemMonHoc.values và chuyển sang List<double>
  List<double> danhSachDiem = diemMonHoc.values.toList();

  // Gọi hàm tính điểm trung bình
  double dtb = tinhDiemTrungBinh(danhSachDiem);

  // Gọi hàm xếp loại
  String ketQuaXepLoai = xepLoai(dtb);

  // In kết quả ra màn hình (làm tròn 2 chữ số thập phân)
  print('Điểm trung bình: ${dtb.toStringAsFixed(2)}. Xếp loại: $ketQuaXepLoai');
}