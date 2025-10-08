close all
figure
stem(fft1.freq,fft1.mag/(Vdc*0.5),"filled",LineWidth=1,Marker="*",MarkerSize=1)
xlabel('f[Hz]')
ylabel('m')

saveas(gcf, ['fft1.png']);