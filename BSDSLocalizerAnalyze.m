function BSDSLocalizerAnalyze(cfg)
%Cfg.TargetDir = 'D:\Eustachia\MATLAB\asfV48\asf\documentation\ASFdemos\memory\'
cfg.TargetDir = 'C:\Users\GSR-Experiment\Documents\MATLAB\illu_elena\PPA_FFA_Localizer';

cfg.skipVolumes = 2;
cfg.TRms = 2000;
cfg.stimDur = 6000;
cfg.ResolutionOfTime = 'volumes'; %'msec' or 'volumes'
cfg.nRuns=1;
cfg.NofRTs=4;
cfg.EXPID='OSCL';
cfg.subjID = {'CARV', 'SEDU'};

for iSubj=1:length(cfg.subjID)
    
    searchStr = [cfg.TargetDir, cfg.subjID{iSubj}, '-', '*'];
    d = dir(searchStr);
    nRuns = 1; %size(d, 1);
    
    for idxRuns = 1:cfg.nRuns
        subjectrunID = sprintf ('%s-%d', cfg.subjID{iSubj}, idxRuns);%('%s-%02d', cfg.SUBID, idxRuns) %('%s_%s_%02d', cfg.EXPID, cfg.SUBID, idxRuns)
        
        fname = [subjectrunID, '.mat'];
        load(fname);
        
        %GET TIMINGS
        res = ASF_readExpInfo(ExpInfo);
        
        code = res(:, 1);
        
        faccombination = ASF_decode(code, ExpInfo.factorinfo.factorLevels);
        labels=(faccombination(:, 2));
        if idxRuns==1
        scrambled=find(labels>0 & mod(labels, 2)==1);
        intact=find(labels>0 & mod(labels, 2)==0);
                
        else
        scrambled=find(labels>0 & mod(labels, 2)==0);
        intact=find(labels>0 & mod(labels, 2)==1);    
        end
        
        labels(scrambled)=1;
        labels(intact)=2;
        
        
        switch cfg.ResolutionOfTime
            case 'msec'
                tOn = round(ASF_getTrialOnsetTimes(ExpInfo)*1000);
            case 'volumes'
                tOn = round(ASF_getTrialOnsetTimes(ExpInfo)*1000);
                %tOn = tOn - cfg.skipVolumes*cfg.TRms;
                tOn = round(tOn/cfg.TRms);
        end
        
        
        blocks=find(labels>0);
        labels=labels(blocks);
        tOn=tOn(blocks);
        RTs=[];
        
        allRTs=[];
        for t = 1:length(blocks)
            trial=blocks(t);
            %                 if ExpInfo.TrialInfo(trial).Response.key==3
            %RTs=[ExpInfo.TrialInfo(trial).Response.RT/1000 + (ExpInfo.TrialInfo(trial).tStart - 1) ExpInfo.TrialInfo(trial).Response.key];
         %   RTs=[ExpInfo.TrialInfo(trial).Response.RT/1000 + ExpInfo.TrialInfo(trial).tStart ExpInfo.TrialInfo(trial).Response.key];
            RTs=[ExpInfo.TrialInfo(trial).Response.RT/1000 + ExpInfo.TrialInfo(trial).tStart]';
            RTs=sort(RTs);
           % trialRTs=find(RTs(:, 2)==3);
          %  RTs=RTs(trialRTs, 1)';
          if isempty(RTs)
               RTs=zeros(1, cfg.NofRTs);
           end
            if length(RTs')<cfg.NofRTs
                RTs(end, cfg.NofRTs)=0;
            end
            allRTs=[allRTs; RTs];
            
            
        end
        
        %end
        
        protocol =  horzcat(tOn, labels, allRTs);%horzcat(tOn, labels, RTs);
        
        
        %filename=fullfile(cfg.TargetDir, sprintf('%s-%s-r%02d', cfg.EXPID, cfg.SUBID, idxRuns));
        filename=sprintf ('%s-r%d.txt', cfg.subjID{iSubj}, idxRuns);
        save(filename, 'protocol', '-ascii')
        
               
        % type(filename)
    end
end