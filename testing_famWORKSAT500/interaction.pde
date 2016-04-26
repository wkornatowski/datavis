void keyPressed()
{
  if ((key == RETURN) || (key == ENTER))
  {
    isFinished = !isFinished;
    //textInput.setText(null);
  }
  else
  {
    if (!isFinished) 
    {
      textInput.keyPressed();
      if(textInput.getText().equals("EVER"))
        all = true;
      else
       startAirport = textInput.getText();
    }
  }
  if (key == 's') save("flights.png");
  
  loop();
}