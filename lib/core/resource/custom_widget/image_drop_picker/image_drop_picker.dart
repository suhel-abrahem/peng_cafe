import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:peng_cafe/core/resource/color_manager.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../constant/font_constants.dart';

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
  bool _dragging = true;

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
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 48,
                      color: ColorManager.darkTextColor,
                    ),
                    SizedBox(height: 8),
                    Text(
                      LocaleKeys
                          .productsPage_addProductForm_dragAndDropOrClickToSelectImage
                          .tr(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                        color: ColorManager.darkTextColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
