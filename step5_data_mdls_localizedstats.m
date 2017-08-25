
%%
%Localized plots
lin_model= ' dx + diffmotion + voltrk_fx_dotfimbriaL/R + 1 ';
%WHOLE MODEL: dx + diffmotion + voltrk_fx_dotfimbriaL/R + fimbria_volL/R
disp('In FA localized stats...')
 [ MYTRKS.FA, tval_R_FA, pval_R_FA, tval_L_FA, pval_L_FA ] = ...
    rotrk_localized_stats('FA','150304_8CS00253','dx', TRKS_FX_centerline_R,TRKS_FX_centerline_L,theTable, ...
    lin_model,'no');
disp('In RD localized stats...')
[ MYTRKS.RD, tval_R_RD, pval_R_RD, tval_L_RD, pval_L_RD ] = ...
    rotrk_localized_stats('RD','150304_8CS00253','dx',TRKS_FX_centerline_R,TRKS_FX_centerline_L,theTable, ...
    lin_model, 'no' );
disp('In MD localized stats...')
[ MYTRKS.MD, tval_R_MD, pval_R_MD, tval_L_MD, pval_L_MD ] = ...
    rotrk_localized_stats('MD','150304_8CS00253', 'dx',TRKS_FX_centerline_R,TRKS_FX_centerline_L,theTable, ...
    lin_model, 'no' );
disp('In AxD localized stats...')
[ MYTRKS.AxD, tval_R_AxD, pval_R_AxD, tval_L_AxD, pval_L_AxD ] = ... 
    rotrk_localized_stats('AxD','150304_8CS00253','dx',TRKS_FX_centerline_R,TRKS_FX_centerline_L,theTable, ...
    lin_model, 'no' );


%Get some info (just for reference)
%%
tval_nsig(1)=numel(find(tval_L_FA>=1.68));  tval_nsig(2)=numel(find(tval_R_FA>=1.68))  ;
tval_nsig(3)=numel(find(tval_L_RD>=1.68));  tval_nsig(4)=numel(find(tval_R_RD>=1.68)) ;
tval_nsig(5)=numel(find(tval_L_AxD>=1.68)); tval_nsig(6)=numel(find(tval_R_AxD>=1.68));
tval_nsig(7)=numel(find(tval_L_MD>=1.68)) ; tval_nsig(8)=numel(find(tval_R_MD>=1.68)) ;

pval_nsig(1)=numel(find(pval_L_FA<=0.0025)) ;  pval_nsig(2)=numel(find(pval_R_FA<=0.0025)) ; % p<0.05/40 observation = p<0.00125 (but one tails --> p < 0.0025
pval_nsig(3)=numel(find(pval_L_RD<=0.0025)) ;  pval_nsig(4)=numel(find(pval_R_RD<=0.0025)) ;
pval_nsig(5)=numel(find(pval_L_AxD<=0.0025)) ; pval_nsig(6)=numel(find(pval_R_AxD<=0.0025));
pval_nsig(7)=numel(find(pval_L_MD<=0.0025)) ;  pval_nsig(8)=numel(find(pval_R_MD<=0.0025)) ;


%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%NOW WORK ON WRITING *.NII FILES USING THE REFERENCE COORDINATES BUT VALUES
%FROM EACH TRACT ITSELF
%    REFID is: 150304_8CS00253 so ~~~> TRKS_FX_centerline_L{22} or
 %   MYTRKS.FA.L_CLINE{16}  and TRKS_FX_centerline_R{23} or MYTRKS.FA.R_CLINE{18}

THEDIFFMETRIC='AxD';
CUR_TRK=MYTRKS.(THEDIFFMETRIC);
for ii=1:size(MYTRKS.FA.L_CLINE,2) ; IDs_FA_L{ii} = MYTRKS.FA.L_CLINE{ii}.id; end
system(['mkdir -p  coord_2_REF' filesep THEDIFFMETRIC filesep 'L ']);
newii=1;
clear vvol_L diffmotion_L idx_vvol_L dxAD_L dxNC_L
for ii=1:size(MYTRKS.FA.L_CLINE,2)
    curTRK=rotrk_coord2ref(MYTRKS.FA.L_CLINE{ii},MYTRKS.FA.L_CLINE{16});
    idx_vvol_L=getnameidx(theTable.id,curTRK.id);
    if isnan(theTable.voltrk_fx_dotfimbriaL(idx_vvol_L))
        nothing_to_do=1;
    else
        ref2coord_L= ['coord_2_REF' filesep THEDIFFMETRIC filesep 'L' filesep  num2str(newii, '%02d') '_c2REF_' THEDIFFMETRIC '_L_' curTRK.id '.nii' ];
        if ~exist(ref2coord_L,'file')
            rotrk_trk2roi(curTRK.header, curTRK.sstr, REF_VOL,ref2coord_L, THEDIFFMETRIC );
        end
        %vvol_L(newii)=theTable.voltrk_fx_dotfimbriaL(idx_vvol_L);
        vvol_L(newii)=theTable.volinterp_trimmedx2_trk_fx_dotfimbriaL(idx_vvol_L);
        diffmotion_L(newii)=curTRK.header.data.diffmotion;
        if strcmp(curTRK.header.data.dx,'NC')
            dxNC_L(newii)=1;
            dxAD_L(newii)=0;
        else
            dxNC_L(newii)=0;
            dxAD_L(newii)=1;
        end
        newii=newii+1;
    end
end
clear idx_vvol_L curTRK newii


clear vvol_R diffmotion_R idx_vvol_R dx_R
newii=1;
system(['mkdir -p  coord_2_REF' filesep THEDIFFMETRIC filesep 'R ']);

for ii=1:size(MYTRKS.FA.R_CLINE,2)
    curTRK=rotrk_coord2ref(MYTRKS.FA.R_CLINE{ii},MYTRKS.FA.R_CLINE{18});
    idx_vvol_R=getnameidx(theTable.id,curTRK.id);
    
    if isnan(theTable.voltrk_fx_dotfimbriaR(idx_vvol_R))
        nothing_to_do=1;
    else
        ref2coord_R= ['coord_2_REF' filesep THEDIFFMETRIC filesep 'R' filesep  num2str(newii, '%02d') '_c2REF_' THEDIFFMETRIC '_R_' curTRK.id '.nii' ];
        if ~exist(ref2coord_R,'file')
            rotrk_trk2roi(curTRK.header, curTRK.sstr, REF_VOL, ref2coord_R,  THEDIFFMETRIC );
        end
        %vvol_R(newii)=theTable.voltrk_fx_dotfimbriaR(idx_vvol_R);
        vvol_R(newii)=theTable.volinterp_trimmedx2_trk_fx_dotfimbriaR(idx_vvol_R);
        diffmotion_R(newii)=curTRK.header.data.diffmotion;
        if strcmp(curTRK.header.data.dx,'NC')
            dxNC_R(newii)=1;
            dxAD_R(newii)=0;
        else
            dxAD_R(newii)=1;
            dxNC_R(newii)=0;
        end
        newii=newii+1;
    end
end
clear idx_vvol_R curTRK newii


[ dxNC_L' dxAD_L' diffmotion_L' vvol_L' ] 

[ dxNC_R' dxAD_R' diffmotion_R' vvol_R' ] 

%%%%%%%%%%%
