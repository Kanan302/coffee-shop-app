class Coffee {
  final String name;
  final Map<String, String> prices;
  final String imagePath;


  String _selectedSize = ''; 
  String _selectedSizePrice = ''; 

  Coffee({
    required this.name,
    required this.prices,
    required this.imagePath,
  });


  String get selectedSize => _selectedSize;
  String get selectedSizePrice => _selectedSizePrice;


  set selectedSize(String value) {
    _selectedSize = value;
  }

  set selectedSizePrice(String value) {
    _selectedSizePrice = value;
  }
}
