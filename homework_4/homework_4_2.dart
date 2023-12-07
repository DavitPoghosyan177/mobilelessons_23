List take_number(oldlist){
  final List<int> newlist = [];
  newlist.add(oldlist[0]);
  newlist.add(oldlist[oldlist.length-1]);

  return newlist;
}
void main(){
  final List<int> myList = [5 , 10 , 15 , 20 , 25];
  print(take_number(myList));  
}
