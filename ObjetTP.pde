class ObjetTP {
  PVector pointA, pointB, pointC, pointD;
  PVector pointE, pointF, pointG, pointH;
  PImage imageUp = null;
  PImage imageDown = null;
 PImage imageFace = null;
  PImage imageDerriere = null;
  PImage imageGauche = null;
  PImage imageDroite = null;
  float rotateX = 0.0;
  float rotateY = 0.0;
  float rotateZ = 0.0;
  int translateX = 0;
  int translateY = 0;
  int translateZ = 0;
  int[] colors = new int[3];
  String name;
   ObjetTP(String n, PVector pointA, PVector pointB, PVector pointC, PVector pointD,  PVector pointE, PVector pointF, PVector pointG, PVector pointH) {
    this.pointA = pointA;
    this.pointB = pointB;
    this.pointC = pointC;
    this.pointD = pointD;
    this.pointE = pointE;
    this.pointF = pointF;
    this.pointG = pointG;
    this.pointH = pointH;
    this.imageUp = null;
    this.imageDown = null;
    this.imageFace = null;
    this.imageDerriere = null;
    this.imageGauche = null;
    this.imageDroite = null;
    this.colors[0] = 255;
    this.colors[1] = 0;
    this.colors[2] = 0;
    this.name = n;
    
  }
  public PVector getpointA() { return pointA; }
  public void setpointA(PVector point) { this.pointA = point; }
  
  public String getName() { return name; }
  public void setName(String n) { this.name = n;   }
  
  public PVector getpointB() { return pointB; }
  
  public void setpointB(PVector point) { this.pointB = point; }
  
  public PVector getpointC() { return pointC; }
  
  public void setpointC(PVector point) { this.pointC = point; }
  
  public PVector getpointD() { return pointD; }
  
  public void setpointD(PVector point) { this.pointD = point; }
  
  public PVector getpointE() { return pointE; }
 
  public void setpointE(PVector point) { this.pointE = point; }
  
  public PVector getpointF() { return pointF; }
  
  public void setpointF(PVector point) { this.pointF = point; }
  
  public PVector getpointG() { return pointG; }
  
  public void setpointG(PVector point) { this.pointG = point; }
  
  public PVector getpointH() { return pointH; }
  
  public void setpointH(PVector point) {  this.pointH = point; }
  
  public PImage getImageUp() { return imageUp; }
  
   public void setImageUp(PImage imageUp) { this.imageUp = imageUp; }
  
  public PImage getImageDown() { return imageDown; }
  
  public void setImageDown(PImage imageDown) { this.imageDown = imageDown; }
  
  public PImage getImageFace() { return imageFace; }
  
  public void setImageFace(PImage imageFace) { this.imageFace = imageFace; }
  
  public PImage getImageDerriere() { return imageDerriere; }
  
  public void setImageDerriere(PImage imageDerriere) { this.imageDerriere = imageDerriere; }
  
  public PImage getImageGauche() { return imageGauche; }
  
  public void setImageGauche(PImage imageGauche) { this.imageGauche = imageGauche; }
  
  public PImage getImageDroite() { return imageDroite; }
  
  public void setImageDroite(PImage imageDroite) { this.imageDroite = imageDroite; }
  
   public int[] getColors() { return colors; }
  
  public int getColor(int x) { return colors[x]; }
  
  public int getColorR() { return colors[0]; }
  
  public int getColorG() { return colors[1]; }
  
  public int getColorB() { return colors[2]; }
  
  public void setColorR(int x) { colors[0] = x; }
  
  public void setColorG(int x) { colors[1] = x; }
  
  public void setColorB(int x) { colors[2] = x; }
  
  public void setColors(int[] colors) { this.colors = colors; }
  
  public float getRotateX() { return rotateX; }
  
  public void setRotateX(float rot) { this.rotateX = rot; }
  
  public float getRotateY() { return rotateY; }
  
  public void setRotateY(float rot) { this.rotateY = rot; }
  
  public float getRotateZ() { return rotateZ; }
  
  public void setRotateZ(float rot) { this.rotateZ = rot; }
  
  public int getTranslateX() { return translateX; }
  
  public void setTranslateX(int tran) { this.translateX = tran; }
  
  public int getTranslateY() { return translateY; }
  
  public void setTranslateY(int tran) { this.translateY = tran; }
 
 public int getTranslateZ() { return translateZ; }
  
  public void setTranslateZ(int tran) { this.translateZ = tran; }
 
}
