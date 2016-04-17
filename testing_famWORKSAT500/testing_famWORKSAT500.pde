import org.gicentre.utils.*;    // For text input.

PImage worldMap;
Table airportLocation;
Table routes;
int startAir = 1;
String start;
String finish;
TextInput textInput;    // User input.
boolean isFinished;
String startAirport;
String mouseMovedMsg="";

void setup()
{
  size(1920,1080);
   
  // Load the background map.
  worldMap = loadImage("worldCountries.png");
  
  //Font
  PFont font = createFont("sans-serif",14);
  textFont(font);
  textInput = new TextInput(this,font,14);
  isFinished = false;
   
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
  
  // Draw user input area
  strokeWeight(0.1);
  stroke(0);
  fill(255,255,255);
  rect(5,5,215,60,8);
  
  textAlign(LEFT,TOP);
  fill(0);
  text("Airport IATA code: ",10,10);
  
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
                rect(740,920,500,150,8);
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
               loop();
               
             }
           }
  
      }
  
  }
  noLoop();
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