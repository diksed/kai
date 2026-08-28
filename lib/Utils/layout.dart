/// Shared horizontal screen margin. A few places (the calculation screens'
/// description text, the past-records list) had it hardcoded to 0 — content
/// ran flush edge-to-edge — while others used ad-hoc `Get.width / N`
/// fractions that didn't agree with each other. One constant, applied
/// consistently, instead of re-deriving a margin per screen.
const double kScreenHPadding = 20;
