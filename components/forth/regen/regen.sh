./makeccalls <../extend.c >tccalls.fth
./forth forth.dic tccalls.fth app.fth
./makebi app.dic
cp *.h ..
rm *.h

