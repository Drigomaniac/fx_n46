%Reading tracts now...

% %Tracts from the dotfornix only:
% for ii=1:numel(TRKS_DOT)
%     [ hdr_DOT{ii}, sstr_DOT{ii} ] = trk_read(cell2char(TRKS_DOT{ii}.filename));
% end

%For orientation purposes... (all ROIs should be in the same orientation e.g. LPS)


%%
REF_VOL=ROIS_FX_DOT{1};
%Dotfornix only
fprintf('\nReading TRKS_DOT...') ;
for ii=1:numel(TRKS_FX_DOT)
    [ TRKS_FX_DOT{ii}] = rotrk_read(TRKS_FX_DOT{ii}.filename,TRKS_FX_DOT{ii}.id,REF_VOL,'trk_fx_DOT');
    display([ 'In TRKS_FX_DOT with idx: ' num2str(ii) ] );
end
fprintf('completed \n');

%%
%Fimbrias only
fprintf('\nReading TRKS_FX_FIMBRIA_L...') ;
for ii=1:numel(TRKS_FX_FIMBRIA_L)
    [ TRKS_FX_FIMBRIA_L{ii} ] = rotrk_read(TRKS_FX_FIMBRIA_L{ii}.filename,TRKS_FX_FIMBRIA_L{ii}.id,REF_VOL,'trk_fx_fimbria_L');
    display([ 'In TRKS_FX_FIMBRIA_L with idx: ' num2str(ii) ] );
end
fprintf('completed \n');

fprintf('Reading TRKS_FX_FIMBRIA_R...') ;
for ii=1:numel(TRKS_FX_FIMBRIA_R)
    [ TRKS_FX_FIMBRIA_R{ii} ] = rotrk_read(TRKS_FX_FIMBRIA_R{ii}.filename,TRKS_FX_FIMBRIA_R{ii}.id,REF_VOL, 'trk_fx_fimbria_R');
    display([ 'In TRKS_FX_FIMBRIA_R with idx: ' num2str(ii) ] );
end
fprintf('completed \n');

%%
fprintf('\nReading TRKS_FX_DOTFIMBRIA_L...') ;
for ii=1:numel(TRKS_FX_DOTFIMBRIA_L)
    [ TRKS_FX_DOTFIMBRIA_L{ii} ] = rotrk_read(TRKS_FX_DOTFIMBRIA_L{ii}.filename,TRKS_FX_DOTFIMBRIA_L{ii}.id,REF_VOL,'trk_fx_dotfimbriaL');
    display([ 'In TRKS_FX_DOTFIMBRIA_L with idx: ' num2str(ii) ] );
end
fprintf('completed \n');

%%
fprintf('Reading TRKS_FX_DOTFIMBRIA_R...') ;
%Tracts from the dotfimbriaR:
for ii=1:numel(TRKS_FX_DOTFIMBRIA_R)
    [ TRKS_FX_DOTFIMBRIA_R{ii} ] = rotrk_read(TRKS_FX_DOTFIMBRIA_R{ii}.filename,TRKS_FX_DOTFIMBRIA_R{ii}.id,REF_VOL,'trk_fx_dotfimbriaR');
    display([ 'In TRKS_FX_DOTFIMBRIA_R with idx: ' num2str(ii) ] );
end
fprintf('completed \n');


%%
%READING XYZ COORDINATE FOR EACH ROI NEEDED!

%%
fprintf('Reading ROIS_FX_DOT...') ;

for ii=1:numel(ROIS_FX_DOT)
    ROIS_FX_DOT{ii}  =  rotrk_ROIxyz(ROIS_FX_DOT{ii});
    %disp(['In file (ROIS_FX_DOT):' ROIS_FX_DOT{ii}.id{end} ' with index: ' num2str(ii) ]);
end
fprintf('completed \n');

%%
fprintf('Reading ROIS_FX_FIMBRIA_R...') ;
for ii=1:numel(ROIS_FX_FIMBRIA_R)
    ROIS_FX_FIMBRIA_R{ii}  =  rotrk_ROIxyz(ROIS_FX_FIMBRIA_R{ii});
    %disp(['In file (ROIS_FX_FIMBRIA_R):' ROIS_FX_FIMBRIA_R{ii}.id{end} ' with index: ' num2str(ii)]);
end
fprintf('completed \n');


%%
fprintf('Reading ROIS_FX_FIMBRIA_L...') ;

for ii=1:numel(ROIS_FX_FIMBRIA_L)
    ROIS_FX_FIMBRIA_L{ii}  =  rotrk_ROIxyz(ROIS_FX_FIMBRIA_L{ii});
    %disp(['In file (ROIS_FX_FIMBRIA_L):' ROIS_FX_FIMBRIA_L{ii}.id{end} 'with index: ' num2str(ii)]);
end
fprintf('completed \n');


%SAVE *.mat file
%%
%CHECK IF TRKS_ROIS_<DATE>.mat exist
clear ii ans
matfile_step2 = [ 'matfile_Step2_' date '.mat'];

if ~exist(matfile_step2) == 1
    display('Saving the TRKS_ROIS_<DATE>.mat table...')
    save(matfile_step2)
    display('...done')
end