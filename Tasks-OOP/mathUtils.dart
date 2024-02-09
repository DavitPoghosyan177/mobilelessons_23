class MathUtils {
  static double add(double a, double b) {
    return a + b;
  }

  static double sub(double a, double b) {
    return a - b;
  }

  static double mult(double a, double b) {
    return a * b;
  }

  static double div(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Can't divide by zero");
    }
    return a / b;
  }
}

void main() {
  double a = 7;
  double b = 4;

  print('Add ${MathUtils.add(a, b)}');       
  print('Sub: ${MathUtils.sub(a, b)}');  
  print('Mult: ${MathUtils.mult(a, b)}'); 
  print('Div ${MathUtils.div(a, b)}');   
}