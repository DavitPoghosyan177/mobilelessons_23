void main(){
  final List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  final List<int> b = [];
  for(var el in a){
    if(el % 2 == 0){
      b.add(el);
    }
  }
  print(b);
  
}
