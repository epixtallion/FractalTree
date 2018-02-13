private double fractionLength = .76;
private int smallestBranch = 10;
private double branchAngle = .2;
private Snowball[] snow = new Snowball[20];
public void setup()
{
	size(640,480);
	noLoop();
}
public void draw()
{
	background(186, 231, 242);
	fill(202, 239, 184);
	noStroke();
	rect(0, 380, 640, 180);
	stroke(86, 81, 67);
	line(320,380,320,350);
	drawBranches(320,350,90,0);
	for (int i = 0; i < snow.length; i++)
		snow[i] = new Snowball((int) (Math.random()*646), 0);
}
public void drawBranches(int x,int y, double branchLength, double angle)
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
	for (Snowball s : snow){
		snow.move();
		snow.show();
	}
}

class Snowball {
	int myX, myY;
	public Snowball(x, y){
		myX = x;
		myY = y;
	}
	public void move(){
		myX -= Math.sin(radians(15))*2;
		myY += Math.cos(radians(15))*2;
	}
	public void show(){
		strokeWeight(6);
		fill(255);
		point(myX, myY);
	}
}
