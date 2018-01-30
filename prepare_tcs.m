function prepare_tcs(SubjID, sesN, cfg)
protocol_file=sprintf('%s%s_%d.mat', cfg.shared_folder,SubjID, sesN);
load(protocol_file, 'p');
onsets=p.myonset./2;
durations=p.durations;
n_trials=length(onsets);
%Load protocol and take delay periods only !!!!!!!!!!!!!
mask1=spm_vol(sprintf('%s%s', cfg.dataPath, cfg.roi{1}));
maskvol1=spm_read_vols(mask1);

mask2=spm_vol(sprintf('%s%s', cfg.dataPath, cfg.roi{2}));
maskvol2=spm_read_vols(mask2);
vol_counter=1;
for trial=1:n_trials
    
    for vol = onsets(trial): onsets(trial)+durations(trial)
        volume_file=spm_vol(sprintf('%sSer%04d\\wprepScan_%d.nii', cfg.dataPath, sesN, vol));
        datavol=spm_read_vols(volume_file);
        
        myvol1=datavol(maskvol1>0);
        myvol2=datavol(maskvol2>0);
        
        tc(vol_counter)=((mean(myvol1)-mean(myvol2))/mean(myvol2))*100;
        vol_counter=vol_counter+1;
    end
end
[MM(1).Priors, MM(1).Mu, MM(1).Sigma, cluster_init] = EM_init_kmeans_upd(tc, cfg.nbStates);
[MM(1).Priors, MM(1).Mu, MM(1).Sigma, MM(1).Pix] = EM_boundingCov_upd(...
    tc, MM(1).Priors, MM(1).Mu, MM(1).Sigma);


%myfile=fullfile(cfg.shared_folder, cfg.tc_file);
save(cfg.tc_file, 'MM');