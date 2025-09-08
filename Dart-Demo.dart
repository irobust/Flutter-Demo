void main(){
  // var iceCream = IceCream.fruity('Coconut');
  Cone iceCream = Cone('Vanilla', false, false);
  print(iceCream.flavor);
}

class IceCream{
  String flavor;
  bool? isFruit;
  
  IceCream(this.flavor, this.isFruit);
  // IceCream.withFlavor(): flavor='Vanilla', isFruit=false;
  IceCream.withFlavor(): this('Vanilla', false);
  IceCream.fruity(this.flavor){
    this.isFruit = true;
  } 
}

class Cone extends IceCream{
  bool addToping = false;
  
  Cone(String flavor, bool isFruit, this.addToping): super(flavor, isFruit);
}


void collectionAndLoops(){
  List<String> iceCreams = ['Coconut', 'Chocolate'];
  iceCreams.add('Vanilla');
  // iceCreams.remove('Coconut');
  // iceCreams.removeAt(0);
  
  bool hasCoconut = iceCreams.contains('Coconut');
  if(hasCoconut) print('We have coconut icecream');
  else print("We don't have coconut icecream");
  
  var message = hasCoconut ? "We have coconut" : "Web don't have coconut";
  print(message);
  
  for(int i=0; i < iceCreams.length; i++){
    print(iceCreams[i]);
  }
  
  iceCreams.forEach((item){
    print(item);
  });
}

void setVariable(){
  var name = 'John';
  
  print('Hello '+ name +'!');
  print('Hello $name!');
  
  for(int i=0; i<10; i++){
     print('i=${i + 1}');
  }
}