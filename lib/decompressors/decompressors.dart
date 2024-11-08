import 'dart:convert';
import 'dart:io';

/// ALL OF THESE ARE USED IN SYNC SCREEN TO DECOMPRESS DATA

String decodeUTF8(List<int> data) {
  try {
    return utf8.decode(data);
  } catch (e) {
    return '';
  }
}

List<int> decodeGzip(List<int> data) {
  try {
    return gzip.decode(data);
  } catch (e) {
    return [0];
  }
}

List<int> decodeBase64(String data) {
  try {
    return base64.decode(data);
  } catch (e) {
    return [0];
  }
}

List<dynamic> saveToList(String data) {
  try {
    return json.decode(data);
  } catch (e) {
    return [0];
  }
}