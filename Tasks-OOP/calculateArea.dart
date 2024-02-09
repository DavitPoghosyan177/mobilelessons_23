import 'dart:math';

abstract class Shape {
  double area();
  double perimeter();
}

class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double area() {
    return length * width;
  }

  @override
  double perimeter() {
    return 2 * (length + width);
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return pi * pow(radius, 2);
  }

  @override
  double perimeter() {
    return 2 * pi * radius;
  }
}

void main() {
  Rectangle rectangle = Rectangle(10, 4);
  print("Rectangle Area: ${rectangle.area()}");
  print("Rectangle Perimeter: ${rectangle.perimeter()}");

  Circle circle = Circle(12);
  print("Circle Area: ${circle.area()}");
  print("Circle Perimeter: ${circle.perimeter()}");
}
