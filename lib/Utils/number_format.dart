/// Formats a CO2/weight value for display, dropping the decimal point
/// entirely when the value is a whole number — "7200.0 kg" and "1.24 t"
/// both used to show the same fixed number of decimals no matter what, so
/// a perfectly round "7200.0" looked like a made-up-precision number
/// instead of just "7200".
///
/// [maxDecimals] is how many decimal places to *consider* — trailing zeros
/// beyond the first significant one are still trimmed, so `1.20` becomes
/// `1.2` and `1.00` becomes `1`.
String formatCo2Value(double value, {int maxDecimals = 1}) {
  final fixed = value.toStringAsFixed(maxDecimals);
  if (!fixed.contains('.')) return fixed;

  var trimmed = fixed;
  while (trimmed.endsWith('0')) {
    trimmed = trimmed.substring(0, trimmed.length - 1);
  }
  if (trimmed.endsWith('.')) {
    trimmed = trimmed.substring(0, trimmed.length - 1);
  }
  return trimmed;
}
