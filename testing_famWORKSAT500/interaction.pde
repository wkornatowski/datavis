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
  if (key == 's') save("flights.png");
  
  loop();
}