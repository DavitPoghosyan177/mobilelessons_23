abstract class Animal {
  void makeSound(){}
}

class Dog extends Animal{
  @override
  void makeSound() {
    print('Haf Haf');
  }
}

class Cat extends Animal{
  @override
  void makeSound() {
    print('Myau');
  }
}

class Cow extends Animal{
  @override
  void makeSound() {
    print('MUU');
  }
}

void main(){ 

  Animal dog = Dog();
  dog.makeSound(); 

  Animal cat = Cat();
  cat.makeSound(); 

  Animal cow = Cow();
  cow.makeSound();  
}