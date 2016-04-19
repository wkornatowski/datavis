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
      startAirport = textInput.getText();
    }
  }
  
  loop();
}

void mouseMoved()
{
  mouseMovedMsg ="The mouse has been moved from "+pmouseX+","+pmouseY+" to "+mouseX+","+mouseY;
}