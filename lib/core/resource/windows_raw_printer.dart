import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

class WindowsRawPrinter {
  static Future<void> printBytes(String printerName, List<int> bytes) async {
    final printerNamePtr = printerName.toNativeUtf16();

    final hPrinter = calloc<IntPtr>();
    final docInfo = calloc<DOC_INFO_1>()
      ..ref.pDocName = 'POS Receipt'.toNativeUtf16()
      ..ref.pOutputFile = nullptr
      ..ref.pDatatype = 'RAW'.toNativeUtf16();

    if (OpenPrinter(printerNamePtr, hPrinter, nullptr) == 1) {
      StartDocPrinter(hPrinter.value, 1, docInfo.cast());
      StartPagePrinter(hPrinter.value);

      final dataPtr = calloc<Uint8>(bytes.length);
      final data = dataPtr.asTypedList(bytes.length);
      data.setAll(0, bytes);

      WritePrinter(hPrinter.value, dataPtr.cast(), bytes.length, nullptr);

      EndPagePrinter(hPrinter.value);
      EndDocPrinter(hPrinter.value);
      ClosePrinter(hPrinter.value);

      calloc.free(dataPtr);
    }

    calloc.free(docInfo);
    calloc.free(hPrinter);
    calloc.free(printerNamePtr);
  }
}
