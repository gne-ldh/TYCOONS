function varargout = PFUNC(varargin)
% PFUNC MATLAB code for PFUNC.fig
%      PFUNC, by itself, creates a new PFUNC or raises the existing
%      singleton*.
%
%      H = PFUNC returns the handle to a new PFUNC or the handle to
%      the existing singleton*.
%
%      PFUNC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PFUNC.M with the given input arguments.
%
%      PFUNC('Property','Value',...) creates a new PFUNC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PFUNC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PFUNC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PFUNC

% Last Modified by GUIDE v2.5 04-Oct-2019 02:27:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PFUNC_OpeningFcn, ...
                   'gui_OutputFcn',  @PFUNC_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before PFUNC is made visible.
function PFUNC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PFUNC (see VARARGIN)

% Choose default command line output for PFUNC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PFUNC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PFUNC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
cam=videoinput('winvideo');
preview(cam);


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
n=input('name =');
counter =1 ;
FDetect = vision.CascadeObjectDetector;
vidDevice = imaq.VideoDevice('winvideo', 1, 'YUY2_640x480', ... % Acquire input video stream
                    'ROI', [1 1 640 480], ...
                    'ReturnedColorSpace', 'rgb');
vidInfo = imaqhwinfo(vidDevice);
nFrame = 0

while(nFrame<1)
rgbFrame = step(vidDevice); % Acquire single frame
rgbFrame = flipdim(rgbFrame,2);
BB = step(FDetect,rgbFrame);

 figure,
 imshow(rgbFrame);

 hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
for i = 1:size(BB,1)
 J= imcrop(rgbFrame,BB(i,:));
figure(3),subplot(2,2,i);
imshow(J);
   savename = strcat( n ,num2str(counter), '.jpg'); %this is where and what your image will be saved
imwrite(J, savename);
counter = counter +1;
end
title('Face Detection');
nFrame=nFrame+1;
end
clear vidDevice ;
clc ;
openfig('PFUNC.fig');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
openfig('dataent.fig');

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
