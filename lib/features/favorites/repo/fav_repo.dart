class FavRepo {
  final List<String> _favorites = [];

  List<String> getFavorites() => _favorites;

  void add(String id) {
    if (!_favorites.contains(id)) _favorites.add(id);
  }

  void remove(String id) {
    _favorites.remove(id);
  }

  void toggle(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
  }

  void clearAll() {
    _favorites.clear();
  }
}
