%% Preparatory part

clear all

clear classes
SubjID='SEDU';
cfg=[];
cfg.shared_folder='Y:\'; 
 % '%sSEDU_7_tc_phantom.mat', '%sCARV_3_tc_phantom.mat'
disk='C:\Users\tbv\Desktop\BSDS\';
accessN='P_20170731_RT'; 
subjectCode='20170731SEDU'; 
%%%%%%%%%%% paths 1st Run rakes from input run 1 puts into data path run 1

%% PATHS
addpath('C:\EXPERIMENTS\Elena\fieldtrip-20150318');
addpath('C:\EXPERIMENTS\Elena\full_session_310717');
addpath('C:\EXPERIMENTS\Elena\spm8');
addpath('Y:\')
%addpath('C:\Users\eust_abbondanza\Documents\MATLAB\GMM\GMM-incremental-v2.0');

savepath 

%% Localizer
session=1;
sesN=session;
cfg.inputDir=sprintf('Z:\\%s\\Ser%04d', accessN, session) %'C:\Documents\RealTime\201509301130\Ser0001'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
cfg.output=sprintf('%s%s\\', disk, subjectCode); %'C:\Documents\RealTime\20150930MCBL\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
cfg.dataPath=sprintf('%s%s\\', disk, subjectCode);

% cfg.inputDir='C:\Users\tbv\Desktop\BSDS\SEDU\Localizer';  %Real-time directory
% cfg.output='C:\Users\tbv\Desktop\BSDS\SEDU\'; %Where preprocessed files and other files (masks, transformation matrices ets)go
% cfg.dataPath='C:\Users\tbv\Desktop\BSDS\SEDU\Localizer';% Where files for subsequent processing will be taken from
%%%%%%%%%%%%% general session options
cfg.NrOfVols1=230; %Only for localizer
cfg.NrOfVols=215;
cfg.TimeOut=15.0;
cfg.TR=2;
cfg.numDummy=5;
cfg.realtime_on=0;
%%%%%%%%%%%% preprocessing options
cfg.smoothFWHM = 0;
cfg.correctMotion = 1;
cfg.normalize2MNI = 0;
cfg.correctSliceTime = 1;
%%%%%%%%%%%
%General processing routine
%poll_for_data_preproc_bsds(SubjID, 1, cfg);


%% CONTROL RUN Faces, Houses
%1, 2, 5, 6
session=2;
sesN=session;
cfg.inputDir=sprintf('Z:\\%s\\Ser%04d', accessN, session); %'C:\Documents\RealTime\201509301130\Ser0001'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
cfg.output=sprintf('%s%s\\', disk, subjectCode); %'C:\Documents\RealTime\20150930MCBL\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
cfg.dataPath=sprintf('%s%s\\', disk, subjectCode);
%SubjID='SEDU';
if mod(sesN, 2)==0
cfg.roi= {'PPA_house.hdr', 'FFA_face.hdr'};

else
 cfg.roi=    {'FFA_face.hdr', 'PPA_house.hdr'};
    
end%%cfg=[];
%%%%%%%%%%% paths 1st Run rakes from input run 1 puts into data path run 1
% cfg.inputDir=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\Ser%04d', SubjID, sesN);  %VisSearch\201511251750\Ser0001\'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
% cfg.output=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\', SubjID); %'J:\RealTime\VisSearch\20151125SSGO\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
% cfg.dataPath=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\', SubjID);% DISK C:\ ETC THIS ONE SHOULD HAVE RUNS IN IT !!! where the classifier takes them to be trained
%%%%%%%%%%%%% general session options
cfg.realtime_on=0;
cfg.max_delay=4;
cfg.NrOfVols1=230;
cfg.NrOfVols=215;
cfg.breakPoint=round(cfg.NrOfVols/2);
cfg.TimeOut=15.0;
cfg.TR=2;
cfg.numDummy=5;
cfg.blockDur=10;
cfg.nbStates=3;
%cfg.nbVar=1;
cfg.mytemplate='C:\Users\eust_abbondanza\Documents\MATLAB\spm8\templates\EPI.nii';
cfg.matname=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\Localizer\\mean_sn.mat', SubjID); % %fullfile(cfg.dataPath, 'mean_sn.mat');
cfg.ref_image=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\Localizer\\mean.hdr', SubjID); %fullfile(cfg.dataPath, 'mean.hdr');
%%%%%%%%%%%% preprocessing options
cfg.smoothFWHM = 0;
cfg.correctMotion = 1;
cfg.normalize2MNI = 0;
cfg.correctSliceTime = 1;
if mod(sesN, 2)==0
cfg.tc_file=sprintf('%sPSC_H_%d.mat', cfg.dataPath, sesN);
else
    cfg.tc_file=sprintf('%sPSC_F_%d.mat', cfg.dataPath, sesN);
end
%%%%%%%%%%%
%poll_for_data_preproc_bsds(SubjID, sesN, cfg);


%%  Real-time run, Faces, Houses
%3,4,7,8
session=1;
sesN=session;
cfg.inputDir=sprintf('Z:\\%s\\Ser%04d', accessN, session); %'C:\Documents\RealTime\201509301130\Ser0001'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
cfg.output=sprintf('%s%s\\', disk, subjectCode); %'C:\Documents\RealTime\20150930MCBL\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
cfg.dataPath=sprintf('%s%s\\', disk, subjectCode);

cfg.tc_file_phantom=sprintf('%s%s_%d_tc_phantom.mat', cfg.shared_folder,SubjID, sesN);
cfg.tc_file=sprintf('%s%s_%d_tc.mat', cfg.shared_folder,SubjID, sesN);
%SubjID='SEDU';
if mod(sesN, 2)==0
cfg.roi= {'PPA_house.hdr', 'FFA_face.hdr'};  
%cfg.tc_file=sprintf('%sPSC_H_%d.mat', cfg.dataPath, sesN-2);
else
 cfg.roi= {'FFA_face.hdr', 'PPA_house.hdr'}; 
%    cfg.tc_file=sprintf('%sPSC_F_%d.mat', cfg.dataPath, sesN-2);
end%%cfg=[];
%%%%%%%%%%% paths 1st Run rakes from input run 1 puts into data path run 1
% cfg.inputDir=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\Ser%04d', SubjID, sesN);  %VisSearch\201511251750\Ser0001\'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
% cfg.output=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\', SubjID); %'J:\RealTime\VisSearch\20151125SSGO\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
% cfg.dataPath=sprintf('C:\\Users\\tbv\\Desktop\\BSDS\\%s\\', SubjID);% DISK C:\ ETC THIS ONE SHOULD HAVE RUNS IN IT !!! where the classifier takes them to be trained
%%%%%%%%%%%%% general session options
cfg.realtime_on=0;
cfg.max_delay=5;
cfg.NrOfVols1=230;
cfg.NrOfVols=215;
cfg.breakPoint=round(cfg.NrOfVols/2);
cfg.TimeOut=15.0;
cfg.TR=2;
cfg.numDummy=5;
cfg.blockDur=10;
cfg.nbStates=3;
%cfg.nbVar=1;
cfg.mytemplate='C:\Users\eust_abbondanza\Documents\MATLAB\spm8\templates\EPI.nii';
cfg.matname=sprintf('J:\\RealTime\\BSDS\\%s\\Localizer\\mean_sn.mat', SubjID); % %fullfile(cfg.dataPath, 'mean_sn.mat');
cfg.ref_image=sprintf('J:\\RealTime\\BSDS\\%s\\Localizer\\mean.hdr', SubjID); %fullfile(cfg.dataPath, 'mean.hdr');
%%%%%%%%%%%% preprocessing options
cfg.smoothFWHM = 0;
cfg.correctMotion = 1;
cfg.normalize2MNI = 0;
cfg.correctSliceTime = 1;
%%%%%%%%%%%
%poll_for_data_preproc_GMM2(SubjID, sesN, cfg);
poll_for_data_preproc_GMM_Phantom(SubjID, sesN, cfg);



