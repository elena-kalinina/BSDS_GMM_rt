function prepare_tcs_phantom(SubjID, sesN, cfg)
phantom_file=sprintf('%s%s_%d_tc_phantom.mat', cfg.shared_folder,SubjID, sesN);
tc_file=sprintf('%s%s_%d_tc.mat', cfg.shared_folder,SubjID, sesN);
%Load protocol and take delay periods only !!!!!!!!!!!!!
if mod(sesN, 2)==0
cfg.roi= {'PPA_house.hdr', 'FFA_face.hdr'};  
%cfg.tc_file=sprintf('%sPSC_H_%d.mat', cfg.dataPath, sesN-2);
else
 cfg.roi= {'FFA_face.hdr', 'PPA_house.hdr'}; 
%    cfg.tc_file=sprintf('%sPSC_F_%d.mat', cfg.dataPath, sesN-2);
end
mask1=spm_vol(sprintf('%s%s', cfg.dataPath, cfg.roi{1}));
maskvol1=spm_read_vols(mask1);

mask2=spm_vol(sprintf('%s%s', cfg.dataPath, cfg.roi{2}));
maskvol2=spm_read_vols(mask2);

for vol=1:cfg.NrOfVols
    
    
        volume_file=spm_vol(sprintf('%sSer%04d\\wprepScan_%d.nii', cfg.dataPath, sesN, vol));
        datavol=spm_read_vols(volume_file);
        
        myvol1=datavol(maskvol1>0);
        myvol2=datavol(maskvol2>0);
        
        tc(vol)=((mean(myvol1)-mean(myvol2))/mean(myvol2))*100;
       
   
end
save(tc_file, 'tc');
[MM(1).Priors, MM(1).Mu, MM(1).Sigma, cluster_init] = EM_init_kmeans_upd(tc, cfg.nbStates);
[MM(1).Priors, MM(1).Mu, MM(1).Sigma, MM(1).Pix] = EM_boundingCov_upd(...
    tc, MM(1).Priors, MM(1).Mu, MM(1).Sigma);

save(phantom_file, 'MM');