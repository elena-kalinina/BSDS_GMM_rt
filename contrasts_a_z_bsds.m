%% Paths

cfg.shared_folder='Y:\'; 
 % '%sSEDU_7_tc_phantom.mat', '%sCARV_3_tc_phantom.mat'
disk='C:\Users\tbv\Desktop\BSDS\';

%%%CHANGE
accessN='Sog2'; 


cfg.dataPath=sprintf('%s%s\\', disk, accessN) %'J:\RealTime\BSDS\SEDU\';
cfg.dataPathSPM=sprintf('%s%s\\Ser0001\', disk, accessN); %'J:\RealTime\BSDS\SEDU\Localizer\'; %'J:\RealTime\VisSearch\201511251750\'; non-preprocessed
cfg.protocolpath=cfg.shared_folder; %'J:\RealTime\BSDS\';
cfg.maskPath=sprintf('%s%s\\', disk, accessN); %'J:\RealTime\BSDS\';
cfg.output=sprintf('%s%s\\', disk, accessN); %'J:\RealTime\BSDS\SEDU\';
%cfg.mask_name='FFA_L.nii'; %'FFA_R.nii', 'PPA_L.nii', 'PPA_R.nii'
%cfg.maskThreshold=0.01;
%cfg.SubjID='SEDU';
cfg.NrOfVols=225;
clear matlabbatch
clear matlabbatch1
clear matlabbatch2

%% 

%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.fmri_spec.dir = {cfg.dataPath}; %{'J:\RealTime\20150930CARV\'};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'scans';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 1;
%%
% matlabbatch{1}.spm.stats.fmri_spec.sess.scans = {
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_1.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_10.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_100.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_101.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_102.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_103.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_104.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_105.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_106.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_107.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_108.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_109.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_11.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_110.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_111.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_112.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_113.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_114.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_115.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_116.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_117.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_118.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_119.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_12.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_120.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_121.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_122.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_123.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_124.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_125.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_126.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_127.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_128.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_129.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_13.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_130.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_131.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_132.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_133.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_134.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_135.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_136.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_137.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_138.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_139.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_14.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_140.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_141.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_142.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_143.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_144.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_145.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_146.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_147.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_148.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_149.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_15.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_150.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_151.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_152.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_153.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_154.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_155.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_156.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_157.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_158.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_159.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_16.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_160.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_161.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_162.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_163.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_164.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_165.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_166.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_167.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_168.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_169.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_17.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_170.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_171.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_172.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_173.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_174.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_175.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_176.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_177.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_178.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_179.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_18.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_180.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_181.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_182.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_183.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_184.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_185.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_186.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_187.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_188.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_189.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_19.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_190.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_191.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_192.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_193.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_194.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_195.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_196.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_197.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_198.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_199.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_2.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_20.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_200.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_201.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_202.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_203.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_204.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_205.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_206.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_207.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_208.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_209.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_21.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_210.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_211.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_212.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_213.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_214.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_215.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_216.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_217.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_218.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_219.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_22.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_220.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_221.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_222.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_223.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_224.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_225.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_226.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_227.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_228.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_229.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_23.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_230.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_231.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_232.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_233.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_234.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_235.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_236.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_237.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_238.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_239.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_24.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_240.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_241.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_242.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_243.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_244.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_245.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_246.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_247.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_248.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_249.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_25.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_250.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_251.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_252.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_253.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_254.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_255.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_256.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_257.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_258.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_259.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_26.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_260.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_261.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_262.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_263.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_264.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_265.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_266.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_267.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_268.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_269.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_27.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_270.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_271.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_272.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_273.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_274.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_275.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_276.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_277.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_278.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_279.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_28.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_280.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_281.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_282.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_283.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_284.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_285.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_286.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_287.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_288.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_289.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_29.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_290.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_291.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_292.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_293.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_294.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_295.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_296.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_297.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_298.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_299.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_3.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_30.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_300.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_31.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_32.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_33.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_34.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_35.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_36.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_37.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_38.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_39.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_4.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_40.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_41.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_42.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_43.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_44.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_45.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_46.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_47.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_48.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_49.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_5.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_50.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_51.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_52.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_53.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_54.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_55.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_56.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_57.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_58.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_59.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_6.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_60.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_61.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_62.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_63.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_64.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_65.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_66.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_67.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_68.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_69.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_7.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_70.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_71.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_72.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_73.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_74.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_75.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_76.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_77.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_78.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_79.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_8.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_80.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_81.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_82.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_83.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_84.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_85.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_86.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_87.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_88.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_89.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_9.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_90.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_91.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_92.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_93.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_94.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_95.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_96.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_97.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_98.nii,1'
%                                                  'J:\RealTime\20150930CARV\Ser0001\prepScan_99.nii,1'
%                                                  };

for i = 1:cfg.NrOfVols
    matlabbatch{1}.spm.stats.fmri_spec.sess.scans{i}= sprintf('%swprepScan_%d.nii,1', cfg.dataPathSPM, i);
   % ffname=sprintf('%swrAnalyze%05d.img,1', cfg.dataPathSPM, i);
   % matlabbatch{1}.spm.stats.fmri_spec.sess.scans{i}= ffname;
end
    

%%
%design uncorrected onsets design1 corrected onsets
matlabbatch{1}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {sprintf('%sdesign_1_%s.mat', cfg.dataPath, accessN)}; %{'J:\RealTime\20150930CARV\design_1_CARV.mat'};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

%% 
spm_jobman('run', matlabbatch)

%% 
%clear matlabbatch
%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
matlabbatch1{1}.spm.stats.fmri_est.spmmat = {sprintf('%sSPM.mat', cfg.dataPath)};
matlabbatch1{1}.spm.stats.fmri_est.method.Classical = 1;

%% 
spm_jobman('run', matlabbatch1)

%% RUNS WITH SPM 5 !!!!!!!!!!!!

%rmpath('C:\EXPERIMENTS\Elena\spm8');
%addpath('C:\EXPERIMENTS\Elena\spm5');
spm('defaults', 'FMRI');
matlabbatch2{1}.spm.stats.con.spmmat = {sprintf('%sSPM.mat', cfg.dataPath)};
matlabbatch2{1}.spm.stats.con.consess{1}.tcon.name = 'facehouse';
matlabbatch2{1}.spm.stats.con.consess{1}.tcon.convec = [1 -1];
matlabbatch2{1}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch2{1}.spm.stats.con.consess{2}.tcon.name = 'houseface';
matlabbatch2{1}.spm.stats.con.consess{2}.tcon.convec = [-1 1];
matlabbatch2{1}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch2{1}.spm.stats.con.delete = 0;
%matlabbatch2{1}.spm.stats.con.delete = 1;

spm_jobman('run', matlabbatch2);

%So, we have to do it in MNI space !!! After that, view contrast with the mask INCLUSIVE and save all clusters
%!!!
%% 

rmpath('C:\EXPERIMENTS\Elena\spm5');
addpath('C:\EXPERIMENTS\Elena\spm8');