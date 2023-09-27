function varargout = Vending_GUI_2(varargin)
% VENDING_GUI_2 MATLAB code for Vending_GUI_2.fig
%      VENDING_GUI_2, by itself, creates a new VENDING_GUI_2 or raises the existing
%      singleton*.
%
%      H = VENDING_GUI_2 returns the handle to a new VENDING_GUI_2 or the handle to
%      the existing singleton*.
%
%      VENDING_GUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VENDING_GUI_2.M with the given input arguments.
%
%      VENDING_GUI_2('Property','Value',...) creates a new VENDING_GUI_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Vending_GUI_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Vending_GUI_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Vending_GUI_2

% Last Modified by GUIDE v2.5 05-May-2016 14:36:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Vending_GUI_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Vending_GUI_2_OutputFcn, ...
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


% --- Executes just before Vending_GUI_2 is made visible.
function Vending_GUI_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Vending_GUI_2 (see VARARGIN)

% Choose default command line output for Vending_GUI_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Vending_GUI_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
imshow('Pepsi.jpg')

axes(handles.axes2);
imshow('Coke.jpg')




% --- Outputs from this function are returned to the command line.
function varargout = Vending_GUI_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Pepsi.
function Pepsi_Callback(hObject, eventdata, handles)
% hObject    handle to Pepsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

COM_CloseNXT('all')
close all
clear all
clc
COM_SetDefaultNXT(COM_OpenNXT())

p = 570; %The light value for a blue pepsi can falls under 590 according to the light sensor.
m = NXTMotor( [MOTOR_A; MOTOR_B] ); %moves robot forward
        m.Power = 50;
        m.TachoLimit = 250; %the robot travels 4 1/2 inches, cans should be 3 in apart
        m.SendToNXT() 
        m.WaitFor()    
OpenLight( SENSOR_4, 'ACTIVE' )
r=GetLight( SENSOR_4 ) % Returns number 0 - 1023
CloseSensor( SENSOR_4 )
        if  r <= p
       m = NXTMotor( [ MOTOR_C] ); %Moves the arm
       m.Power = -100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor() 
       m.Power = 100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor()
       m = NXTMotor( [MOTOR_A; MOTOR_B] ); %This moves the robot back to the start
        m.Power = -50; 
        m.TachoLimit = 250; 
        m.SendToNXT() 
        m.WaitFor() 
       
        else
        m = NXTMotor( [MOTOR_A; MOTOR_B] ); 
        m.Power = 50;
        m.TachoLimit = 250; %the robot travels 4 1/2 inches, cans should be 3 in apart
        m.SendToNXT() 
        m.WaitFor()    
        m = NXTMotor( [ MOTOR_C] );
       m.Power = -100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor() 
       m.Power = 100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor()
      
       m = NXTMotor( [MOTOR_A; MOTOR_B] ); %This moves the robot back to the start
        m.Power = -50; 
        m.TachoLimit = 500; 
        m.SendToNXT() 
        m.WaitFor() 
        end


% --- Executes on button press in Coke.
function Coke_Callback(hObject, eventdata, handles)
% hObject    handle to Coke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

COM_CloseNXT ('all')
close all
clear all
clc
COM_SetDefaultNXT(COM_OpenNXT())

c = 590; %The light value for a red coke can falls over 600 according to the light sensor.
m = NXTMotor( [MOTOR_A; MOTOR_B] ); %moves robot forward
        m.Power = 50;
        m.TachoLimit = 250; %the robot travels 4 1/2 inches, cans should be 3 in apart
        m.SendToNXT() 
        m.WaitFor()    
OpenLight( SENSOR_4, 'ACTIVE' )
r=GetLight( SENSOR_4 ) % Returns number 0 - 1023
CloseSensor( SENSOR_4 )
        if  r >= c
       m = NXTMotor( [ MOTOR_C] ); %Moves the arm
       m.Power = -100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor() 
       m.Power = 100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor()
       m = NXTMotor( [MOTOR_A; MOTOR_B] ); %This moves the robot back to the start
        m.Power = -50; 
        m.TachoLimit = 250; 
        m.SendToNXT() 
        m.WaitFor() 
        else
        m = NXTMotor( [MOTOR_A; MOTOR_B] ); %moves robot forward
        m.Power = 50;
        m.TachoLimit = 250; %the robot travels 4 1/2 inches, cans should be 3 in apart
        m.SendToNXT() 
        m.WaitFor()    
        m = NXTMotor( [ MOTOR_C] ); %moves the arm
       m.Power = -100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor() 
       m.Power = 100; 
       m.TachoLimit = 120; 
       m.SendToNXT() 
       m.WaitFor()
       m = NXTMotor( [MOTOR_A; MOTOR_B] ); %This moves the robot back to the start
        m.Power = -50; 
        m.TachoLimit = 500; 
        m.SendToNXT() 
        m.WaitFor() 
        end
