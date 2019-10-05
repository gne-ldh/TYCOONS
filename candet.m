function varargout = candet(varargin)
% CANDET MATLAB code for candet.fig
%      CANDET, by itself, creates a new CANDET or raises the existing
%      singleton*.
%
%      H = CANDET returns the handle to a new CANDET or the handle to
%      the existing singleton*.
%
%      CANDET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CANDET.M with the given input arguments.
%
%      CANDET('Property','Value',...) creates a new CANDET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before candet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to candet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help candet

% Last Modified by GUIDE v2.5 01-Oct-2019 20:33:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @candet_OpeningFcn, ...
                   'gui_OutputFcn',  @candet_OutputFcn, ...
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


% --- Executes just before candet is made visible.
function candet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to candet (see VARARGIN)

% Choose default command line output for candet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes candet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = candet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
winopen('Registration_Details.xls');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
clc 
clear all 
close all
home 
filename = 'Registration_Details.xls';
[num,txt] = xlsread(filename)
len=length(txt)

blankimage = imread('Certificate.tif');
for i=1:len
    for j= 2:2 
        text_names(i,j)=txt(i,j)
    end
end

for i=1:len
    for j= 3:3
      text_topic(i,j)=txt(i,j)
    end
end
for i=2:len
        text_all=[text_names(i,2) text_topic(i,3)]
        position = [380 560;485 660];        
        RGB = insertText(blankimage,position,text_all,'FontSize',40,'BoxOpacity',0);
        figure
        imshow(RGB)         
        y=i+1
        filename=['Certificate' num2str(y)]
        lastf=[filename '.tif']
        saveas(gcf,lastf)
   
end   

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clear all ;
clc
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
openfig('main.fig')

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton4 and none of its controls.
function pushbutton4_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
winopen('Registration_Details.xls');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
