private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;
public void setup()
{
	size(640,480);
	noLoop();
}
public void draw()
{
	background(186, 231, 242);
	stroke(86, 81, 67);
	line(320,480,320,380);
	drawBranches(320,380,90,0);
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
}
