//Fibonacci with recursion
int fib_seq(int n) {
  if (n <= 1) {
    return n;
  }
  return fib_seq(n - 1) + fib_seq(n - 2);
}
void main() {
  for (int i = 1; i <= 10; i++) {
    print(fib_seq(i));
  }
}

/*
void main() {
  int cnt = 10;
  int f1 = 1;
  int f2 = 1;
  
  for (int i = 1; i <= cnt; i++) {
    print(f1);
    int f3 = f1 + f2;
    f1 = f2;
    f2 = f3;
  }
}
*/
