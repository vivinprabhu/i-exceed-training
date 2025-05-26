void main() {
    Student s = Student("Vivin" , 20, "Coimbatore");

    print(s.getName() + " " + s.getCity());
}

class Student {
    String _name = "";
    int _age = 0;
    String _city = "";

    Student(this._name, this._age, this._city) {

    }

    String getName() {
        return _name;
    }

    int getAge() {
        return _age;
    }

    String getCity() {
        return _city;
    }
}