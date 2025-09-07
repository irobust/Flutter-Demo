# Flutter Workshop
## Dart Basic
Dart basic syntax
### Variables

```dart
void main(){
    String name = 'John';
    print('Hello' + name);
    print('Hello $name');
}
```
```dart
var a = null ?? true;
print(a);
```

```dart
void main(){
    dynamic name = 'John';
    name = 8;
    print('Hello $name');
}
```

### Collections and Loops

```dart
void printFlavor(){
    List<String> iceCreams = ['Coconut', 'Vanilla', 'Chocolate'];
    iceCreams.add('Lemon');
    iceCreams.remove('Vanilla');
    iceCreams.removeAt(0);

    for(int i=0; i < iceCreams.length; i++){
        print(iceCreams[i]);
    }

    iceCreams.forEach((flavor){
        print(flavor);
    });

    bool hasCoconut = iceCreams.contains('Coconut');
    print(hasCoconut);
    if(hasCoconut) print('We have coconut');

    String message = iceCreams.contains('Coconut')? 'We have coconut' : "We don't have coconut";
    print(message);
}
```

### Class and Objects
```dart
void main(){
   IceCream iceCream = new IceCream('Vanila', false);
}

class IceCream {
    String flavor = 'Vanilla';
    bool isFruit = false;
    IceCream(this.flavor, this.isFruit);
    IceCream.withFlavor(): flavor='Vanilla', isFruit=false;
    // IceCream.withFlavor(): this('Vanilla', false);
    IceCream.fruitWithFlavor(this.flavor){
        isFruit = true;
    }
}

class Cone extends IceCream{
    bool hasToping = false;
    Cone(String flavor, bool isFruit, this.hasToping): super(flavor, isFruit);
}
```

### Null safe

```dart
void main(){
    var iceCream = IceCream();
    String myFlavor = iceCream.flavor ?? 'Vanilla';

    // iceCream.flavor = 'Chocolate';
    // String myFlavor = iceCream.flavor!;

    // String? myFlavor = iceCream.flavor;
    // print(myFlavor?.length);

    // myFlavor ??= 'Vanilla';
    // print(myFlavor)
}

class IceCream{
    String? flavor;
    bool? isFruit;
}
```

```dart
class IceCream{
    late String flavor;
    late bool isFruit;
}
```

## Flutter
1. Create New Project
    ```bash
    flutter create -e [Application Name]
    ```
2. Install Dart Package