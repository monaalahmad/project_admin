
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String address;
  final String category;
  final String color;
  final String country;
  final String description;

  String brand;

  Product({
    required this.address,
    required this.category,
    required this.color,
    required this.country,
    required this.description,
    required this.name,
    required this.brand,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        price,
        imageUrl,
        brand,
      ];
  static List<Product> products = [
    Product(
      name: 'CONCEALER',
      price: 10.00,
      imageUrl: "images/unstuff.jpeg",
      brand: 'MAYBELLINE',
      address: 'Damascus',
      description:
          'Colored pigments erase the under-eye surface and perfectly cover Immediately removes dark circles and fine lines.',
      category: 'MakeUp',
      color: 'natural',
      country: 'France',
    ),
    Product(
      name: 'LipStick',
      price: 20,
      imageUrl: "images/dates.jpg",
      brand: 'MAC',
      address: 'Damascus',
      description: 'Mega-Bold Matte Colour, Ultra-Weightless',
      category: 'MakeUp',
      color: 'velvet',
      country: 'France',
    ),
    Product(
      name: 'phoneCase',
      price: 2.00,
      imageUrl: "images/delight.jpg",
      brand: 'Apple',
      address: 'Damascus',
      description: 'Mobile cover printed with hearts',
      category: 'Accessories',
      color: 'pink',
      country: 'china',
    ),
    Product(
      name: 'classic black for men',
      price: 100.00,
      imageUrl: "images/Dragee.jpg",
      brand: 'JAGUAR',
      address: 'Damascus',
      description: 'Eau_de_toilette, 100 milles ',
      category: 'Perfume',
      color: 'black',
      country: 'France',
    ),
    Product(
      name: 'LipStick',
      price: 30.00,
      imageUrl: "images/dry-fruit-chocolate-bar.jpg",
      brand: 'MINERALOGIE',
      address: 'Damascus',
      description: 'Mega-Bold Matte Colour, Ultra-Weightless',
      category: 'MakeUp',
      color: 'red',
      country: 'France',
    ),
    Product(
      address: 'Damascus',
      category: 'MakeUp',
      color: 'Joy - dewy muted peach',
      country: 'USA',
      description:
          'Radiant Finish,Liquid Formula,Community Favorite,Matte Finish,Long-wearing,Medium Coverage',
      name: 'Soft Pinch Liquid Blush',
      brand: 'Rare Beauty by Selena Gomez',
      price: 23.00,
      imageUrl: "images/lipstick_rarebeauty.webp",
    ),
    Product(
      name: 'Benetint Liquid Lip Blush',
      price: 21.00,
      imageUrl: "images/benefit.webp",
      brand: 'Benefit Cosmetics',
      address: 'Damascus',
      description:
          'Natural Finish, Hydrating,Long-wearing,Free of formaldehydes, formaldehyde-releasing agents, phthalates, mineral oil, retinyl palmitate, oxybenzone, coal tar, hydroquinone, sulfates SLS & SLES, triclocarban, triclosan, and contains less than one percent synthetic fragrance.',
      category: 'MakeUp',
      color: 'Floratint - Desert-Rose',
      country: 'France',
    ),
    Product(
      name: 'Lip Blush Cream Lip',
      price: 25.00,
      imageUrl: "images/hudabeauty.webp",
      brand: 'HUDA BEAUTY',
      address: 'Damascus',
      description:
          'Natural Finish, Hydrating,A hydrating, ultra-comfortable, and transfer-proof stain that tints lips and cheeks with a natural matte finish that lasts all day.',
      category: 'MakeUp',
      color: 'Rosy Kiss - sheer rose',
      country: 'France',
    ),
    Product(
      name: 'Powerstation XL PD',
      price: 30.00,
      imageUrl: "images/powerbank.jpg",
      brand: 'mophie ',
      address: 'Damascus',
      description:
          'The mophie powerstation XL provides fast, portable power for your digital devices. Its USB-C PD port puts out up to 20W of fast-charging power. It also has two USB-A ports, so you can charge three devices at once. The compact powerstation XL has an internal 20,000mAh battery with the capacity to meet the demands of your day.',
      category: 'Accessories',
      color: 'Black',
      country: 'china',
    ),
    Product(
      name: 'MagSafe Battery Pack',
      price: 100.00,
      imageUrl: "images/applepower.jpg",
      brand: 'Apple ',
      address: 'Damascus',
      description:
          'Attaching the MagSafe Battery Pack is a snap. Its compact, intuitive design makes on-the-go charging easy. And its perfectly aligned magnets keep it attached to your iPhone 13, iPhone 13 Pro, iPhone 12 or iPhone 12 Pro - providing safe and reliable wireless charging. ',
      category: 'Accessories',
      color: 'White',
      country: 'USA',
    ),
    Product(
      name: 'Mobile case',
      price: 10.00,
      imageUrl: "images/cover.jpg",
      brand: 'SP Connect SPC ',
      address: 'Damascus',
      description: '',
      category: 'Accessories',
      color: 'black',
      country: 'USA',
    ),
    Product(
      name: ' Wireless MagSafe Charger',
      price: 150.00,
      imageUrl: "images/charger.jpg",
      brand: 'Belkin 3-in-1 ',
      address: 'Damascus',
      description:
          'With the Belkin 3-in-1 Wireless MagSafe Charger 15W Black, you can fast charge your iPhone 12, 13, or 14, AirPods, and Apple Watch at the same time.',
      category: 'Accessories',
      color: 'black',
      country: 'USA',
    ),
    Product(
      name: 'Cell Phone Stand',
      price: 14.00,
      imageUrl: "images/stand.jpg",
      brand: 'Nulaxy',
      address: 'Damascus',
      description:
          'UNIVERSAL COMPATIBILITY: This phone stand works with all 4-10" Smartphones and e-readers, such as iPhone 11 Pro Xs Xs Max Xr X 8 7 6, Switch, Samsung Galaxy S10 /S10+/S9 /S9+/S8 /S8+, Google Nexus, Kindle.',
      category: 'Accessories',
      color: 'black',
      country: 'USA',
    ),
    Product(
      name: 'Ultra Portable Speakers',
      price: 109.00,
      imageUrl: "images/speaker.jpg",
      brand: 'Cambridge Soundworks ',
      address: 'Damascus',
      description:
          'OontZ Pro Premium Speaker • Ultra Portable Speakers Bluetooth • Great Outdoor Speaker Bluetooth Waterproof Standard for Dad or Mom • The Original Angled Speaker',
      category: 'Accessories',
      color: 'black',
      country: 'USA',
    ),
    Product(
      name: 'ZEALOT Portable Bluetooth Speakers',
      price: 29.99,
      imageUrl: "images/speaker2.jpg",
      brand: 'ZEALOT ',
      address: 'Damascus',
      description:
          'Waterproof Speaker IPX5, Mini Wireless Speaker, S32 Upto 12H Playtime, Stereo Pairing, MIC/TF Card/USB/AUX for Home/Outdoor Competible for iOS Andriod Black',
      category: 'Accessories',
      color: 'black',
      country: 'USA',
    ),
    Product(
      name: 'Bose SoundLink Flex',
      price: 149.00,
      imageUrl: "images/speaker3.jpg",
      brand: 'Bose ',
      address: 'Damascus',
      description:
          'Bluetooth Portable Speaker, Wireless Waterproof Speaker for Outdoor Travel',
      category: 'Accessories',
      color: 'Stone Blue',
      country: 'USA',
    ),
    Product(
      name: 'Selfie Stick',
      price: 29.99,
      imageUrl: "images/selfiestick.jpg",
      brand: 'SENSYNE',
      address: 'Damascus',
      description:
          ' Phone Tripod & Selfie Stick, Extendable Cell Phone Tripod Stand with Wireless Remote and Phone Holder, Compatible with iPhone Android Phone',
      category: 'Accessories',
      color: 'black',
      country: 'USA',
    ),
    Product(
      name: 'Pure Instinct ',
      price: 23.99,
      imageUrl: "images/perfume.jpg",
      brand: 'Pure Instinct',
      address: 'Damascus',
      description:
          'Pure Instinct Roll-On - The Original Pheromone Infused Essential Oil Perfume Cologne - Unisex For Men and Women - TSA Ready',
      category: 'perfume',
      color: 'blue',
      country: 'USA',
    ),
    Product(
      name: 'Bath & Body Works ',
      price: 28.99,
      imageUrl: "images/perfume2.jpg",
      brand: 'Bath & Body Works',
      address: 'Damascus',
      description:
          'Bath and Body Works CHAMPAGNE TOAST Fine Fragrance Mist - NEW LOOKS 2022 - PACK OF 2 ( FULL SIZE MIST 8FL OZ / 236 ML )',
      category: 'perfume',
      color: 'CHAMPAGNE TOAST',
      country: 'USA',
    ),
    Product(
      name: 'Miss Dior ',
      price: 299.99,
      imageUrl: "images/perfume3.jpg",
      brand: 'Dior',
      address: 'Damascus',
      description: 'Miss Dior Eau de Parfum Mini Splash for Women, 0.17 Ounce',
      category: 'perfume',
      color: 'Floral,Fresh,Rose',
      country: 'USA',
    ),
  ];
}
