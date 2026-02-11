import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageDropPicker extends StatefulWidget {
  final File? initialImage;
  final ValueChanged<File?> onImageSelected;

  const ImageDropPicker({
    super.key,
    this.initialImage,
    required this.onImageSelected,
  });

  @override
  State<ImageDropPicker> createState() => _ImageDropPickerState();
}

class _ImageDropPickerState extends State<ImageDropPicker> {
  File? _image;
  bool _dragging = false;

  @override
  void initState() {
    super.initState();
    _image = widget.initialImage;
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      setState(() => _image = file);
      widget.onImageSelected(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragEntered: (_) => setState(() => _dragging = true),
      onDragExited: (_) => setState(() => _dragging = false),
      onDragDone: (detail) {
        final file = detail.files.first;
        setState(() => _image = File(file.path));
        widget.onImageSelected(File(file.path));
      },
      child: GestureDetector(
        onTap: _pickImage,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: _dragging
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: _dragging
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Drop image here or click to select',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
