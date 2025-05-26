import 'dart:math';

void main() {
    Circle c = Circle(12);
    c.calculate();
    Square s = Square(5);
    s.calculate();
}

abstract class Shape {
    void calculate();
}

class Circle extends Shape {
    dynamic radius;

    Circle(this.radius);

    @override
    void calculate() {
        print(pi*radius*radius);
    }
}

class Square extends Shape {
    dynamic length;

    Square(this.length);

    @override
    void calculate() {
        print(length*length);
    }
}