int main () {
  int x = 5, y = 15;
  int * p1, *p2;
		// value of	x	y	p1			p2
		//		5	15	uninit			uninit
  p1 = &x;
                //		5	15	(int *) 0x7fffffffdedc 	uninit
  p2 = &y;
                //              5       15      (int *) 0x7fffffffdedc  (int *) 0x7fffffffded8
  *p1 = 6;
                //		6	15	(int *) 0x7fffffffdedc  (int *) 0x7fffffffded8
  *p1 = *p2;
                //		15	15	(int *) 0x7fffffffdedc	(int *) 0x7fffffffded8
  p2 = p1;
                //		15	15	(int *) 0x7fffffffdedc	(int *) 0x7fffffffdedc
  *p1 = *p2+10;
                //		25	15	(int *) 0x7fffffffdedc  (int *) 0x7fffffffdedc
  return 0;
}
