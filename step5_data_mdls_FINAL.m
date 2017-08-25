%THE STATS DEFAULT TRACKING (FOR PUBLICATION):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for tocomment=1:1
%%TABLE 2 Less Restrictive Stats 
%STREAMLINE LENGTHS (BASED ON DEF. TRACKING):
clc
mdl_maxsstrlentrk_fx_DOT=fitlm(theTable, 'maxsstrlentrk_fx_DOT~dx+diffmotion')
mdl_maxsstrlentrk_fx_fimbria_L=fitlm(theTable, 'maxsstrlentrk_fx_fimbria_L~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_maxsstrlentrk_fx_fimbria_R=fitlm(theTable, 'maxsstrlentrk_fx_fimbria_R~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')

%%
%VOL BASED ON DOT DEFAULT TRACTOGRAPHY:
clc
mdl_voltrk_fx_DOT=fitlm(theTable, 'voltrk_fx_DOT~dx+diffmotion')
mdl_fimL_deftrk_volume_FX=fitlm(theTable, 'voltrk_fx_fimbria_L~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_fimR_def_volume_FX=fitlm(theTable, 'voltrk_fx_fimbria_R~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
mdl_all_deftrk__volume_FX=fitlm(theTable, 'voltrk_combinedall~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+vol_ROI_dwi_rh_Fimbria')

%%
clc
%VOL BASED ON DOTFIM LESS RESTRICTIVE TRACTOGRAPHY (no fimbria controlled):
%untrimmed
mdl_voltrk_fx_dotfimbriaL=fitlm(theTable, 'voltrk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_voltrk_fx_dotfimbriaR=fitlm(theTable, 'voltrk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
%trimmed x2:
mdl_voltrimmedx2_trk_fx_dotfimbriaL=fitlm(theTable, 'voltrimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_voltrimmedx2_trk_fx_dotfimbriaR=fitlm(theTable, 'voltrimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for tocomment=1:1
%%
%CENTERLINE STATS (controlling for fimbria volume):
clc
mdl_centerline_FA_L_volfim=fitlm(theTable, 'FA_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_centerline_FA_R_volfim=fitlm(theTable, 'FA_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
mdl_centerline_RD_L_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_centerline_RD_R_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
mdl_centerline_AxD_L_volfim=fitlm(theTable, 'AxD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_centerline_AxD_R_volfim=fitlm(theTable, 'AxD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
mdl_centerline_MD_L_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria')
mdl_centerline_MD_R_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria')
%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE S1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for tocomment=1:1
%%
%%
%%THE STATS GENU (FOR PUBLICATION)
clc
mdl_GENU_cline_FA=fitlm(theTable, 'FA_trimmed_trk_genu~dx+diffmotion')
mdl_GENU_cline_RD=fitlm(theTable, 'RD_trimmed_trk_genu~dx+diffmotion')
mdl_GENU_cline_AxD=fitlm(theTable, 'AxD_trimmed_trk_genu~dx+diffmotion')
mdl_GENU_cline_MD=fitlm(theTable, 'MD_trimmed_trk_genu~dx+diffmotion')
%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE S1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end




%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE S1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%CENTERLINE STATS AND COVARYING FOR:
clc
%Covarying for trimmed volFX:
mdl_centerline_FA_L_volfim=fitlm(theTable, 'FA_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaL')
mdl_centerline_FA_R_volfim=fitlm(theTable, 'FA_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaR')
mdl_centerline_RD_L_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaL')
mdl_centerline_RD_R_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaR')
mdl_centerline_AxD_L_volfim=fitlm(theTable, 'AxD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaL')
mdl_centerline_AxD_R_volfim=fitlm(theTable, 'AxD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaR')
mdl_centerline_MD_L_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaL')
mdl_centerline_MD_R_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrimmedx2_trk_fx_dotfimbriaR')

%%
clc
%Covarying for untrimmed volFX:
mdl_centerline_FA_L_volfim=fitlm(theTable, 'FA_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrk_fx_dotfimbriaL')
mdl_centerline_FA_R_volfim=fitlm(theTable, 'FA_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrk_fx_dotfimbriaR')
mdl_centerline_RD_L_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrk_fx_dotfimbriaL')
mdl_centerline_RD_R_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrk_fx_dotfimbriaR')
mdl_centerline_AxD_L_volfim=fitlm(theTable, 'AxD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrk_fx_dotfimbriaL')
mdl_centerline_AxD_R_volfim=fitlm(theTable, 'AxD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrk_fx_dotfimbriaR')
mdl_centerline_MD_L_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaL~dx+diffmotion+vol_ROI_dwi_lh_Fimbria+voltrk_fx_dotfimbriaL')
mdl_centerline_MD_R_volfim=fitlm(theTable, 'RD_cline_interp_trimmedx2_trk_fx_dotfimbriaR~dx+diffmotion+vol_ROI_dwi_rh_Fimbria+voltrk_fx_dotfimbriaR')


%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE S2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%BELOW IS THE PREVIOUS CODE (WITH 7k5 VALUES, BEFORE NBA SUBMISSION%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % for tocomment=1:1
% % %%TABLE 2 Less Restrictive Stats 
% % %STREAMLINE LENGTHS (BASED ON DEF. TRACKING):
% % clc
% % mdl_dot_maxlen_bil_diffonly=fitlm(theTable, 'maxsstrlentrimmed_trk_fx_DOT~dx+diffmotion')
% % mdl_dot_maxlen_L=fitlm(theTable, 'maxlen_fx_fimbria_L~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_dot_maxlen_R=fitlm(theTable, 'maxlen_fx_fimbria_R~dx+diffmotion+vol_fimbriaDIL_R')
% % 
% % %%
% % %VOL BASED ON DOT DEFAULT TRACTOGRAPHY:
% % clc
% % mdl_dot_deftrk_volume_FX=fitlm(theTable, 'vvol_fx_DOT~dx+diffmotion')
% % mdl_fimL_deftrk_volume_FX=fitlm(theTable, 'vvol_fx_fimbria_L~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_fimR_def_volume_FX=fitlm(theTable, 'vvol_fx_fimbria_R~dx+diffmotion+vol_fimbriaDIL_R')
% % mdl_all_deftrk__volume_FX=fitlm(theTable, 'vvol_all~dx+diffmotion+vol_fimbriaDIL_L+vol_fimbriaDIL_R')
% % 
% % %%
% % %TRIMMED AND UNTRIMMED VALUES THAT REACH NO SIGNIFICANT RESULTS:
% % %Untrimmed:
% % mdl_dotfim_untrimmed_voltrx_FX_L=fitlm(theTable, 'vvol_fx_dotfimbriaL~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_dotfim_untrimmed_voltrx_FX_R=fitlm(theTable, 'vvol_fx_dotfimbriaR~dx+diffmotion+vol_fimbriaDIL_R')
% % %Trimmed:
% % %%
% % clc
% % %VOL BASED ON DOTFIM LESS RESTRICTIVE TRACTOGRAPHY (no fimbria controlled):
% % %untrimmed
% % mdl_dotfim_untrimmed_voltrx_FX_L=fitlm(theTable, 'vvol_fx_dotfimbriaL~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_dotfim_untrimmed_voltrx_FX_R=fitlm(theTable, 'vvol_fx_dotfimbriaR~dx+diffmotion+vol_fimbriaDIL_R')
% % %trimmed x2:
% % mdl_dotfim_trimmed_voltrx_FX_L=fitlm(theTable, 'vvol_fx_dotfimbriaL_trimmedx2~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_dotfim_trimmed_voltrx_FX_R=fitlm(theTable, 'vvol_fx_dotfimbriaR_trimmedx2~dx+diffmotion+vol_fimbriaDIL_R')
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % end
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
% % 
% % %%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % for tocomment=1:1
% % %%
% % %CENTERLINE STATS (controlling for fimbria volume):
% % clc
% % mdl_centerline_FA_L_volfim=fitlm(theTable, 'meanFA_fx_dotfimbriaL_centerline~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_centerline_FA_R_volfim=fitlm(theTable, 'meanFA_fx_dotfimbriaR_centerline~dx+diffmotion+vol_fimbriaDIL_R')
% % mdl_centerline_RD_L_volfim=fitlm(theTable, 'meanRD_fx_dotfimbriaL_centerline~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_centerline_RD_R_volfim=fitlm(theTable, 'meanRD_fx_dotfimbriaR_centerline~dx+diffmotion+vol_fimbriaDIL_R')
% % mdl_centerline_AxD_L_volfim=fitlm(theTable, 'meanAxD_fx_dotfimbriaL_centerline~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_centerline_AxD_R_volfim=fitlm(theTable, 'meanAxD_fx_dotfimbriaR_centerline~dx+diffmotion+vol_fimbriaDIL_R')
% % mdl_centerline_MD_L_volfim=fitlm(theTable, 'meanMD_fx_dotfimbriaL_centerline~dx+diffmotion+vol_fimbriaDIL_L')
% % mdl_centerline_MD_R_volfim=fitlm(theTable, 'meanMD_fx_dotfimbriaR_centerline~dx+diffmotion+vol_fimbriaDIL_R')
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % end
% % 
% % %%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TABLE S1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % for tocomment=1:1
% % %%
% % %%
% % %%THE STATS GENU (FOR PUBLICATION)
% % clc
% % mdl_GENU_cline_FA=fitlm(theTable, 'meanFA_genu_trimmed_centerline~dx+diffmotion')
% % mdl_GENU_cline_RD=fitlm(theTable, 'meanRD_genu_trimmed_centerline~dx+diffmotion')
% % mdl_GENU_cline_AxD=fitlm(theTable, 'meanAxD_genu_trimmed_centerline~dx+diffmotion')
% % mdl_GENU_cline_MD=fitlm(theTable, 'meanMD_genu_trimmed_centerline~dx+diffmotion')
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF TABLE S1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % end
