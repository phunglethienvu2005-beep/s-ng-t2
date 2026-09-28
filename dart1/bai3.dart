import 'package:http/http.dart' as http;
import 'dart:convert';

// --- PHẦN 1: Future, async, await với Public API ---

// 2. Viết hàm fetchApiData()
Future<String> fetchApiData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body; // Trả về chuỗi JSON
  } else {
    throw Exception('Tải dữ liệu thất bại!');
  }
}

// 3. Viết hàm parseData()
Map<String, dynamic> parseData(String responseBody) {
  // Chuyển chuỗi JSON thành Map
  Map<String, dynamic> dataMap = jsonDecode(responseBody);
  return dataMap;
}

// --- PHẦN 2: Stream, async*, yield ---

// 1. Viết hàm countDown()
Stream<int> countDown() async* {
  for (int i = 5; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Phát ra số đếm hiện tại
  }
}

// --- HÀM MAIN THỰC THI ---
void main() async {
  // 4. Thực thi Phần 1: Gọi API
  print('=== PHẦN 1: GỌI PUBLIC API ===');
  try {
    String responseBody = await fetchApiData();
    Map<String, dynamic> dataMap = parseData(responseBody);

    print('Tiêu đề: ${dataMap['title']}');
    print('Nội dung: ${dataMap['body']}');
  } catch (e) {
    print('Lỗi: $e');
  }

  print('\n-----------------------------');

  // 2. Thực thi Phần 2: Stream đếm ngược
  print('=== PHẦN 2: STREAM ĐẾM NGƯỢC ===');
  print('Chuẩn bị đếm ngược...');

  // Dùng await for để lắng nghe stream
  await for (int number in countDown()) {
    print(number);
  }

  print('Kết thúc!');
}