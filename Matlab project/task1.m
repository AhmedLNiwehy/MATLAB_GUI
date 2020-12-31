function varargout = task1(varargin)
% TASK1 MATLAB code for task1.fig
%      TASK1, by itself, creates a new TASK1 or raises the existing
%      singleton*.
%
%      H = TASK1 returns the handle to a new TASK1 or the handle to
%      the existing singleton*.
%
%      TASK1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK1.M with the given input arguments.
%
%      TASK1('Property','Value',...) creates a new TASK1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before task1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to task1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task1

% Last Modified by GUIDE v2.5 01-Jan-2021 01:08:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task1_OpeningFcn, ...
                   'gui_OutputFcn',  @task1_OutputFcn, ...
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


% --- Executes just before task1 is made visible.
function task1_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to task1 (see VARARGIN)

% Choose default command line output for task1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = task1_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Input_Signal_Edit_Callback(~, ~, ~)
% hObject    handle to Input_Signal_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Input_Signal_Edit as text
%        str2double(get(hObject,'String')) returns contents of Input_Signal_Edit as a double


% --- Executes during object creation, after setting all properties.
function Input_Signal_Edit_CreateFcn(hObject, ~, ~)
% hObject    handle to Input_Signal_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Time_domain.
function Display_Time_Domain_Callback(~, ~, handles)
% hObject    handle to Display_Time_Domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.Input_Signal_Edit,'string');
x=-10:0.001:10;
y=-10:0.001:10;
t=-10:0.001:10;
axes(handles.axes1)
plot(eval(a))



function Power_Edit_Callback(~, ~, ~)


% --- Executes during object creation, after setting all properties.
function Power_Edit_CreateFcn(hObject, ~, ~)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(~, ~, ~)

% --- Executes on button press in power.
function Calculate_Power_Callback(~, ~, handles)
% hObject    handle to Calculate_Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms f t T y x z pow;
a=get(handles.Input_Signal_Edit,'string');
f=eval(a);
f=f*conj(f);
f=matlabFunction(f);
z(T)=int(f,-T,T)/(2*T);
pow=limit(z(T),T,inf);
set(handles.Power_Edit,'string',char(pow))


% --- Executes on button press in Sampled.
function Display_Sample_Version_Callback(hObject, eventdata, handles)
% hObject    handle to Display_Sample_Version (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.Input_Signal_Edit,'string');
t = 0:10:1000;
t = t * 3.14 * ( str2double( get(handles.Signal_Frequency_Edit,'string') ) / pi * str2double( get(handles.Sample_Frequency_Edit,'string') ) );
axes(handles.axes1);
stem(eval(a));


function Sample_Frequency_Edit_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Sample_Frequency_Edit_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Signal_Frequency_Edit_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function Signal_Frequency_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Signal_Frequency_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Display_Laplace.
function Display_Laplace_Callback(hObject, eventdata, handles)
% hObject    handle to Display_Laplace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms t s x y z;
a=get(handles.Input_Signal_Edit,'string');
f=eval(a);
l=laplace(f);
s=0:0.01:10;
axes(handles.axes1);
plot(eval(l));

% --- Executes on button press in Ztrans.
function Calculate_ZTransform_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_ZTransform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms t n z m T;
a=get(handles.Input_Signal_Edit,'string');
f = eval(a);
set( handles.ZTransform_Edit,'string',char(ztrans(f,t,z)) );




% --- Executes on button press in poles.
function Dispaly_Zeros_Poles_Callback(hObject, eventdata, handles)
% hObject    handle to Dispaly_Zeros_Poles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms t f trans n z m T;
a=get(handles.Input_Signal_Edit,'string');
f = eval(a);
F = ztrans(f,t,z);
F2 = collect(F);    %Collect the coefficients of a symbolic expression
[num,den] = numden(F2);
Ts = 0.1; % Sampling period
H = tf(sym2poly(num),sym2poly(den),Ts);   %creates a discrete-time transfer function model
axes(handles.axes1);
pzmap(H);                      %pzmap(sys) creates a pole-zero plot of the continuous or discrete-time


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in conversion.
function Convert_To_Digital_Callback(hObject, eventdata, handles)
% hObject    handle to Convert_To_Digital (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=100; % range signal from 0 to 100
n=8;    % number of bits
q=f/(2^n-1); % quantization interval
t =(0:.1:10);
a=(get(handles.Input_Signal_Edit,'string')); %  signal
%convert to a digital signal a0
x0=fix(a/q);
a0=dec2bin(x0,n);
set(handles.Digital_Code_Box,'string',a0);


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Digital_Code_Box.
function Digital_Code_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Digital_Code_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Digital_Code_Box contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Digital_Code_Box


% --- Executes during object creation, after setting all properties.
function Digital_Code_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Digital_Code_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
