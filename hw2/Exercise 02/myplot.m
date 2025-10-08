close all
figure
stem(fft1.freq,fft1.mag,"filled",LineWidth=1,Marker="*",MarkerSize=1)
xlabel('f[Hz]')
ylabel('u_{\alpha \beta}[p.u.]')

 saveas(gcf, ['fft1.2.png']);

figure
stem(fft2.freq,fft2.mag,"filled",LineWidth=1,Marker="*",MarkerSize=1)
xlabel('f[Hz]')
ylabel('u_{\alpha \beta}[p.u.]')
 saveas(gcf, ['fft2.1.png']);

figure
stem(fft3.freq,fft3.mag,"filled",LineWidth=1,Marker="*",MarkerSize=1)
xlabel('f[Hz]')
ylabel('u_{\alpha \beta}[p.u.]')
 saveas(gcf, ['fft3.1.png']);

%%
figure
hold on
stem(fft1.freq,fft1.mag,"filled",LineWidth=1,Marker="*",MarkerSize=1)

stem(fft4.freq,fft4.mag,"filled",LineWidth=1,Marker="*",MarkerSize=1)

    

legend('Natural sampling', 'Asymmetric regular sampling')
xlabel('f[Hz]')
ylabel('u_{\alpha \beta}[p.u.]')
saveas(gcf, ['fft4.1.png']);

