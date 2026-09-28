Stream<int> downloadFile() async* {
  for (int percent = 0; percent <= 100; percent += 5) {
    await Future.delayed(Duration(seconds: 1));
    yield percent;
  }
}

void main() async {
  print('Bắt đầu tải file...');

  await for (int progress in downloadFile()) {
    print('Tiến trình tải: $progress%');
  }

  print('Tải dữ liệu hoàn tất!');
}