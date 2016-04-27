void keyPressed()
{
  if ((key == RETURN) || (key == ENTER))
  {
    isFinished = !isFinished;
    textInput.setText(null);
  }
  else
  {
    if (!isFinished) 
    {
      textInput.keyPressed();
      if(textInput.getText().equals("EVERTHING") || textInput.getText().equals("everything") || textInput.getText().equals("Everything"))
        all = true;
      else if(textInput.getText().equals("HELP") || textInput.getText().equals("help") || textInput.getText().equals("Help"))
      {
        help = true;
        
      }
      else 
       {
         startAirport = textInput.getText();
         all = false;
         help = false;
       }
    }
  }
  if (key == 's') save("flights.png");
  
  loop();
}