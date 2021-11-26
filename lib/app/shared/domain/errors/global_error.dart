class GlobalError implements Exception {
  
  final String message;
  GlobalError(this.message);

  String toString() {
    return message;
  } 
}