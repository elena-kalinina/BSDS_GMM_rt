function create_spm_design_loc(subjectID, session, cfg)

%for session=rN %1:rN-1
   % run_path=sprintf('%sLocalizer', cfg.dataPathSPM);
    [myonsets, sess_labels]=create_training_ds_bsds(subjectID, session, cfg);
    names={'face', 'house'};
    onsets_f=myonsets(sess_labels==1);
    onsets_h=myonsets(sess_labels==2);
    onsets={onsets_f', onsets_h'};
    durations={7, 7};
    fname_design=fullfile(cfg.output, sprintf('design_%d_%s.mat', session, subjectID));
    save(fname_design, 'names', 'onsets', 'durations');
%end