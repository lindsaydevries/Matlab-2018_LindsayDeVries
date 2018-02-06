function [ fwdmaskerthrA, fwdmaskerthrB, ptcdrA, ptcdrB ] = writeptcs(  ichan, isubj, subjlist )
% Populates Excel with PTC thresholds for each electrode
%   [ ptcthresholds ] = writeptcs( fwdmaskerthrA, fwdmaskerthrB, ptcdrA, ptcdrB )

if ichan==1
    xlwrite(xlsfile,fwdmaskerthrA,subjlist{isubj},'J9:J22');
    xlwrite(xlsfile,ptcdrA,subjlist{isubj},'K9:K22');
    xlwrite(xlsfile,fwdmaskerthrB,subjlist{isubj},'L9:L22');
    xlwrite(xlsfile,ptcdrB,subjlist{isubj},'M9:M22');
elseif ichan==2
    xlwrite(xlsfile,fwdmaskerthrA,subjlist{isubj},'N9:N22');
    xlwrite(xlsfile,ptcdrA,subjlist{isubj},'O9:O22');
    xlwrite(xlsfile,fwdmaskerthrB,subjlist{isubj},'P9:P22');
    xlwrite(xlsfile,ptcdrB,subjlist{isubj},'Q9:Q22');
    
end

end

