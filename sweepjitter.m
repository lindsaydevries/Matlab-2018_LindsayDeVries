%% Calculates difference between two sets of PTC sweeps %%
% Created by LAD on 2/5/2018 %

subjlist = {'S22', 'S29' 'S42', 'S43', 'S46', 'S47','S53', 'S54', 'S55', 'S56', 'S57'};
probech = 2:15;
nprobe = length(probech);
meandiffvec=zeros(1,14);
alldiff=zeros(2,6);

BASEDIR = '/Users/lindsayadevries/Desktop/PhD /Dissertation/Data/SweepAnalysisSets';
xlsfile = '/Users/lindsayadevries/Desktop/PhD /Dissertation/Data/AllPTCs_MASTER.xlsx';


for isubj = 11%1:length(subjlist)
    SUBJDIR = [BASEDIR  '/' subjlist{isubj}];
    cd (SUBJDIR);
    maskervalues = [SUBJDIR '/' subjlist{isubj} '-PTC-2_A.mat']; % take one file to get masker thresholds and MCLs
    
    load(maskervalues);
    
    maskerthr = 20*log10(ptcstruct.maininfo.chanSettings.threshold(probech)); %% from threshold sweeps
    maskermcl = 20*log10(ptcstruct.maininfo.chanSettings.mcl(probech));
    
    xlwrite(xlsfile,maskerthr',subjlist{isubj},'E9:E22'); %% writes into Excel - only need to run once
    xlwrite(xlsfile,maskermcl',subjlist{isubj},'F9:F22'); %% writes into Excel - only need to run once
    
    clear ptcstruct
    
    for ichan = 1:nprobe
        
        PTCFILE_SET_A = [SUBJDIR '/' subjlist{isubj} '-PTC-' num2str(probech(ichan)) '_A.mat'];
        PTCFILE_SET_B = [SUBJDIR '/' subjlist{isubj} '-PTC-' num2str(probech(ichan)) '_B.mat'];
        
        load(PTCFILE_SET_A);
        ptcstruct_A=ptcstruct;
        
        load(PTCFILE_SET_B);
        ptcstruct_B=ptcstruct;
        
        maskerdr = maskermcl - maskerthr; %% same for both sets
        
        xlwrite(xlsfile,maskerdr',subjlist{isubj},'G9:G22'); %% writes into Excel - only need to run once
        
        %% Forward masked thresholds in masker DR for SET A %%
        
        fwdmaskerthrA = ptcstruct_A.sweepthr(2,:); %% sweeps
        thresdrA = fwdmaskerthrA-maskerthr; %% same for both sets
        
        ptcdrA = thresdrA./maskerdr; %% PTCs in masker dynamic range
        ptcdrA(ptcdrA>1)=1;
        
        %% Forward masked thresholds in masker DR for SET B %%
        
        fwdmaskerthrB = ptcstruct_B.sweepthr(2,:); %% sweeps
        thresdrB = fwdmaskerthrB-maskerthr; %% same for both sets
        
        ptcdrB = thresdrB./maskerdr; %% PTCs in masker dynamic range
        ptcdrB(ptcdrB>1)=1;
        
        [ ptcthresholds ] = writeptcs( fwdmaskerthrA, fwdmaskerthrB, ptcdrA, ptcdrB, ichan, isubj, subjlist ); 
        
        %% Absolute Difference between Sets A and B %%
        
        ptcdiff=abs(ptcdrB-ptcdrA);
        meanidx=find(ptcdiff>0);
        
        if isempty(ptcdiff(meanidx))
            diffmean= 0;
        else
            diffmean=mean(ptcdiff(meanidx));
        end
        
        meandiffvec(ichan)=diffmean;
    end
    
    totalptcdiff=mean(meandiffvec)*100; %% PTC jitter in percent dynamic range
        
    alldiff(1,isubj)=isubj;
    alldiff(2, isubj)=totalptcdiff;  

end