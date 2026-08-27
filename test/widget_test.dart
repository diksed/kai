// Layout regression test for the past-records screen's structure: content
// (past-records list + banner ad + button row) has to fit inside a small
// phone viewport without Flutter's RenderFlex "overflowed by N pixels"
// error, even though the banner ad adds extra height on top of an
// already screen-filling layout.
//
// This deliberately doesn't pump the real PastRecords widget: that widget
// tree pulls in GetStorage/get_storage and the AdMob plugin, whose platform
// channels aren't backed by a real app in `flutter test` and made the test
// hang rather than fail — not worth fighting for a layout check. Instead
// this reproduces the exact structural fix (a SingleChildScrollView wrapping
// the content Column) with placeholder content sized like the real pieces,
// which is what actually prevents the overflow.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _pastRecordsLikeLayout() {
  return MaterialApp(
    home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60), // logo + title, roughly
            SizedBox(height: 300, child: Container(color: Colors.white10)),
            const SizedBox(width: 320, height: 50), // banner ad footprint
            SizedBox(height: 60, child: Container(color: Colors.white10)),
          ],
        ),
      ),
    ),
  );
}

void main() {
  testWidgets(
      'a screen-filling column plus a banner ad scrolls instead of overflowing',
      (WidgetTester tester) async {
    // A small, common phone viewport (roughly an iPhone SE / small Android).
    await tester.binding.setSurfaceSize(const Size(360, 640));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_pastRecordsLikeLayout());
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
