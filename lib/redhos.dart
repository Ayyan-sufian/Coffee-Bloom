void main() {
  var x = [9, 2, 5, 3, 7];
  // // var y = [1, 2, 3];
  // var a = 0;
  // var b = 0;
  // var b = 0;
  var z = [];

  for (int n = 0; n < x.length; n++) {
    for (int i = x.length - 1; i >= 0; i--) {
      if (n == i) {
        break;
      }
      if (x[n] < x[i]) {
        z.add(x[n]);
        break;
      }
    }
  }
  print(z);


  // for (int n = 0; n < x.length; n++) {
  //   for (int i = x.length - 1; i >= 0; i--) {
  //     if (n == i) {
  //       break;
  //     }
  //     if (x[n] > x[i]) {
  //      b = x[n];
  //     }else if (x[i] > x[n]) {
  //       a = x[n];
  //     }
  //   }
  // }
  // print("Maximum element is : $b");
  // print("Minimum element is : $a");



  // for (int n = 0; n < x.length; n++) {
  //   for (int i = x.length - 1; i >= 0; i--) {
  //     if (n == i) {
  //       break;
  //     }
  //     if (x[i] == x[n]) {
  //       a = a + 1;
  //       x[n + 1]= x[n] -1;
  //     }
  //   }
  //   if(x[n] != 0)
  //   print("${x[n]} occurs $a times");
  //   a = 1;
  // }
  //


  // for (int i = x.length - 1; i >= 0; i--) {
  //   a = x[i];
  //   z.add(a);
  //   b = y[i];
  //   z.add(b);
  // }
  // print(z);

  // var x = [3, 2, 2, 8, 2];
  //
  // for (int n = 0; n < x.length; n++) {
  //   for (int i = x.length - 1; i >= 0; i--) {
  //     if (n == i) {
  //       break;
  //     }
  //
  //     if (x[i] != x[n]) {
  //       print(x[n]);
  //     }
  //     break;
  //   }
  // }

  // int a = 0;
  //
  // for (int n = 0; n < x.length; n++) {
  //   for (int i = x.length - 1; i >= 0; i--) {
  //     if(n == i){
  //       break;
  //     }
  //     if(x[i] == x[n]){
  //       a = a + 1;
  //
  //     }
  //
  //   }
  //
  // }
  // print(a);

  //
  // int s = 0;
  //
  // for (int n = 0; n < x.length; n++) {
  //   // print(n);
  //
  //  //s = x[0] + x[1] + x[2]+ x[3];
  //
  //   s = s + x[n];
  //
  // }
  // print(s);

  //   for (int i = x.length - 1; i >= 0; i--) {
  // print(x[i]);
  //
  //
  //
  //
  //   // print(y);
  //   }
}
