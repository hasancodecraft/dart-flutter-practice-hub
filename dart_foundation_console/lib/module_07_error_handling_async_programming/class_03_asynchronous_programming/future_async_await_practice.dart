void main() async {
  print("Download started...");

  String downloadStatus = await downloadFile();

  print('Download status: $downloadStatus');
}

Future<String> downloadFile() async {
  await Future.delayed(Duration(seconds: 4));
  return 'File downloaded successfully';
}