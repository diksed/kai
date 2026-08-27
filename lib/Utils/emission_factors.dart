/// Greenhouse gas emission factors used to turn a raw consumption amount
/// (kWh, m³, litre, kg...) into kilograms of CO2-equivalent.
///
/// These used to be looked up as Turkish-lira *prices* from a live Firestore
/// document, which meant the calculation silently drifted whenever the
/// remote price data went stale (or the Firebase project itself went away).
/// Emission factors change far more slowly than currency prices, so they are
/// now plain constants that ship with the app, work fully offline, and can
/// be reviewed/updated in one place.
///
/// Sources (general, widely-cited averages — update if you have a more
/// specific figure for Turkey):
/// - Electricity: Turkey national grid average, ~0.4-0.5 kg CO2e/kWh in
///   recent years (TEİAŞ / IEA); kept slightly conservative.
/// - Natural gas / fuel oil / coal / vehicle fuels: DEFRA / EPA combustion
///   factors, commonly used ranges for household & vehicle fuel.
/// - Food: Poore & Nemecek (2018), "Reducing food's environmental impacts
///   through producers and consumers", Science — commonly cited per-kg/L
///   averages for meat, dairy and produce.
class EmissionFactors {
  EmissionFactors._();

  /// kg CO2e per kWh of grid electricity.
  static const double electricityKwh = 0.48;

  /// kg CO2e per m³ of natural gas burned for heating.
  static const double naturalGasM3 = 2.0;

  /// kg CO2e per litre of heating fuel oil.
  static const double fuelOilLiter = 2.6;

  /// kg CO2e per kg of coal burned for heating.
  static const double coalKg = 2.42;

  /// kg CO2e per litre of gasoline (petrol).
  static const double gasolineLiter = 2.31;

  /// kg CO2e per litre of diesel.
  static const double dieselLiter = 2.68;

  /// kg CO2e per litre of automotive LPG.
  static const double vehicleLpgLiter = 1.51;

  /// kg CO2e per kg of meat (red-meat-weighted average; a mixed diet's
  /// true figure varies a lot by meat type — see note in the food screen).
  static const double meatKg = 27.5;

  /// kg CO2e per litre of dairy milk.
  static const double milkLiter = 1.2;

  /// kg CO2e per kg of fruit & vegetables.
  static const double greengroceryKg = 0.2;

  /// Rough kg of CO2 a young tree offsets over its growth — used only for
  /// the "donate a sapling" gamification screen, not the footprint itself.
  static const double co2KgPerTree = 400;
}
