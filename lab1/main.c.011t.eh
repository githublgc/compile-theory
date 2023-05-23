
;; Function main (main, funcdef_no=0, decl_uid=2313, cgraph_uid=1, symbol_order=0)

main ()
{
  int b;
  int a;
  int D.2318;

  scanf ("%d%d", &a, &b);
  a.0_1 = a;
  b.1_2 = b;
  _3 = a.0_1 + b.1_2;
  printf ("Hello World %d\n", _3);
  D.2318 = 0;
  goto <D.2320>;
  <D.2320>:
  a = {CLOBBER};
  b = {CLOBBER};
  goto <D.2319>;
  D.2318 = 0;
  goto <D.2319>;
  <D.2319>:
  return D.2318;
}


