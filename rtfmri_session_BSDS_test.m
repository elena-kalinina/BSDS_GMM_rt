%% Preparatory part

clear all
clear classes
cfg=[];
cfg.shared_folder='Y:\'; 
 % '%sSEDU_7_tc_phantom.mat', '%sCARV_3_tc_phantom.mat'
disk='C:\Users\tbv\Desktop\BSDS\';

%%%CHANGE
accessN='Sog3'; 

%% PATHS
addpath('C:\EXPERIMENTS\Elena\fieldtrip-20150318');
addpath('C:\EXPERIMENTS\Elena\full_session_020817');
addpath('C:\EXPERIMENTS\Elena\spm8');
addpath(genpath('C:\Experiments\Elena\asfV52\'));
addpath('Y:\');
%addpath('C:\Users\eust_abbondanza\Documents\MATLAB\GMM\GMM-incremental-v2.0');

savepath 

%% Localizer

session=1;
cfg.inputDir=sprintf('Z:\\%s\\Ser%04d', accessN, session) %'C:\Documents\RealTime\201509301130\Ser0001'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
cfg.output=sprintf('%s%s\\', disk, accessN); %'C:\Documents\RealTime\20150930MCBL\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
cfg.dataPath=sprintf('%s%s\\', disk, accessN);
%%%%%%%%%%%%% general session options
cfg.NrOfVols1=230; %Only for localizer
cfg.TimeOut=15.0;
cfg.TR=2;
cfg.numDummy=5;
cfg.realtime_on=1;
%%%%%%%%%%%% preprocessing options
cfg.smoothFWHM = 0;
cfg.correctMotion = 1;
cfg.normalize2MNI = 0;
cfg.correctSliceTime = 1;
%%%%%%%%%%%
%General processing routine
poll_for_data_preproc_bsds(accessN, session, cfg);

%% MASK

%1. Calculate mean image --> datapath
%2. Normalize estimate & write
%3. contrasts a2z spm_contrasts
%4. Visualize with masks & save clusters --> datapath

%cfg=[];
% cfg.maskpath=sprintf('%s%s\\', disk, accessN);
% cfg.maskname='FFA_face.hdr'; % 'PPA_house.hdr'
% %'newFFA.hdr'; %'newPPA.hdr';
% %cfg.output='J:\RealTime\VisSearch\20151125SSGO\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
% cfg.dataPath=sprintf('%s%s\\', disk, accessN);%
% cfg.protocolpath=cfg.shared_folder;
% cfg.numDummy=5;
accessN='Sog2';
addpath(genpath('C:\Experiments\Elena\asfV52\'));
cfg.protocolpath=cfg.shared_folder;
create_spm_design_loc(accessN, 1, cfg);
%% CONTROL RUN Faces, Houses
%2, 4, 6
session=6; 

%%%%%%%%%%% paths 1st Run rakes from input run 1 puts into data path run 1

cfg.inputDir=sprintf('Z:\\%s\\Ser%04d', accessN, session) %'C:\Documents\RealTime\201509301130\Ser0001'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
cfg.output=sprintf('%s%s\\', disk, accessN); %'C:\Documents\RealTime\20150930MCBL\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
cfg.dataPath=sprintf('%s%s\\', disk, accessN); %DISK C:\ ETC THIS ONE SHOULD HAVE RUNS IN IT !!! where the classifier takes them to be trained
%%%%%%%%%%%%% general session options
cfg.realtime_on=1;
cfg.max_delay=5;
cfg.NrOfVols1=230;
cfg.NrOfVols=220;
cfg.breakPoint=round(cfg.NrOfVols/2);
cfg.TimeOut=15.0;
cfg.TR=2;
cfg.numDummy=5;
cfg.blockDur=10;
cfg.nbStates=3;
%cfg.nbVar=1;
cfg.mytemplate='C:\EXPERIMENTS\Elena\spm8\templates\EPI.nii';
cfg.matname=sprintf('%s%s\\mean_sn.mat', disk, accessN); % %fullfile(cfg.dataPath, 'mean_sn.mat');
cfg.ref_image=sprintf('%s%s\\mean.hdr', disk, accessN); %fullfile(cfg.dataPath, 'mean.hdr');
%%%%%%%%%%%% preprocessing options
cfg.smoothFWHM = 0;
cfg.correctMotion = 1;
cfg.normalize2MNI = 1;
cfg.correctSliceTime = 1;

poll_for_data_preproc_bsds(accessN, session, cfg);

%% Prepare models
clear MM
session=2;
%2, 4, 6
%cfg.tc_file=sprintf('%sPSC_F_%d.mat', cfg.dataPath, session);
%cfg.tc_file_phantom=sprintf('%s%s_%d_tc_phantom.mat', cfg.shared_folder,accessN, session);
%cfg.roi=    {'newFFA_FH.hdr', 'newPPA_HF.hdr'};
cfg.roi=    {'newFFA.hdr', 'newPPA.hdr'};
cfg.tc_file=sprintf('%s%s_%d_tc.mat', cfg.shared_folder,accessN, session);
prepare_tcs(accessN, session-1, cfg);
%%  Real-time run, Faces, Houses
%3,5, 7
session=7; 

%cfg.roi=    {'newFFA_FH.hdr', 'newPPA_HF.hdr'};
cfg.roi=    {'newFFA.hdr', 'newPPA.hdr'};

%%%%%%%%%%% paths 1st Run rakes from input run 1 puts into data path run 1
cfg.inputDir=sprintf('Z:\\%s\\Ser%04d', accessN, session) %'C:\Documents\RealTime\201509301130\Ser0001'; %'C:\Documents\RealTime\20150930MCBL\DiCo_1\'% % DISK Z:\
cfg.output=sprintf('%s%s\\', disk, accessN); %'C:\Documents\RealTime\20150930MCBL\'; %DISK C:\ NO RUN FOLDERS, THIS IS WHERE HISTORY AND PREDICTIONS ARE SAVED
cfg.dataPath=sprintf('%s%s\\', disk, accessN);% DISK C:\ ETC THIS ONE SHOULD HAVE RUNS IN IT !!! where the classifier takes them to be trained
%%%%%%%%%%%%% general session options
cfg.realtime_on=1;
cfg.max_delay=5;
cfg.NrOfVols1=230;
cfg.NrOfVols=220;
cfg.breakPoint=round(cfg.NrOfVols/2);
cfg.TimeOut=60.0;
cfg.TR=2;
cfg.numDummy=5;
cfg.blockDur=10;
cfg.nbStates=3;
%cfg.nbVar=1;
cfg.mytemplate='C:\EXPERIMENTS\Elena\spm8\templates\EPI.nii';
cfg.matname=sprintf('%s%s\\mean_sn.mat', disk, accessN); % %fullfile(cfg.dataPath, 'mean_sn.mat');
cfg.ref_image=sprintf('%s%s\\mean.hdr', disk, accessN);%fullfile(cfg.dataPath, 'mean.hdr');
%%%%%%%%%%%% preprocessing options
cfg.smoothFWHM = 0;
cfg.correctMotion = 1;
cfg.normalize2MNI = 1;
cfg.correctSliceTime = 1;
%%%%%%%%%%%
poll_for_data_preproc_GMM2(accessN, session, cfg);
%poll_for_data_preproc_GMM_Phantom(accessN, session, cfg);



