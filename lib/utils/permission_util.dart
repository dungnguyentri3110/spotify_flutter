import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  PermissionUtil.init();

  static final PermissionUtil instance = PermissionUtil.init();

  factory PermissionUtil() {
    return instance;
  }

  void requestMediaPermission() async {
    try {
      Map<Permission, PermissionStatus> status =
          await [Permission.mediaLibrary].request();
      print("Request $status");
    } catch (e) {
      print("error $e");
    }
  }

  Future<bool?> checkMediaPermission() async {
    try {
      var status = await Permission.storage.status;
      print("nhay vao day ${status}");
      if (status != PermissionStatus.granted) {
        requestMediaPermission();
      } else {
        return true;
      }
    } catch (e) {
      print("error $e");
    }
    return null;
  }
}
