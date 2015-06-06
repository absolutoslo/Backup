###Excel formulas

####Nested IF formula example
```
=IF(AND(C2=3,B2>0),"OK",IF(AND(C2=2,B2=0),"OK","Not OK"))
```
####FIN REPORT
merchant ref
```
=VLOOKUP(IF(ISNUMBER(SEARCH("*-*",B2,10)),LEFT(B2,LEN(B2)-2),B2),Sheet1!B:C,2,FALSE)

Modifications lower - higher
=IF(F2>G2,"Exclude","Action me")
```
####VAN division
```
=IF(OR(O2>0.02,N2>0),"Action","No Action")
or
=IF(AND(L2>0,L2=M2,N2=""),"No action","Action")
```
####VAN arrival today - check if more than 1 email:
```
=LEN(checkme)-LEN(SUBSTITUTE(checkme,"@",""))
```

####Varie
```
=countif(B:B,B1)>1

=COUNTIF(A:A,A2)
```
###AB test VAN
```
=IF((I2-L2)<0.2,"good",IF(M2>0,"ok","bad"))

=ISNA(VLOOKUP(A2,outlook!F:F,1,0))
```
Date difference
```
=DAYS(F2,E2)
```

####If something then...
```
=IF(L2<>"",Q2,"not charged")

=IF(AND(OR(O2="ok",O2="good"),R2>1),"GOOD","BAD")
```