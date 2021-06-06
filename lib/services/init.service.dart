import 'dart:io';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';

class InitService {
  //singleton
  static final InitService _service = InitService._internal();

  factory InitService() {
    return _service;
  }

  InitService._internal();
  //fin singleton

  Future<void> initParse() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Directory directory =
        await new Directory(appDocDirectory.path + '/' + 'dir')
            .create(recursive: true);
    await Parse().initialize(
      "5fBDOEyfgJDW53w0PdguYKaSH7jUeNfs1D1xLlSw",
      "https://parseapi.back4app.com/",
      clientKey:
          "ujiHLwGdDIGGTvEQTy9gIXmPyZ1UQseNYaOiy1k6", // Required for Back4App and others
      debug: false, // When enabled, prints logs to console
      coreStore:
          await CoreStoreSembastImp.getInstance(directory.path + "/data.db"),
      autoSendSessionId: true, // Required for authentication and ACL
    );
  }
}
