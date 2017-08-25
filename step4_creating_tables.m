%LOADING ALL TRKS* and ROIs* into a matlab file:
list_TRKS=who('TRKS*'); 
list_ROIS=who('ROI*');
list_TRKSROIS=vertcat(list_TRKS, list_ROIS);
matfile_TRKSROIS = [ 'TRKS_ROIS_' date '.mat'];
%%
for tocomment=1:1
%Adding the xls values
disp('Adding xls_data to values from rotrk_2landmarks.m ...');
TRKS_FX_centerline_R = rotrk_add_xls(xls_DATA,TRKS_FX_centerline_R);
TRKS_FX_centerline_L = rotrk_add_xls(xls_DATA,TRKS_FX_centerline_L);
TRKS_FX_trimmed_L = rotrk_add_xls(xls_DATA,TRKS_FX_trimmed_L);
TRKS_FX_trimmed_R = rotrk_add_xls(xls_DATA,TRKS_FX_trimmed_R);

TRKS_FX_DOT=rotrk_add_xls(xls_DATA,TRKS_FX_DOT);
TRKS_FX_FIMBRIA_L=rotrk_add_xls(xls_DATA,TRKS_FX_FIMBRIA_L);
TRKS_FX_FIMBRIA_R=rotrk_add_xls(xls_DATA,TRKS_FX_FIMBRIA_R);

TRKS_GENU=rotrk_add_xls(xls_DATA,TRKS_GENU);
TRKS_GENU_centerline=rotrk_add_xls(xls_DATA,TRKS_GENU_centerline);
TRKS_BILALL=rotrk_add_xls(xls_DATA,TRKS_BILALL);
disp('DONE! (Adding xls_data to values from rotrk_2landmarks.m ...)');
%%
%CHECK IF TRKS_ROIS_<DATE>.mat exist
if ~exist(matfile_TRKSROIS) == 1
    display('Saving the TRKS_ROIS_<DATE>.mat table...')
    save(matfile_TRKSROIS,list_TRKSROIS{:})
    display('...done')
end

%check if xls_DATA is a variable:
if ~exist('xls_DATA') == 1
    xls_DATA=rotrk_readxls('../../xls/ADRC_170821.xlsx','AD23NC23_to_MATLAB');
end

%%
%Generate the major table
disp('Generating the table');
%Adding the necessary values to a table:
[unclean_Table] = rotrk_2tablev3(TRKS_BILALL,matfile_TRKSROIS);
%Remove nans and the matched pair:
clean_Table=rotrk_re_pair_nans(unclean_Table,'agematched_id',9);
theTable=clean_Table;
disp('Done! (generating the table)');
end %HERE WE UPLOAD INIT VARIABLES
%%