
// Base class Shape
class Shape {
  double diameter1;
  double diameter2;

  Shape(this.diameter1, this.diameter2);
}

// Subclass Rectangle
class Rectangle extends Shape {
  Rectangle(double width, double height) : super(width, height);

   double area() {
    return diameter1 * diameter2;
  }
}

// Subclass Triangle
class Triangle extends Shape {
  Triangle(double base, double height) : super(base, height);

  double area() {
    return 0.5 * diameter1 * diameter2;
  }
}
