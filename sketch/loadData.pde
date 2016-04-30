void loadRoutes()
{
  int routeCount = 0;
  for (int row = 0; row<routes.getRowCount(); row++)
  {
    // routes
    if (all == true)
      {
          //String s = routes.getString(row, "Start");
          String s = routes.getString(row, "Start");
          println(s);
          String f = routes.getString(row, "Finish");
          println(f);
          TableRow startResults1 = airportLocation.findRow(s, "FAA");
          TableRow finishResults1 = airportLocation.findRow(f, "FAA");

          if (startResults1 == null || finishResults1 == null)
          {
           println("Double Null");
          } 
          else 
          {
            drawEdge(s, f);
            routeCount++;
             strokeWeight(0.1);
             stroke(0);
             fill(255, 255, 255);
             rect(width/2-100, height-60, 300, 50, 8);
             textAlign(LEFT, TOP);
             fill(0);
             text("Destinations Available: " + routeCount, width/2-95, height-60);
          }
          
        }
       
    else if (routes.getString(row, "Start").equals(startAirport))
    {

     TableRow finishResults = airportLocation.findRow(routes.getString(row, "Finish"), "FAA");
     TableRow startResults = airportLocation.findRow(startAirport, "FAA");

     if (finishResults == null)
     {
       println("null");
     } 
     else  
      {
         //println(startAirport);
         //println(routes.getString(row, "Finish"));
         drawEdge(startAirport, routes.getString(row, "Finish"));
         routeCount++;
         strokeWeight(0.1);
         stroke(0);
         fill(255, 255, 255);
         rect(width/2-100, height-160, 300, 150, 8);
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
           "Timezone: " + startResults.getString("Timezone") +
           "\n" +
           "Destinations Available: " + routeCount, width/2-95, height-160);
       }
     }
  }
}
  
 
  void loadLocations()
  {
    //int counter = 0;
    for (TableRow row : airportLocation.rows())
    {

      float latitude  = row.getFloat("Latitude");
      float longitude = row.getFloat("Longitude");
      float x = map(longitude, geoMap.getMinGeoX(), geoMap.getMaxGeoX(), 0, width);
      float y = map(latitude, geoMap.getMinGeoY(), geoMap.getMaxGeoY(), height, 0); 
      //counter++;
      //println(counter);
      ellipse(x, y, 1.5, 1.5);
    }
  }