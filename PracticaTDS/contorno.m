vid = videoinput('winvideo',1,'RGB24_352x288');
preview(vid)
colormap(gray)
[f1,f2] = freqspace(11,'meshgrid');
Hd = ones(11);
r = sqrt(f1.^2 + f2.^2);
Hd((r<0.6)) = 0
while(1)
frame1=getsnapshot(vid);
Igris=rgb2gray(frame1);
level=graythresh(Igris);
Ibw=im2bw(Igris,level);
h = fwind1(Hd,hamming(11));
If=abs(filter2(h,Ibw));
imagesc(If)
end


figure; % Ensure smooth display
set(gcf,'doublebuffer','on');
config = triggerinfo(vid)
triggerconfig(vid,'manual')
set(vid,'FramesperTrigger',2)
isrunning(vid)
islogging(vid)

while(1)
    start(vid)
    trigger(vid)
    %while(vid.FramesAcquired<=100 & vid.FramesAvailable>0)
        data = getdata(vid,2); 
        diff_im = imabsdiff(data(:,:,:,1),data(:,:,:,2));
        imshow(diff_im);
        %pause(300)
    %end
    
    
end
stop(vid)
%Detector de movimiento
while(1)
frame1=getsnapshot(vid);
frame2=getsnapshot(vid);
If=imabsdiff(frame1,frame2);
% If=abs(frame1-frame2);
imagesc(If)
end

