clear  
N = 10^6
rand('state',100);
randn('state',200); 

ip = rand(1,N)>0.5;
s = 2*ip-1;
n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; 
Eb_N0_dB = [-3:10];  
for ii = 1:length(Eb_N0_dB)  

y = s + 10^(-Eb_N0_dB(ii)/20)*n; 

ipHat = real(y)>0;  

nErr(ii) = size(find([ip- ipHat]),2);  
end  
simBer = nErr/N; 
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10)));

close all  
figure  
semilogy(Eb_N0_dB,theoryBer,'b.-');  
hold on  
semilogy(Eb_N0_dB,simBer,'mx-');
axis([-3 10 10^-5 0.5])  
grid on  
legend('theory', 'simulation');  
xlabel('Eb/No, dB');  
ylabel('Bit Error Rate');  
title('Bit error probability curve for BPSK modulation'); 