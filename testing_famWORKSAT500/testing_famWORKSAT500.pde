import org.gicentre.utils.*;    // For text input.
import org.gicentre.geomap.*;

GeoMap geoMap;

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
  
  //geoMap = new GeoMap(this);
  //geoMap.readFile("world");
   
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
  // Draw the background image taking up the full width and height of sketch.
  image(worldMap,0,0,width,height);
  filter(INVERT);
  
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
  text("Airport IATA code: ",10,10);
  
  
  loadRoutes();
  noLoop();
}