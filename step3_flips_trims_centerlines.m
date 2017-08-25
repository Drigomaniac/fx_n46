%%
%INITIALIZE DIFFMETRICS TO BE PASSED
%% DEFINED IN STEP 1


%%
%FLIP ALL TARGETS SO COORDINATES START AT THE ROI
%AND ADDING SPECIFIC SCALARS
%TRKS_FX_DOT:

disp('Flipping and adding scalars to closest ROI for TRKS_FX_DOT...')
for jj=1:numel(ROIS_FX_DOT); IDs_ROIS_FX_DOT(jj)=ROIS_FX_DOT{jj}.id ;  end 
for ii=1:numel(TRKS_FX_DOT)
    clear roi_idx
    roi_idx=getnameidx(IDs_ROIS_FX_DOT,TRKS_FX_DOT{ii}.id);
    disp(['In ii: ' num2str(ii) ] );
    TRKS_FX_DOT{ii}=rotrk_flip(TRKS_FX_DOT{ii}, [ rotrk_ROImean(ROIS_FX_DOT{roi_idx})] );
    TRKS_FX_DOT_trimmed{ii}  = rotrk_trimmedbyROI(TRKS_FX_DOT{ii},ROIS_FX_DOT{roi_idx}, 'above_dot');
end

%%
%Creating the 2landmarks for each TRKS...
%it will return the trimm1ed header and strlines and the centerline heade
%and strlines
%Left Fimbria
disp('Applying rotrk_2landmarks using high_sc to selected the centerline (Left side): ')
[TRKS_FX_trimmed_L, TRKS_FX_centerline_L, TRKS_FX_trimmed_nointerp_L ] = ... 
    rotrk_2landmarks(TRKS_FX_DOTFIMBRIA_L, ROIS_FX_DOT, ROIS_FX_FIMBRIA_L,40, ...
    'high_sc',DIFFMETRICS, 'FA');
%%
disp('Applying rotrk_2landmarks using high_sc to selected the centerline (Right side): ')

%Right Fimbria
[TRKS_FX_trimmed_R, TRKS_FX_centerline_R, TRKS_FX_trimmed_nointerp_R ] = ...  
    rotrk_2landmarks(TRKS_FX_DOTFIMBRIA_R, ROIS_FX_DOT, ROIS_FX_FIMBRIA_R,40, ...
    'high_sc',DIFFMETRICS, 'FA');




%%
%Creating the combined_all TRKS:
TRKS_BILALL=rotrk_add_uniquevoxels(TRKS_FX_DOT,TRKS_FX_FIMBRIA_L,TRKS_FX_FIMBRIA_R);



%%ADDING GENU:
step3_addition_genu.m


%SAVE *.mat file
%%
%CHECK IF TRKS_ROIS_<DATE>.mat exist
clear ii ans jj
matfile_step3 = [ 'matfile_Step3_' date '.mat'];

if ~exist(matfile_step3) == 1
    display('Saving the TRKS_ROIS_<DATE>.mat table...')
    save(matfile_step3)
    display('...done')
end
