import intel.pcsdk.*;

PXCUPipeline session;
String[] commands = {"shang", "xia", "zuo" , "you"};
void setup()
{
  size(640, 480);
  ellipseMode(RADIUS); 
  session = new PXCUPipeline(this);
  session.Init(PXCUPipeline.VOICE_RECOGNITION);  
  session.SetVoiceCommands(commands);
}

int x = 320;
int y = 240 ;
void draw()
{
  background(0);
  textSize(20); 
  text("Say mandarin : 'up' or 'down' or 'left' or 'right'", 5, 15);
  textSize(30);
  
  if(session.AcquireFrame(true))
  {
    PXCMVoiceRecognition.Recognition recoData = new PXCMVoiceRecognition.Recognition();
    if(session.QueryVoiceRecognized(recoData))
      ParseCommand(recoData.dictation);      
    session.ReleaseFrame();
  }
    
  ellipse(x,y,50,50) ;
  
}

void ParseCommand(String command)
{
  println(command) ;
  if(command.equals("shang"))
    y = y-20 ;
  else if(command.equals("xia"))
    y = y+20 ;
  else if(command.equals("you"))
    x = x+20 ;
  else if(command.equals("zuo"))
    x = x-20 ;

}

