% Description of file

% Maintained by: First Last, last modified YYYY/MM/DD

% Whitespace style guide
% Before section: (%%) | Three lines
% Before major subsection. | Two lines
% Before minor subsection. | One line



%% 1. Prepare MATLAB
clc
close all
clearvars
addpath('..\common_matlab_functions') % Add common customized matlab functions (optional)
addpath('C:\gd\FaboratoryResearch\gitRepos\common_matlab_functions') % Add common customized matlab functions (optional)
addpath('C:\dyl_folders\Arieca_dyl\git_repos\common_matlab_functions') % Add common customized matlab functions (optional)



%% 2. Global Variables
% 2.1 colors = {'0kpa':'b'}; % Sample color dictionary


%%% 2.2 Colors from Inkscape template
% 6-class purples 242, 240, 247; 235, 218, 218; 188, 189, 220, 100; 158, 154, 200; 117, 107, 177; 84, 38, 143; 
% 6-class RdPu 254, 235, 226; 252, 197, 192; 250, 159, 181; 247, 104, 161; 197, 27, 138; 122, 1, 119
% 6-class YlOrRd 255, 255, 178; 254, 217, 118; 254, 178, 76; 253, 141, 60; 240, 59, 32; 189, 0, 38
% 6-class YlGn 255, 255, 204; 217, 240, 163; 173, 221, 143; 120, 198, 121; 49, 163, 84; 0, 104, 55; 
% 6-class YlGnBu 255, 255, 204; 199, 233, 180; 127, 205, 187; 65, 182, 196; 44, 127, 184; 37, 52, 148

%%% 2.3 Elze's 8 different colors - stored in c. See X:\Instructions\Figures
c = cell(8,1);
c(1) = {[0 0 0]/255}; % Black 
c(2) = {[230 159 0]/255}; % Golden
c(3) = {[86 180 233]/255}; % Light blue
c(4) = {[0 158 115]/255}; % Light green
c(5) = {[240 228 66]/255}; % Yellow
c(6) = {[0 114 178]/255}; % Dark Blue
c(7) = {[213 94 0]/255}; % Reddish-brown
c(8) = {[204 121 167]/255}; % Purple-pink


% 2.4 Common parameters
n_repetitions = 5;
n_specimens = 3;

displacement_column = 2;
force_column = 3;
min_force = [0.005, 0.075, 0.075];
columns_to_zero = [2, 3];

load_excel = true; % Should we import from excel? If not, it will load a .mat file
figure_num = 0;


%% 3. Import Data, at all pressures, shapes, and manufacturing methods
% Assumes: five files (instron runs) per sample. 
% Assumes "files" gives specimens the following indices: Specimen A = 1:5, B = 6:10, C = 11:15

if load_excel
    % Square Individual: amb samples 16-30, 40 kPa 16-30, 80- kPa 1-15
    % 0 kPa
    folder = 'folder_name\';
    file_prefix = 'sample_0kpa_';
    files = linspace(16, 30, 15);
    your_data = import_instron_data(folder, file_prefix, files);
    your_data_zeroed = above_value(your_data, force_column, min_force(1), columns_to_zero); % Remove datapoints which have force below a certain value
    your_data_zeroed(any(isnan(your_data_zeroed), 2), :) = [];
    disp('Done importing square individual.')
    
else
    load('data_file.mat')
end

% Finish up
clear folder file_prefix files
disp('Done Loading Data');



%% 4. Common plotting parameters
plot_format_pressure = {'r-' 'm-' 'b-' 'c-'}; % Plot formats as a function of pressure. For when one specimen is plotted at all pressures

ylims = [0.3, 1, 2];



%% 5. Plot Data
% How internally consistent are the specimens?

% Prepare figures
figure_num = figure_num + 1;
figure(figure_num)
clf
hold on
% title('All Data')
xlabel('Displacement (mm)')
ylabel('Shear Stress (kPa)')
xlim([0 2])
ylim([0 40])
set(gca,'FontSize', 18); % Make the labels larger
% xticks([2, 3, 4, 5]); % Custom x-ticks
% xticklabels({'0', '3', '4', '5'}); % Custom x-ticks labels

% Histograms
% scatter(all_maxes_labels, all_maxes, 'Filled')

% Clouds. 
% percent_to_right = 0.95; plot_raw_status = false;
% psi_0 = plot_clouds({pressure_radius_pet_s1_0psi_, pressure_radius_pet_s2_0psi_0830, pressure_radius_pet_s3_0psi_1018}, pressure_col, curvature_col, min_p-1, bin_width, 200, 'color', c{3}, 'subtract_initial', false, 'percent_to_right', percent_to_right, 'specific_sd', true, 'plot_raw', plot_raw_status);

% Regular plot
% plot(ext(:, 1), ext(:, 2), '-o', 'color', c{2}, 'LineWidth', 3, 'MarkerSize', 5, 'DisplayName', 'EXT')
% plot(ext_6_15_2204(:, 1), ext_6_15_2204(:, 3), 'color', c{6}, 'HandleVisibility','off')
% lgd = legend();
% lgd.Location = 'southeast';

% Finish up
disp('Done plotting one figure per specimen type, with all specimens at all pressures')


%% Auto Arrange Figures
autoArrangeFigures()

