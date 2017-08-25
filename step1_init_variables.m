%matlab version used: R2015b (8.6.0.267246)
%Read_Fimbra
%Rodrigo Perea -->  rpereacamargo@mgh.harvard.edu
%Objective: To read necessary dependencies for a tract analyses! 

%Dependencies: 
%/Users/rdp20/Dropbox/Martinos/Scripts/matlab_scripts/trk_landmarks
%/Users/rdp20/Dropbox/Martinos/Scripts/matlab_scripts/dependencies

clear all;
clc;
%cd /Users/rdp20/Dropbox/Martinos/PROJECTS/fornix_AD23vsNC23/matlab/dev

%%
%==========================================================================
% INITIALIZING ROIs USED IN THE ANALYSES 
%DOT_FORNIX ROI:
ROIS_FX_DOT=rotrk_list('../../ROIs/ROI_dotfornix','ROI_dotfornix_','.nii');
%FIMBRIAL ROI:
ROIS_FX_FIMBRIA_L=rotrk_list('../../ROIs/ROI_fimbriaL/goodOri','ROI_','_dwi_lh_Fimbria.nii');
%FIMBRIAR ROI:
ROIS_FX_FIMBRIA_R=rotrk_list('../../ROIs/ROI_fimbriaR/goodOri','ROI_','_dwi_rh_Fimbria.nii');

%FA:
diffM_FA=rotrk_list('../../DIFFMETRICS/FA','','_FA.nii','','FA');
%RD:
diffM_RD=rotrk_list('../../DIFFMETRICS/RD','','_RD.nii','','RD');
%AxD:
diffM_AxD=rotrk_list('../../DIFFMETRICS/AxD','','_AxD.nii','','AxD');
%MD:
diffM_MD=rotrk_list('../../DIFFMETRICS/MD','','_MD.nii','','MD');

DIFFMETRICS=[diffM_FA; diffM_RD; diffM_MD; diffM_AxD];
%%

%CHECK THAT DIFFMETRICS ARE IN THE SAME ID ORDER AND WITH THE SAME ID
rotrk_check_diffmetrics(DIFFMETRICS);

%~~end of checking diffmetrics. 


%%
%TRKS:
TRKS_FX_DOT=rotrk_list('../../TRKS/TRKS_dotfornix','trk_ROIdot_ROA178noAC_s500k_','.trk');

TRKS_FX_DOTFIMBRIA_L=rotrk_list('../../TRKS/TRKS_dotFimbriaL_seedfimbria','trk_','_ROIdot_SEEDfimbriaL_ROA178noAC_s10k_40deg_nqathresh.02.trk');
TRKS_FX_DOTFIMBRIA_R=rotrk_list('../../TRKS/TRKS_dotFimbriaR_seedfimbria','trk_','_ROIdot_SEEDfimbriaR_ROA178noAC_s10k_40deg_nqathresh.02.trk');

TRKS_FX_FIMBRIA_L=rotrk_list('../../TRKS/TRKS_fimbriaL','trk_','_ROIfimbriaL_ROA178noAC_s500k_40degree_nqathresh.02.trk');
TRKS_FX_FIMBRIA_R=rotrk_list('../../TRKS/TRKS_fimbriaR','trk_','_ROIfimbriaR_ROA178noAC_s500k_40degree_nqathresh.02.trk');
%%
%ReadXLS:
xls_DATA=rotrk_readxls('../../xls/ADRC_170821.xlsx','AD23NC23_to_MATLAB');