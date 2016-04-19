void loadRoutes()
{
  if(isFinished == false)
  {
  textInput.draw(10,40);
  }
  
  else
  {
    //FIND "Start" LHR and get all possible finish routes.
    for(int row = 0; row<routes.getRowCount(); row++)
      {
        if(routes.getString(row, "Start").equals(startAirport))
           {
             
             TableRow finishResults = airportLocation.findRow(routes.getString(row, "Finish"), "FAA");
             TableRow startResults = airportLocation.findRow(startAirport, "FAA");
             
             if(finishResults == null)
             {
               println("null");
             }
             else
             {
               println(startAirport);
               println(routes.getString(row, "Finish"));
               drawEdge(startAirport, routes.getString(row, "Finish"));
                
                strokeWeight(0.1);
                stroke(0);
                fill(255,255,255);
                rect(740,920,300,150,8);
                textAlign(LEFT, TOP);
                fill(0);
                text("Airport: " + startResults.getString("Name") + 
                     "\n" + 
                     "City: " + startResults.getString("City") +
                     "\n" +
                     "Country: " + startResults.getString("Country") +
                     "\n" + 
                     "IATA: " + startResults.getString("FAA") +
                     "\n" +
                     "Timezone: " + startResults.getString("Timezone"),760,930);
               
               
             }
           }
  
      }
  
  }  
}

void loadLocations()
{
  int counter = 0;
  for (TableRow row : airportLocation.rows())
  {
    
    float latitude  = row.getFloat("Latitude");
    float longitude = row.getFloat("Longitude");
    float x = map(longitude,-180,180,0,width);
    float y = map(latitude,-60,85,height,0); 
    counter++;
    println(counter);
    ellipse(x,y,1.5,1.5);
    
  }
  
  
}