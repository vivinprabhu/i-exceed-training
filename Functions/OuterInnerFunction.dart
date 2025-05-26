void main() {
    
    // storing function in a variable  

    var name = Outerfunction();
    name();

    var updatedName = parameteredFunction(name);
    updatedName();
}

Function Outerfunction() {
    String InnerFunction() {

    }
    // returning a function
    return ()=>{print("vivin is my name")};
}

Function parameteredFunction(Function name) {
    return ()=>{print("Updated function, now name is prabhu")};
}