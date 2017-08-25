% %%

%%
%Adding the xls values
disp('Adding xls_data to values from rotrk_2landmarks.m ...');
TRKS_FX_centerline_R = rotrk_add_xls(xls_DATA,TRKS_FX_centerline_R);
TRKS_FX_centerline_L = rotrk_add_xls(xls_DATA,TRKS_FX_centerline_L);
TRKS_FX_trimmed_L = rotrk_add_xls(xls_DATA,TRKS_FX_trimmed_L);
TRKS_FX_trimmed_R = rotrk_add_xls(xls_DATA,TRKS_FX_trimmed_R);
TRKS_FX_DOTFIMBRIA_R = rotrk_add_xls(xls_DATA,TRKS_FX_DOTFIMBRIA_R);
TRKS_FX_DOTFIMBRIA_L = rotrk_add_xls(xls_DATA,TRKS_FX_DOTFIMBRIA_L);

TRKS_FX_DOT=rotrk_add_xls(xls_DATA,TRKS_FX_DOT);
TRKS_FX_FIMBRIA_L=rotrk_add_xls(xls_DATA,TRKS_FX_FIMBRIA_L);
TRKS_FX_FIMBRIA_R=rotrk_add_xls(xls_DATA,TRKS_FX_FIMBRIA_R);
%%





% %Plotting default tracking parameters

%%
%First let's get the *.plot parameters to be passed
for tocomment=1:1
    for ii=1:numel(TRKS_FX_DOT)
        TRKS_FX_DOT{ii}.plot_params.color='bb';
        TRKS_FX_DOT{ii}.plot_params.orientation='fornix';
        TRKS_FX_DOT{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_DOT{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_DOT{ii}.plot_params.zlim=[ 35 95 ] ;
         
    end
    
    for ii=1:numel(TRKS_FX_FIMBRIA_R)
        TRKS_FX_FIMBRIA_R{ii}.plot_params.color='b';
        TRKS_FX_FIMBRIA_R{ii}.plot_params.orientation='fornix';
        TRKS_FX_FIMBRIA_R{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_FIMBRIA_R{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_FIMBRIA_R{ii}.plot_params.zlim=[ 35 95 ] ;
        
        
        TRKS_FX_trimmed_R{ii}.plot_params.color='c';
        TRKS_FX_trimmed_R{ii}.plot_params.orientation='fornix';
        TRKS_FX_trimmed_R{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_trimmed_R{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_trimmed_R{ii}.plot_params.zlim=[ 35 95 ] ;
        
        TRKS_FX_trimmed_nointerp_R{ii}.plot_params.color='c';
        TRKS_FX_trimmed_nointerp_R{ii}.plot_params.orientation='fornix';
        
        TRKS_FX_centerline_R{ii}.plot_params.color='gg';
        TRKS_FX_centerline_R{ii}.plot_params.orientation='fornix';
        TRKS_FX_centerline_R{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_centerline_R{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_centerline_R{ii}.plot_params.zlm=[ 35 95 ] ;
    end
    
    for ii=1:numel(TRKS_FX_FIMBRIA_L)
        TRKS_FX_FIMBRIA_L{ii}.plot_params.color='b';
        TRKS_FX_FIMBRIA_L{ii}.plot_params.orientation='fornix';
        TRKS_FX_FIMBRIA_L{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_FIMBRIA_L{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_FIMBRIA_L{ii}.plot_params.zlim=[ 35 95 ] ;
        
        
        TRKS_FX_trimmed_L{ii}.plot_params.color='c';
        TRKS_FX_trimmed_L{ii}.plot_params.orientation='fornix';
        TRKS_FX_trimmed_L{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_trimmed_L{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_trimmed_L{ii}.plot_params.zlim=[ 35 95 ] ;
        
        TRKS_FX_trimmed_nointerp_L{ii}.plot_params.color='c';
        TRKS_FX_trimmed_nointerp_L{ii}.plot_params.orientation='fornix';
        
        
        
        TRKS_FX_centerline_L{ii}.plot_params.color='rr';
        TRKS_FX_centerline_L{ii}.plot_params.orientation='fornix';
        TRKS_FX_centerline_L{ii}.plot_params.xlim=[ 85 165 ] ;
        TRKS_FX_centerline_L{ii}.plot_params.ylim=[ 105 165 ] ;
        TRKS_FX_centerline_L{ii}.plot_params.zlim=[ 35 95 ] ;
    end
    
    
     
    for ii=1:numel(ROIS_FX_FIMBRIA_L)
        ROIS_FX_FIMBRIA_L{ii}.plot_params.color='r.';
    end
    for ii=1:numel(ROIS_FX_FIMBRIA_R)
        ROIS_FX_FIMBRIA_R{ii}.plot_params.color='r.';
    end 
    for ii=1:numel(ROIS_FX_DOT)
        ROIS_FX_DOT{ii}.plot_params.color='g.';
    end 
    
    
end


%%
%
%All strlimes (def tracts):
%%
rotrk_plot(TRKS_FX_DOT,'','age','NC',TRKS_FX_FIMBRIA_R,TRKS_FX_FIMBRIA_L, ...
     'add_roi',ROIS_FX_DOT,'add_roi',ROIS_FX_FIMBRIA_L,'add_roi',ROIS_FX_FIMBRIA_R,'hide_axis');
 
 %%
 
rotrk_plot(TRKS_FX_DOT,'','age','AD',TRKS_FX_FIMBRIA_R,TRKS_FX_FIMBRIA_L, ...
     'add_roi',ROIS_FX_DOT,'add_roi',ROIS_FX_FIMBRIA_L,'add_roi',ROIS_FX_FIMBRIA_R,'hide_axis');

 
 %%
%Trimmed untrimmed plots (2nd plot)
rotrk_plot(TRKS_FX_DOTFIMBRIA_R,'','age','NC',TRKS_FX_DOTFIMBRIA_L,TRKS_FX_trimmed_nointerp_L,TRKS_FX_trimmed_nointerp_R, ...
     'add_roi',ROIS_FX_DOT,'add_roi',ROIS_FX_FIMBRIA_L,'add_roi',ROIS_FX_FIMBRIA_R,'hide_axis');

%%
 rotrk_plot(TRKS_FX_DOTFIMBRIA_R,'','age','AD',TRKS_FX_DOTFIMBRIA_L,TRKS_FX_trimmed_nointerp_L,TRKS_FX_trimmed_nointerp_R, ...
     'add_roi',ROIS_FX_DOT,'add_roi',ROIS_FX_FIMBRIA_L,'add_roi',ROIS_FX_FIMBRIA_R,'hide_axis');


%%
%Trimmed lines:
rotrk_plot(TRKS_FX_trimmed_R,'','age','AD',TRKS_FX_trimmed_L,'add','sex','add','age');
rotrk_plot(TRKS_FX_trimmed_R,'','age','NC',TRKS_FX_trimmed_L,'add','sex','add','age');

%%
%Centerlines:
%rotrk_plot(TRKS_FX_centerline_R,'','age','AD',TRKS_FX_centerline_L,'add','sex','add','age', ...
%    'add_roi',ROIS_FX_DOT,'add_roi',ROIS_FX_FIMBRIA_L,'add_roi',ROIS_FX_FIMBRIA_R,'hide_axis');
rotrk_plot(TRKS_FX_centerline_R,'','age','AD',TRKS_FX_centerline_L, ...
    'add_roi',ROIS_FX_DOT,'add_roi',ROIS_FX_FIMBRIA_L,'add_roi',ROIS_FX_FIMBRIA_R');
rotrk_plot(TRKS_FX_centerline_R,'','age','NC',TRKS_FX_centerline_L,'add','sex','add','age');


%%
[ tval_R_QA0, pval_R_QA0, tval_L_QA0, pval_L_QA0 ] =rotrk_localized_stats('QA0','150304_8CS00253','dx',TRKS_FX_centerline_R,TRKS_FX_centerline_L);
disp('In FA localized stats...')


[ tval_R_QA1, pval_R_QA1, tval_L_QA1, pval_L_QA1 ] =rotrk_localized_stats('QA1','150304_8CS00253','dx',TRKS_FX_centerline_R,TRKS_FX_centerline_L);
disp('In FA localized stats...')
