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
      if(textInput.getText().equals("EVERTHING") || textInput.getText().equals("everything") || textInput.getText().equals("Everything"))
        all = true;
      else
       startAirport = textInput.getText();
    }
  }
  if (key == 's') save("flights.png");
  
  loop();
}