String displayProxyName(String name) {
  final trimmed = name.trim();
  if (trimmed.isEmpty) {
    return trimmed;
  }

  return trimmed
      .replaceAll(RegExp(r'^\s*(?:\[[^\]]+\]\s*)+'), '')
      .replaceAll(RegExp(r'^\s*(?:\([^)]+\)\s*)+'), '')
      .trim();
}
