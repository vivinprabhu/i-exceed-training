void main() {
    Son s = Son("Max Tennyson", "Ben 10 Father", "BenTennison");
    s.display();
}

class GrandFather {
    String? grandFatherName;
    GrandFather(String grandFatherName) {
        this.grandFatherName = grandFatherName;
    }
}

class Father extends GrandFather {
    String? fatherName;
    Father(String fatherName, String grandFatherName) : super(grandFatherName) {
        this.fatherName = fatherName;
    }
}

// super parameters follows the heirarchy --> father, grandfather (not grandfather, father)

class Son extends Father{
    String? sonName;
    Son(String grandFatherName, String fatherName, String sonName): super(fatherName, grandFatherName) {
        this.sonName = sonName;
    }

    void display() {
        print("Grandpa : ${grandFatherName}");
        print("Dad : ${fatherName}");
        print("Son : ${sonName}");
    }
}