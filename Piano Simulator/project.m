function  project()
%initialize option equal to 1 to enter the loop
option = 1;
%option 1 is the simulated piano keyboard
%option 2 is the musical plyer
%option 3 is used for stoping the music which is being played
%option4 is used to quit the program
while (option == 1 || option ==2 ||option == 3)
    option = input('Do you want to play piano or listen to music. 1 play; 2 listen; 3.stop music; 4.quit ');
if (option == 1)
disp('hint: using number 0 to quit playing piano')
%count is used to store the number of musical notation you played
%rv is the corresponding staff notation.
count = 0;
rv=[];
%rv =  sin(2*pi*freq*sampletimes);
%sound(do);
%initialize p to '1'
%p is the musical notation simulated on the keyboard
p='1';
while (p=='1' || p=='2' || p=='3' || p=='4' || p=='5' || p=='6' || p=='7' ||p=='q' ||p=='w' ||p=='e' ||p=='r' ||p=='t' ||p=='y' ||p=='u'  )
    count = count + 1 ;
    %n=input('');
    %read the picture of a piano keyboard
    i=imread('71+JRdEqyyL._SL1500_.jpg');
    figure(1)
    subplot(2,1,1)
    imshow(i)
      w = waitforbuttonpress;
   %play piano without a enter
  if w
    p = get(gcf, 'CurrentCharacter');
    %distiguish each notation from 1 to 7 and q to u
  end
     if (p=='1')
        duration = 0.3;
        freq = 523;
        rv(count) = 0;
    end
    if (p=='2')
        duration = 0.3;
        freq = 578;
        rv(count) = 0.5;
    end
    if (p=='3')
        duration = 0.3;
        freq = 659;
        rv(count) = 1;
    end
    if (p=='4')
        duration = 0.3;
        freq = 698;
        rv(count) = 1.5;
    end
    if (p=='5')
        duration = 0.3;
        freq = 784;
        rv(count) = 2;
    end
    if (p=='6')
        duration = 0.3;
        freq = 880;
        rv(count) = 2.5;
    end
    if (p=='7')
        duration = 0.3;
        freq = 988;
        rv(count) = 3;
    end
    
    if (p=='q')
        duration = 0.3;
        freq = 1046;
        rv(count) = 3.5;
    end
    
    if (p=='w')
        duration = 0.3;
        freq = 1175;
        rv(count) = 4;
    end
    
    if (p=='e')
        duration = 0.3;
        freq = 1318;
        rv(count) = 4.5;
    end
    
    if (p=='r')
        duration = 0.3;
        freq = 1397;
        rv(count) = 5;
    end
    
    if (p=='t')
        duration = 0.3;
        freq = 1568;
        rv(count) = 5.5;
    end
    
    if (p=='y')
        duration = 0.3;
        freq = 1760;
        rv(count) = 6;
    end
    
    if (p=='u')
        duration = 0.3;
        freq = 1976;
        rv(count) = 6.5;
    end
    
    sampletimes = (0:duration*8192-1)/8192;
    
    %play the sound you played
    if(p=='1' || p=='2' || p=='3' || p=='4' || p=='5' || p=='6' || p=='7' ||p=='q' ||p=='w' ||p=='e' ||p=='r' ||p=='t' ||p=='y' ||p=='u'  )
    sound(sin(2*pi*freq*sampletimes));
    end
end
    
%if you quit the piano simulated system
disp('you are down')

%making the staff of the melody you played
subplot(2,1,2)
title('stave of the melody you played')
line([0,count],[1,1],'LineWidth',6)
hold on

line([0,count],[2,2],'LineWidth',6)
hold on

line([0,count],[3,3],'LineWidth',6)
hold on

line([0,count],[4,4],'LineWidth',6)
hold on

line([0,count],[5,5],'LineWidth',6)
hold on

plot([0,count],[0,0],'--')
hold on

plot([0,count],[0.5,0.5],'--')
hold on

plot([0,count],[1.5,1.5],'--')
hold on

plot([0,count],[2.5,2.5],'--')
hold on

plot([0,count],[3.5,3.5],'--')
hold on

plot([0,count],[4.5,4.5],'--')
hold on

plot([0,count],[5.5,5.5],'--')
hold on

for i = 1:count-1
    
    plot(i, rv(i),'o','LineWidth',3)
end
end
%musical player system
if(option==2)
    option2 = input('what language you want to listen. 1 Chinese; 2 English; 3.lingua italiana: ');
    if(option2 ==1)
    [bfs,Fs] = audioread('chineseflower.wav');
    bfss = chspectrum(bfs,@(F) bandstop(F,[2000,4000]),Fs);
    sound(bfss,Fs)
    end
    
    if(option2==2)
    [bfs,Fs] = audioread('Bruno Mars - Uptown Funk.wav');
    bfss = chspectrum(bfs,@(F) bandstop(F,[2000,4000]),Fs);
    sound(bfss,Fs)
    end
    
    if(option2==3)
    [bfs,Fs] = audioread('Juventus.wav');
    bfss = chspectrum(bfs,@(F) bandstop(F,[2000,4000]),Fs);
    sound(bfss,Fs)
    end
    
end

%used to quit the music you are listening
if (option == 3)
    clear sound
    disp('sound stop')
end
%quit the whole system
if(option==4)
    clear sound
    figure(2)
    o=imread('goodbye-Fotolia_79719245_S-stanciuc-600x375.jpg');
    imshow(o)
end
end
end