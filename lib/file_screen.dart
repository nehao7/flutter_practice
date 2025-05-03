import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({super.key});

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  final TextEditingController _controller = TextEditingController();

  String fileContent = '';

  Future<void> requestPermissions() async {
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
  }
  Future<void> saveToDownloads(String fileName, String content) async {
    await requestPermissions();
    final tempDir = await getTemporaryDirectory(); // Safe internal storage
    final tempFile = File('${tempDir.path}/$fileName');
    var tempPath=await tempFile.writeAsString(content);

    await tempFile.writeAsString(content);
    final mediaStore = MediaStore();
    mediaStore.saveFile(tempFilePath: "$tempPath", dirType: DirType.download, dirName: DirName.download);
    // var file =await mediaStore.saveFile(tempFilePath: "Downloads", dirType: , dirName: fileName)
    // final file = await mediaStore.saveFile(
    //   MediaFile(
    //     name: fileName,
    //     relativePath: "Download", // Or your subfolder
    //     mimeType: "text/plain",
    //     bytes: Uint8List.fromList(content.codeUnits),
    //   ),
    // );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("saved Successfully")));
    print("File saved at: ${tempFile.uri}");
  }

  Future<String> _getFilePath() async {
    // final dir = await getApplicationDocumentsDirectory();
    final dir = await getDownloadsDirectory();
    return '${dir?.path}/my_file.txt';
  }

  Future<void> writeFile(String text) async {
    final path = await _getFilePath();
    final file = File(path);
    // await file.writeAsString(text);
    await file.writeAsString("$text\n", mode: FileMode.append);
    readFile();
  }

  Future<void> readFile() async {
    final path = await _getFilePath();
    final file = File(path);
    if (await file.exists()) {
      final content = await file.readAsString();
      setState(() {
        fileContent = content;
      });
    } else {
      setState(() {
        fileContent = 'File does not exist.';
      });
    }
  }

  Future<bool> requestStoragePermission() async {
    if (await Permission.storage.isGranted) {
      return true;
    }

    final status = await Permission.storage.request();
    return status.isGranted;
  }
  Future<void> downloadFile() async {
    // Request storage permission if needed
    bool granted = await requestStoragePermission();
    if (!granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission denied')),
      );
      return;
    }
    else if (granted) {
    // if (await Permission.storage.request().isGranted && await Permission.manageExternalStorage.isGranted) {

      final appFile = File(await _getFilePath());
      final content = await appFile.readAsString();

      final downloadDir = Directory('/storage/emulated/0/Download');
      final downloadedFile = File('${downloadDir.path}/my_file.txt');

      // await downloadedFile.writeAsString(content);

      saveToDownloads("$downloadedFile", content);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('File downloaded to /Download/my_file.txt')),
      // );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Storage permission denied.')));
    }
  }

  @override
  void initState() {
    super.initState();
    readFile();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Handling")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(onPressed: downloadFile, child: Text("Download")),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter text to save to file",
                border: OutlineInputBorder(),
              ),
            ),
            Text(
              'File Content:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(fileContent),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => writeFile(_controller.text),
              child: Text('Write to File'),
            ),
          ],
        ),
      ),
    );
  }
}
