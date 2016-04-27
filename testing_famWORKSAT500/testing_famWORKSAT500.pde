import org.gicentre.utils.*;    // For text input.
import org.gicentre.geomap.*;

GeoMap geoMap;

//PImage worldMap;
Table airportLocation;
Table routes;
int startAir = 1;
String start;
String finish;
TextInput textInput;    // User input.
boolean isFinished;
String startAirport;
boolean all = false;
boolean help = false;
String mouseMovedMsg="";

void setup()
{
  size(1920,1080);
  //fullScreen();
  geoMap = new GeoMap(this);
  geoMap.readFile("world");
   
  // Load the background map.
  //worldMap = loadImage("worldCountries.png");
  
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
  background(0);  // Ocean colour
  stroke(255);               // Boundary colour
  fill(43,43,43);          // Land colour

  geoMap.draw();
  
  int id = geoMap.getID(mouseX, mouseY);
  if (id != -1)
    {
      fill(88, 116, 152);
      geoMap.draw(id);
      String name = geoMap.getAttributes().getString(id, 3);
      fill(255);
      text(name, mouseX+5, mouseY-5);
    }
  
  // Set the appearance of the data circles.
  fill(192,0,0);
  noStroke();
  
  loadLocations();   
  
  // Draw user input area
  strokeWeight(0.1);
  stroke(0);
  fill(255,255,255);
  rect(5,5,215,60,8);
  
  textAlign(LEFT,TOP);
  fill(0);
  text("Airport IATA/FFA code or \"Help\": ",10,10);
  
  
  //if(isFinished == false && help == true)
  //{
  //textInput.draw(10,40);
  //}
  //else {
  //  drawHelp();
  //}
  if(isFinished == false)
  {
  textInput.draw(10,40);
  }
  else
  {
    loadRoutes();
    drawHelp();
  }
  
  //loadRoutes();
  //noLoop();
}