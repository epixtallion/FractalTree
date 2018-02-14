import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FractalTree extends PApplet {

private double fractionLength = .3f;
private int smallestBranch = 10;
private double branchAngle = .2f;
private Snowball[] snow = new Snowball[30];
public void setup()
{
	
	for (int i = 0; i < snow.length; i++)
		snow[i] = new Snowball((int) (Math.random()*646), (int) (Math.random()*484));
}
public void draw()
{
	background(186, 231, 242);
	stroke(86, 81, 67);
	strokeWeight(1);
	line(320,380,320,350);
	drawBranches(320,350,90,0);
	stroke(255);
	for (Snowball s : snow){
		s.move();
		s.show();
	}
	fill(202, 239, 184);
	noStroke();
	rect(0, 380, 640, 180);
	if(fractionLength <= 0.72f) fractionLength+=0.0005f;
}
public void drawBranches(int x, int y, double branchLength, double angle)
{
	if (branchLength < smallestBranch) return;
	int endX1 = (int) (Math.sin(angle+branchAngle)*branchLength+x);
	int endY1 = (int) (Math.cos(angle+branchAngle)*branchLength*-1+y);
	int endX2 = (int) (Math.sin(angle-branchAngle)*branchLength+x);
	int endY2 = (int) (Math.cos(angle-branchAngle)*branchLength*-1+y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	drawBranches(endX1,endY1,branchLength*fractionLength,angle+branchAngle);
	drawBranches(endX2,endY2,branchLength*fractionLength,angle-branchAngle);
}

class Snowball {
	int myX, myY;
	public Snowball(int x, int y){
		myX = x;
		myY = y;
	}
	public void move(){
		myX -= Math.sin(radians(15))*2;
		myY += Math.cos(radians(15))*2;
		if (myX <= 0) myX = 640;
		if (myY >= 480) myY = 0;
	}
	public void show(){
		strokeWeight(6);
		fill(255);
		point(myX, myY);
	}
}
  public void settings() { 	size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FractalTree" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
