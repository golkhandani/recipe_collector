import 'package:flutter/material.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/raw_custom_dropdown.dart';

class SyncDropdownMenu<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuEntry<T>> items;
  final T? selectedItem;
  final void Function(T) onSelected;
  final bool isEnabled;
  const SyncDropdownMenu({
    super.key,
    required this.labelText,
    required this.selectedItem,
    required this.items,
    required this.onSelected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return RawDropdownMenu<T>(
      requestFocusOnTap: false,
      enableFilter: false,
      enableSearch: false,
      enabled: isEnabled,
      expandedInsets: EdgeInsets.zero,
      minCharCount: -1,
      initialSelection: selectedItem,
      onSelected: (value) => {
        if (value != null) {onSelected.call(value)}
      },
      label: Text(labelText),
      textStyle: isEnabled
          ? null
          : context.typoraphyTheme.hint
              .copyWith(
                fontSize: context.typoraphyTheme.bodyLarge.textStyle.fontSize,
              )
              .textStyle,
      inputDecorationTheme: context.customTheme.data.inputDecorationTheme,
      menuStyle: MenuStyle(
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 240),
        ),
        surfaceTintColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        backgroundColor: MaterialStatePropertyAll(
          context.colorTheme.navBackground,
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      dropdownMenuEntries: items,
    );
  }
}

class AsyncDropdownMenu<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final List<DropdownMenuEntry<T>> items;
  final void Function(String) onChanged;
  final void Function(T) onSelected;
  final TextEditingController controller;
  final bool isLoading;
  final bool isEnabled;
  const AsyncDropdownMenu({
    super.key,
    this.labelText,
    this.hintText,
    required this.items,
    required this.onChanged,
    required this.controller,
    required this.isLoading,
    required this.onSelected,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return RawDropdownMenu<T>(
      requestFocusOnTap: true,
      enabled: isEnabled,
      hintText: hintText,
      isLoadingEntries: isLoading,
      minCharCount: 3,
      onChanged: onChanged,
      onSelected: (value) => {
        if (value != null) {onSelected.call(value)}
      },
      expandedInsets: EdgeInsets.zero,
      controller: controller,
      label: labelText != null ? Text(labelText!) : null,
      textStyle: isEnabled
          ? null
          : context.typoraphyTheme.hint
              .copyWith(
                fontSize: context.typoraphyTheme.bodyLarge.textStyle.fontSize,
              )
              .textStyle,
      trailingIcon: null,
      inputDecorationTheme: context.customTheme.data.inputDecorationTheme,
      menuStyle: MenuStyle(
        maximumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 240),
        ),
        surfaceTintColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        backgroundColor: MaterialStatePropertyAll(
          context.colorTheme.navBackground,
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      dropdownMenuEntries: items,
    );
  }
}
