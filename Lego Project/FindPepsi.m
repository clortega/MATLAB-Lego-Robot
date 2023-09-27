%Program: Vending Machine Robot
% Purpose: Locates blue Pepsi can and knocks it over
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
           
           
      
  

 
 