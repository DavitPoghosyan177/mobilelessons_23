abstract class Flyable {
  void fly();
}

class Bird implements Flyable {
  @override
  void fly() {
    print('Bird is flying');
  }
}

class Airplane implements Flyable {
  @override
  void fly() {
    print('Airplane is flying');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly(); 
  
  Airplane airplane = Airplane();
  airplane.fly(); 
}
