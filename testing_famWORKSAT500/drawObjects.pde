void drawEdge(String id1, String id2)
{
  TableRow airport1 = airportLocation.findRow(id1, "FAA");
  TableRow airport2 = airportLocation.findRow(id2, "FAA");
  
  //float c = airport1.getFloat("Color");
  //float c1 = airport2.getFloat("Color");
  
  //float longitudeAirport1 = airport1.getFloat("Longitude");
  //float latitudeAirport1 = airport1.getFloat("Latitude");
  //float longitudeAirport2 = airport2.getFloat("Longitude");
  //float latitudeAirport2 = airport2.getFloat("Latitude");
  

  float x1 = map(airport1.getFloat("Longitude"),geoMap.getMinGeoX(),geoMap.getMaxGeoX(),0,width);
  float y1 = map(airport1.getFloat("Latitude"),geoMap.getMinGeoY(),geoMap.getMaxGeoY(),height,0); 
  float x2 = map(airport2.getFloat("Longitude"),geoMap.getMinGeoX(),geoMap.getMaxGeoX(),0,width);
  float y2 = map(airport2.getFloat("Latitude"),geoMap.getMinGeoY(),geoMap.getMaxGeoY(),height,0); 
  
  //PVector xy = geoMap.geoToScreen(longitudeAirport1, latitudeAirport1);
  //String pv = xy + "";
  //String[] list = splitTokens(pv);
  //String f = list[1] + list[2];
  //String[] q = splitTokens(f, ", ");
  //float sx = float(q[0]);
  //float sy = float(q[1]);
  //println(xy + " = " + q[0] + " " + q[1] + "        " + sx + " " + sy);

  float curveAngle = radians(-90);
  float x = (x1-x2)/4f;
  float y = (y1-y2)/4f;
 
  float cx = x2 + x*cos(curveAngle) - y*sin(curveAngle);
  float cy = y2 + y*cos(curveAngle) + x*sin(curveAngle);
  noFill();
  //stroke(((c+c1)/5), 100-((c+c1)/6), 100-((c+c1)/2));
  stroke(57, 255, 20);
  strokeWeight(0.3);
  bezier(x1, y1, cx, cy, x2, y2, x2, y2);
  
 
}