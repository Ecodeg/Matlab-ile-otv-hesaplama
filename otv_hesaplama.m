price=input('Please Enter Price: ');

%current system calculation part
if price<120000
    price0=price*45/100;
    otvRate=45;
elseif (120000<=price) && (price<150000)
    price0=price*50/100;
    otvRate=50;
elseif (150000<=price) && (price<175000)
    price0=price*60/100;
    otvRate=60;
elseif (175000<=price) && (price<200000)
    price0=price*70/100;
    otvRate=70;
else
    price0=price*80/100;
    otvRate=80;
end
%price0=ÖTV (TL)
otvBaseAndOTV1=price+price0; %Ötv Base + Ötv (TL)
kdv1=otvBaseAndOTV1*18/100; %KDV (TL)
totalTax1=price0+kdv1; %Total Tax
salePrice1=price+totalTax1; %Sale Price (TL)

%gradual system calculation part

price1=0;%gradual system price
price2=0;%gradual system price
price3=0;%gradual system price
price4=0;%gradual system price
price5=0;%gradual system price

if price<120000
    price1=price*45/100;
end
if price>120000
    price1=120000*45/100;
end
if (120000<=price) && (price<150000)
    price2=(price-120000)*50/100;
end
if price>150000
    price2=30000*50/100;
end
if (150000<=price) && (price<175000)
    price3=(price-150000)*60/100;
end
if price>175000
    price3=25000*60/100;
end
if (175000<=price) && (price<200000)
    price4=(price-175000)*70/100;
end
if price>200000
    price4=25000*70/100;
end
if price==200000
    price5=200000*80/100;
end
if price>200000
    price5=(price-200000)*80/100;
end
gradualTotal=price1+price2+price3+price4+price5; %ÖTV (TL)
otvBaseAndOTV2=price+gradualTotal; %Ötv Base + Ötv (TL)
kdv2=otvBaseAndOTV2*18/100; %KDV (TL)
totalTax2=gradualTotal+kdv2; %Total Tax (TL)
salePrice2=price+totalTax2; %Sale Price (TL)

%difference calculation part
differenceOtv=price0-gradualTotal; %ÖTV (TL) difference
differenceOtvBaseAndOtv=otvBaseAndOTV1-otvBaseAndOTV2; %ÖTV Base + ÖTV (TL) difference
differenceKdv=kdv1-kdv2; %KDV (TL) difference
differenceTotalTax=totalTax1-totalTax2; %Total Tax (TL) difference
differenceSalePrice=salePrice1-salePrice2; %Sale Price (TL) difference

a=' '; %for chart
b=0; %for chart 
c='-'; %for chart

%chart part
fprintf('%25sCurrent System %10sGradual System %10sDifference \n',a,a,a);
fprintf(' ÖTV Base (TL) %21.2f %24.2f %18d\n',price,price,b);
fprintf(' ÖTV Rate %22d %15c45,50,60,70 and 80 %13c\n',otvRate,a,c);
fprintf(' ÖTV (TL) %26.2f %24.2f %22.2f\n',price0,gradualTotal,differenceOtv);
fprintf(' ÖTV Base+ÖTV (TL) %17.2f %24.2f %22.2f\n',otvBaseAndOTV1,otvBaseAndOTV2,differenceOtvBaseAndOtv);
fprintf(' KDV (TL) %25.2f %24.2f %23.2f\n',kdv1,kdv2,differenceKdv);
fprintf(' Total Tax (TL) %20.2f %24.2f %22.2f\n',totalTax1,totalTax2,differenceTotalTax);
fprintf(' Sale Price (TL) %19.2f %24.2f %22.2f\n',salePrice1,salePrice2,differenceSalePrice);