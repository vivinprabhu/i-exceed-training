void main() {
    /// Example for First class function -- we can pass function as a parameter to another function

    var list = ["sanjay" , "lithik" , "kushal" , "vivin"];
    list.forEach(printList);
}

void printList(String listElements) {
    print(listElements);
}