extension StringExtension on String {
  String? get nullIfBlankOrTrim {
    final trimmed = trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
