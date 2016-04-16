
PImage worldMap;
Table airportLocation;
Table routes;
int startAir = 1;
String start;
String finish;

void setup()
{
  size(1920,1080);
   
  // Load the background map.
  worldMap = loadImage("worldCountries.png");
   
  // Load data from table
  airportLocation = loadTable("airportLocations.csv","header,csv");
  routes = loadTable("routes.csv","header,csv");
}

void draw()
{
  background(255);
   
  // Draw the background image taking up the full width and height of sketch.
  image(worldMap,0,0,width,height);
  filter(INVERT);
   
  // Set the appearance of the data circles.
  fill(192,0,0);
  noStroke();
  
  for (TableRow row : airportLocation.rows())
  {
    
    float latitude  = row.getFloat("Latitude");
    float longitude = row.getFloat("Longitude");
    float x = map(longitude,-180,180,0,width);
    float y = map(latitude,-60,85,height,0); 
    
    ellipse(x,y,1.5,1.5);
    
  }
  
  for(int row = 0; row<30050; row++)
  {
    TableRow sRow = airportLocation.findRow(routes.getString(row, "Start"), "FAA");
    TableRow fRow = airportLocation.findRow(routes.getString(row, "Finish"), "FAA");
    
    println(row);
    println(sRow.getString("FAA"));
    println(fRow.getString("FAA"));
    
    if(sRow.getString("FAA").equals(routes.getString(row, "Start")) && fRow.getString("FAA").equals(routes.getString(row, "Finish"))  == true)
    {
      println("True");
    }
    else
      println("False");
    
  }
  
  noLoop();
  
  

 //for (int row=0; row<2; row++)
 // {
 // if(airportLocation.findRow(routes.getString(row, "Start"), "FAA") )
 // {
 // start = routes.getString(row, "Start"); 
 // println(start);
 // }
 // if(airportLocation.findRow(routes.getString(row, "Finish"), "FAA"))
 // {
 // finish = routes.getString(row, "Finish"); 
 // println(finish);
 // }
 // println(finish);
 // println(row + " " + start + "->" +finish);
  
 // drawEdge(start,finish);
 // }
}

//void drawEdge(String id1, String id2)
void drawEdge(String id1, String id2)
{

  //Fine the node positions of the two nodes to link
  TableRow airport1 = airportLocation.findRow(id1, "FAA");
  TableRow airport2 = airportLocation.findRow(id2, "FAA");
  
  //float c = airport1.getFloat("Color");
  //float c1 = airport2.getFloat("Color");

  float x1 = map(airport1.getFloat("Longitude"),-180,180,0,width);
  float y1 = map(airport1.getFloat("Latitude"),-60,85,height,0);
  float x2 = map(airport2.getFloat("Longitude"),-180,180,0,width);
  float y2 = map(airport2.getFloat("Latitude"),-60,85,height,0);
  
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