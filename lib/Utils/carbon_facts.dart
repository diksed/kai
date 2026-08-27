/// Short carbon-footprint tips shown one-at-a-time on the menu screen.
///
/// This used to be a single random document fetched from Firestore on every
/// app open — an extra network round-trip (and a "loading..."/error state)
/// for a handful of static sentences that basically never changed. Shipping
/// them with the app means this works instantly and offline; add or edit
/// entries here whenever you want new tips, no backend needed.
class CarbonFacts {
  CarbonFacts._();

  static const List<String> tr = [
    'Bir ampulü LED ile değiştirmek, yılda ortalama 15-20 kg CO2 tasarrufu sağlayabilir.',
    'Kırmızı et tüketimini haftada bir gün azaltmak, yılda yüzlerce kg CO2e tasarrufu sağlayabilir.',
    'Termostatı 1°C düşürmek, ısınmadan kaynaklanan emisyonları %5-10 azaltabilir.',
    'Kısa mesafelerde araç yerine yürümek ya da bisiklet kullanmak hem sağlığa hem doğaya iyi gelir.',
    'Cihazları bekleme modunda bırakmak yerine tamamen kapatmak, elektrik tüketimini azaltır.',
    'Yerel ve mevsiminde üretilmiş gıdalar, taşıma kaynaklı emisyonları azaltır.',
    'Bir ağaç, yaşamı boyunca ortalama birkaç yüz kilogram CO2 depolayabilir.',
    'Doğru şişirilmiş araç lastikleri yakıt tüketimini %3\'e kadar azaltabilir.',
    'Su ısıtıcılarını gereğinden yüksek sıcaklıkta çalıştırmak gereksiz enerji tüketimine yol açar.',
    'Toplu taşıma kullanmak, tek başına araç kullanmaya kıyasla kişi başı emisyonu ciddi oranda azaltır.',
  ];

  static const List<String> en = [
    'Switching a bulb to LED can save around 15-20 kg of CO2 per year.',
    'Cutting red meat by just one day a week can save hundreds of kg of CO2e per year.',
    'Lowering your thermostat by 1°C can cut heating emissions by 5-10%.',
    'Walking or cycling for short trips is good for both your health and the planet.',
    'Fully switching off devices instead of leaving them on standby reduces electricity use.',
    'Local, in-season food cuts down on transport-related emissions.',
    'A single tree can store a few hundred kilograms of CO2 over its lifetime.',
    'Properly inflated tires can improve fuel efficiency by up to 3%.',
    'Running your water heater hotter than needed wastes energy.',
    'Public transport produces far less CO2 per person than driving alone.',
  ];
}
