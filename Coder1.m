%универсальный кодер сигнала
fstd=std(finp);
fmax=max(finp);
fmean=mean(finp);
%fh=hist(finp,x);
fv=var(finp)/10;
fm=median(finp);
%fout=[finp; fstd; fmean; fmax./fstd; fv; fm; fh];
fout=[finp; fstd;  fmax./fstd; fv./fstd; fm./fstd];