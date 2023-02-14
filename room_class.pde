/*
  ===== Andoni ALONSO TORT =====
  UNIVERSITÉ DU HAVRE, NORMANDIE
              2023
*/


float angle = 0f;
int size = 200; 

float c = 600;
float camX = 0;
float camZ = 0;
float camY = 0;
float theta = 0; 
float zoom = 1500;

float r=0, g=0, b=0;

PImage floorImage;
PShader shaderTexture;

PShader colorShader;
PVector[] lightPos = { 
  new PVector(-100, 400, -200),
  new PVector(200, -200, -100)
};

PVector[] lightColor = {
  new PVector(255, 100, 0),
  new PVector(255, 255, 255)
};

// ===========  FLOOR ======================
PShape cubeFloor;
/*PVector pointA, pointB, pointC, pointD;
PVector pointE, pointF, pointG, pointH;*/
// =========================================

void setup() {
  size(600, 600, P3D);
  c = c/2;
  
  floorImage = loadImage("floor.jpg");
  shaderTexture = loadShader("Lambert1DiffuseFrag.glsl", "lightDifusseeVert.glsl");
  colorShader = loadShader("lightFrag.glsl", "lightVert.glsl");
  
  //cube = creerCube(100);
}


PShape creerComposite(float x, float y, float z) {
  
  PVector pointA = new PVector( -x, -y, z);
  PVector pointB = new PVector( x, -y, z);
  PVector pointC = new PVector( x, y, z);
  PVector pointD = new PVector( -x, y, z);
   
  PVector pointE = new PVector( -x, -y, -z);
  PVector pointF = new PVector( x, -y, -z);
  PVector pointG = new PVector( x, y, -z);
  PVector pointH = new PVector( -x, y, -z);
  ObjetTP obj = new ObjetTP(pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);  
  
  PShape group = createShape(GROUP);
    // Face 1
    PShape face_1 = createShape();
    face_1.beginShape(QUADS);
    face_1.textureMode(NORMAL);
    face_1.texture(floorImage);
    face_1.shininess(200);  
    face_1.emissive(0, 0, 0);
    face_1.specular(255, 255, 0);
    face_1.ambient(255, 255, 255);
    
    //face_1.stroke(0);
    
    PVector PA_n = new PVector(obj.getpointA().x, obj.getpointA().y, obj.getpointA().z).normalize();
    PVector PB_n = new PVector(obj.getpointB().x, obj.getpointB().y, obj.getpointB().z).normalize();
    PVector PC_n = new PVector(obj.getpointC().x, obj.getpointC().y, obj.getpointC().z).normalize();
    PVector PD_n = new PVector(obj.getpointD().x, obj.getpointD().y, obj.getpointD().z).normalize();
    PVector PE_n = new PVector(obj.getpointE().x, obj.getpointE().y, obj.getpointE().z).normalize();
    PVector PF_n = new PVector(obj.getpointF().x, obj.getpointF().y, obj.getpointF().z).normalize();
    PVector PG_n = new PVector(obj.getpointG().x, obj.getpointG().y, obj.getpointG().z).normalize();
    PVector PH_n = new PVector(obj.getpointH().x, obj.getpointH().y, obj.getpointH().z).normalize();
    
    //face_1.normal(0, 0, 1);
    face_1.normal(PA_n.x, PA_n.y, PA_n.z);
    face_1.normal(PB_n.x, PB_n.y, PB_n.z);
    face_1.normal(PC_n.x, PC_n.y, PC_n.z);
    face_1.normal(PD_n.x, PD_n.y, PD_n.z);
    
    creerPointInFigure(face_1, obj.getpointA(), 0, 0); // A
    creerPointInFigure(face_1, obj.getpointB(), 1, 0); // B
    creerPointInFigure(face_1, obj.getpointC(), 1, 1); // C
    creerPointInFigure(face_1, obj.getpointD(), 0, 1); // D
    face_1.endShape(CLOSE);
    group.addChild(face_1);
    
    PShape face_2 = createShape();
    face_2.beginShape(QUADS);
    face_2.textureMode(NORMAL);
    face_2.texture(floorImage);
    face_2.shininess(200.0);  
    face_2.emissive(0, 0, 0);
     face_2.specular(255, 255, 0);
    face_2.ambient(255, 255, 255);
    //face_2.normal(0, 0, 1);
    
    face_2.normal(PA_n.x, PA_n.y, PA_n.z);
    face_2.normal(PE_n.x, PE_n.y, PE_n.z);
    face_2.normal(PF_n.x, PF_n.y, PF_n.z);
    face_2.normal(PB_n.x, PB_n.y, PB_n.z);
    
    //face_2.stroke(0);
    creerPointInFigure(face_2, obj.getpointA(), 0, 0); // A
    creerPointInFigure(face_2, obj.getpointE(), 1, 0); // E
    creerPointInFigure(face_2, obj.getpointF(), 1, 1); // F
    creerPointInFigure(face_2, obj.getpointB(), 0, 1); // B
    
    face_2.endShape(CLOSE);
    group.addChild(face_2);
    
    PShape face_3 = createShape();
    face_3.beginShape(QUADS);
    face_3.textureMode(NORMAL);
    face_3.texture(floorImage);
    face_3.shininess(200.0);  
    face_3.emissive(0, 0, 0);
    face_3.specular(255, 255, 0);
    face_3.ambient(255, 255, 255);
    //face_3.normal(0, 0, 1);
    face_3.normal(PD_n.x, PD_n.y, PD_n.z);
    face_3.normal(PH_n.x, PH_n.y, PH_n.z);
    face_3.normal(PG_n.x, PG_n.y, PG_n.z);
    face_3.normal(PC_n.x, PC_n.y, PC_n.z);
    
    //face_3.stroke(0);
    creerPointInFigure(face_3, obj.getpointD(), 0, 0); // D
    creerPointInFigure(face_3, obj.getpointH(), 1, 0); // H
    creerPointInFigure(face_3, obj.getpointG(), 1, 1); // G
    creerPointInFigure(face_3, obj.getpointC(), 0, 1); // C
    face_3.endShape(CLOSE);
    group.addChild(face_3);
    
    PShape face_4 = createShape();
    face_4.beginShape(QUADS);
    face_4.textureMode(NORMAL);
    face_4.texture(floorImage);
    face_4.shininess(200.0);  
    face_4.emissive(0, 0, 0);
     face_4.specular(255, 255, 0);
    face_4.ambient(255, 255, 255);
    
    //face_4.normal(0, 0, 1);
    face_4.normal(PE_n.x, PE_n.y, PE_n.z);
    face_4.normal(PF_n.x, PF_n.y, PF_n.z);
    face_4.normal(PG_n.x, PG_n.y, PG_n.z);
    face_4.normal(PH_n.x, PH_n.y, PH_n.z);
    
    //face_4.stroke(0);
    creerPointInFigure(face_4, obj.getpointE(), 0, 0); // E
    creerPointInFigure(face_4, obj.getpointF(), 1, 0); // F
    creerPointInFigure(face_4, obj.getpointG(), 1, 1); // G
    creerPointInFigure(face_4, obj.getpointH(), 0, 1); // H
    face_4.endShape(CLOSE);
    group.addChild(face_4);
    
    PShape face_5 = createShape();
    face_5.beginShape(QUADS);
    face_5.textureMode(NORMAL);
    face_5.texture(floorImage);
    face_5.shininess(200);  
    face_5.emissive(0, 0, 0);
    face_5.specular(255, 255, 0);
    face_5.ambient(255, 255, 255);
    face_5.normal(0, 0, 1);
    
    face_5.normal(PA_n.x, PA_n.y, PA_n.z);
    face_5.normal(PE_n.x, PE_n.y, PE_n.z);
    face_5.normal(PH_n.x, PH_n.y, PH_n.z);
    face_5.normal(PD_n.x, PD_n.y, PD_n.z);
    //face_5.stroke(0);
     creerPointInFigure(face_5, obj.getpointA(), 0, 0); // A
    creerPointInFigure(face_5, obj.getpointE(), 1, 0); // E
    creerPointInFigure(face_5, obj.getpointH(), 1, 1); // H
    creerPointInFigure(face_5, obj.getpointD(), 0, 1); // D
    face_5.endShape(CLOSE);
    group.addChild(face_5);
    
    PShape face_6 = createShape();
    face_6.beginShape(QUADS);
    face_6.textureMode(NORMAL);
    face_6.texture(floorImage);
    face_6.shininess(200.0);  
    face_6.emissive(0, 0, 0);
     face_6.specular(255, 255, 0);
    face_6.ambient(255, 255, 255);
    //face_6.normal(0, 0, 1);
    //face_6.stroke(0);
    
    face_6.normal(PB_n.x, PB_n.y, PB_n.z);
    face_6.normal(PF_n.x, PF_n.y, PF_n.z);
    face_6.normal(PG_n.x, PG_n.y, PG_n.z);
    face_6.normal(PC_n.x, PC_n.y, PC_n.z);
    
    creerPointInFigure(face_6, obj.getpointB(), 0, 0); // B
    creerPointInFigure(face_6, obj.getpointF(), 1, 0); // F
    creerPointInFigure(face_6, obj.getpointG(), 1, 1); // G
    creerPointInFigure(face_6, obj.getpointC(), 0, 1); // C
    face_6.endShape(CLOSE);
    group.addChild(face_6);
    
    return group;
    
}


/*
PShape creerCube(int size) {
  PShape cube = createShape();
  cube.beginShape(QUADS);
  cube.textureMode(NORMAL);
  cube.texture(floorImage);
  cube.shininess(200.0);
  cube.emissive(0, 0, 0);
  cube.normal(0, 0, 1);
  //cube.tint(color(0, 255, 0));
  //cube.fill(32, 0, 80);
  //cube.noFill();
  cube.stroke(0);
  
  // ================================ Face
  creerPointInFigure(cube, pointA, 0, 0); // A
  creerPointInFigure(cube, pointB, 1, 0); // B
  creerPointInFigure(cube, pointC, 1, 1); // C
  creerPointInFigure(cube, pointD, 0, 1); // D
  
  // ================================ HAUT
 // cube.fill(232, 0, 100);
  //cube.noFill();
  creerPointInFigure(cube, pointA, 0, 0); // A
  creerPointInFigure(cube, pointE, 1, 0); // E
  creerPointInFigure(cube, pointF, 1, 1); // F
  creerPointInFigure(cube, pointB, 0, 1); // B
  
  // ================================ BAS
 //cube.fill(131, 0, 100);
  //cube.noFill();
  creerPointInFigure(cube, pointD, 0, 0); // D
  creerPointInFigure(cube, pointH, 1, 0); // H
  creerPointInFigure(cube, pointG, 1, 1); // G
  creerPointInFigure(cube, pointC, 0, 1); // C
  
  // ================================ Derriere
  //cube.fill(64, 99, 41);
  //cube.noFill();
  creerPointInFigure(cube, pointE, 0, 0); // E
  creerPointInFigure(cube, pointF, 1, 0); // F
  creerPointInFigure(cube, pointG, 1, 1); // G
  creerPointInFigure(cube, pointH, 0, 1); // H
  
    // ================================ Gauche
  //cube.fill(175, 99, 41);
  //cube.noFill();
  creerPointInFigure(cube, pointA, 0, 0); // A
  creerPointInFigure(cube, pointE, 1, 0); // E
  creerPointInFigure(cube, pointH, 1, 1); // H
  creerPointInFigure(cube, pointD, 0, 1); // D
  
  // ================================ DROITE
 // cube.fill(2, 207, 188);
  //cube.noFill();
  creerPointInFigure(cube, pointB, 0, 0); // B
  creerPointInFigure(cube, pointF, 1, 0); // F
  creerPointInFigure(cube, pointG, 1, 1); // G
  creerPointInFigure(cube, pointC, 0, 1); // C
  //cube.noFill();
  
  cube.endShape(CLOSE);
  return cube;
}*/

PShape creerPointInFigure(PShape figure, PVector p, float u, float v){ 
  figure.vertex( p.x, p.y, p.z, u, v); 
  return cubeFloor;
}

boolean increment = true;
void draw() {
  
  if(increment) {
    r++; g++; b++;
  } else {
    r--; g--; b--;
  }
  if(r == 255) increment = false;
  if(r == 0 ) increment = true;
  
  background(color(r, g, b));
  //stroke(255);
  //noFill();
  //fill(140, 0, 80);

  pushMatrix();
    shader(shaderTexture);
    textureMode(NORMAL);
     translate(width/2, height/2, 0);
     
      shader(colorShader);
    
    ambientLight(10, 10, 10);
    
      for(int i=0; i<lightPos.length; i++) {
    lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
      pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z, 
                 lightPos[i].x, lightPos[i].y, lightPos[i].z);
              
      }   

    
   for(int i=0; i<lightPos.length; i++) {
      pushMatrix();
        noStroke();
        emissive(lightColor[i].x, lightColor[i].y, lightColor[i].z);
        translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
        box(10, 10, 10);
      popMatrix();
    }
      emissive(0, 0, 0);
    /*rotateY(angle);
    rotateX(0.5);*/
    
    bougerCamera();
     camera(
    camX, camY, camZ,
    0, 0, 0,
    0, 1, 0);
   
    //box(size);
    PShape floorComp = creerComposite(600, 10, 400);
    shape(floorComp);
  popMatrix();
  //angle += 0.01;
  /*if(size < 10) size = 200;
  else size-=30;*/
}


void bougerCamera() {
  // Calcul de la position cartésienne sur le
  // plan XZ :
  camX = zoom * cos(theta);
  camZ = zoom * sin(theta);
  camY = -250;

  // On incrémente l'angle :
  theta = (theta + 0.01) % TWO_PI;
}
