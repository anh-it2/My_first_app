import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    surface: Colors.white, // Màu của các thành phần có bề mặt như thẻ hoặc danh sách
    error: Colors.red, // Màu dùng cho trạng thái lỗi
    onPrimary: Colors.black26, // Màu văn bản hoặc biểu tượng trên màu chính
    onSecondary: Colors.black, // Màu văn bản hoặc biểu tượng trên màu phụ
    onSurface: Colors.black, // Màu văn bản hoặc biểu tượng trên bề mặt (surface)
    onError: Colors.red, // Màu văn bản hoặc biểu tượng trên màu lỗi
    inversePrimary: Colors.grey.shade300, // Màu primary khi chuyển sang chế độ ngược (nền tối, chữ sáng)
  ),
  scaffoldBackgroundColor: Colors.grey.shade300,
);
