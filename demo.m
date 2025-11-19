%[text] # Simple Control System Demo
%[text] 
%[text] This live script demonstrates the simple control system Simulink model.
%[text] 
%[text] ## Model Overview
%[text] 
%[text] The model consists of:
%[text] 
%[text] ## Simulink Model Visualization

% Open the Simulink model
modelName = 'simple_control_system';
open_system(modelName);

% Capture the model as an image
print(['-s' modelName], '-dpng', 'model_screenshot.png');

% Display the model image
img = imread('model_screenshot.png');
figure('Name', 'Simulink Model', 'NumberTitle', 'off');
imshow(img);
title('Simple Control System - Simulink Model');

%[text] ## System Response
%[text] 
%[text] Now let's simulate the model and view the response.

% Simulate the model
simOut = sim(modelName, 'StopTime', '10');

%[text] ## Transfer Function Analysis
%[text] 
%[text] Let's analyze the system using Control System Toolbox.

% Define the controller and plant transfer functions
s = tf('s');
H = 10/(s+5);  % Controller
G = 1/(s^2+2*s+1);  % Plant

% Open-loop transfer function
L = H*G;

% Closed-loop transfer function
T = feedback(L, 1);

%[text] ### Step Response

% Plot the closed-loop step response
figure('Name', 'Step Response', 'NumberTitle', 'off');
step(T);
grid on;
title('Closed-Loop Step Response');

%[text] ### Frequency Response

% Plot Bode diagram
figure('Name', 'Bode Plot', 'NumberTitle', 'off');
bode(T);
grid on;
title('Closed-Loop Frequency Response');

%[text] ## System Properties

% Get step response characteristics
stepinfo(T)

%[text] ### Pole-Zero Map

figure('Name', 'Pole-Zero Map', 'NumberTitle', 'off');
pzmap(T);
grid on;
title('Closed-Loop Pole-Zero Map');

%[text] ## Stability Analysis

% Check stability
poles = pole(T);
fprintf('System poles:\n');
disp(poles);

if all(real(poles) < 0)
    fprintf('\nThe system is STABLE (all poles in left half-plane)\n');
else
    fprintf('\nThe system is UNSTABLE\n');
end

%[text] ## Conclusion
%[text] 
%[text] This control system demonstrates:
%[text] 
%[text] ### Next Steps

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:55c32447]
%   data: {"dataType":"error","outputData":{"errorType":"runtime","text":"Error using inputcheck\n'simple_control_system' and 'model_screenshot.png' might be file names. Specify only one file name.\n\nError in <a href=\"matlab:matlab.lang.internal.introspective.errorDocCallback('print', 'C:\\Program Files\\MATLAB\\R2025b\\toolbox\\matlab\\graphics\\graphics\\printing\\print.m', 36)\" style=\"font-weight:bold\">print<\/a> (<a href=\"matlab: opentoline('C:\\Program Files\\MATLAB\\R2025b\\toolbox\\matlab\\graphics\\graphics\\printing\\print.m',36,0)\">line 36<\/a>)\n[pj, devices, options ] = inputcheck( pj, inputargs{:} );\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"}}
%---
