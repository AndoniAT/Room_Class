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

PImage floorImage, tableImage, chairImage, floorImage1, keyboard, ubuntuImage;
PShader shaderTexture;

PShader colorShader;
PVector[] lightPos = { 
  new PVector(-100, 400, -200),
  new PVector(200, -200, -100)
};

PVector[] lightColor = {
  new PVector(255, 255, 255),
  new PVector(255, 255, 255)
  /*new PVector(255, 255, 255)*/
};

// ===========  FLOOR ======================
PShape cubeFloor;
/*PVector pointA, pointB, pointC, pointD;
PVector pointE, pointF, pointG, pointH;*/
// =========================================

void setup() {
  size(600, 600, P3D);
  c = c/2;
  chairImage = loadImage("chair.jpg");
  floorImage = loadImage("u.JPG");
  tableImage = loadImage("table.jpg");
  floorImage1 = loadImage("floor1.JPG");
  keyboard = loadImage("keyboard.JPG");
  ubuntuImage = loadImage("u.JPG");
  /*ubuntuImage.resize(1, 1);
  ubuntuImage.save("ub.jpg");*/


  shaderTexture = loadShader("Lambert1DiffuseFrag.glsl", "lightDifusseeVert.glsl");
  colorShader = loadShader("lightFrag.glsl", "lightVert.glsl");
  
  //cube = creerCube(100);
}


PShape creerComposite(PImage img, int xx, int yy, ObjetTP obj) {
  
  PShape group = createShape(GROUP);
    // Face 1
    PShape face_1 = createShape();
    face_1.beginShape(QUADS);
    face_1.textureMode(NORMAL);
    face_1.texture(img);
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
    
    creerPointInFigure(face_1, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_1, obj.getpointB(), yy, xx); // B
    creerPointInFigure(face_1, obj.getpointC(), yy, yy); // C
    creerPointInFigure(face_1, obj.getpointD(), xx, yy); // D
    face_1.endShape(CLOSE);
    group.addChild(face_1);
    
    PShape face_2 = createShape();
    face_2.beginShape(QUADS);
    face_2.textureMode(NORMAL);
    face_2.texture(img);
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
    creerPointInFigure(face_2, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_2, obj.getpointE(), yy, xx); // E
    creerPointInFigure(face_2, obj.getpointF(), yy, yy); // F
    creerPointInFigure(face_2, obj.getpointB(), xx, yy); // B
    
    face_2.endShape(CLOSE);
    group.addChild(face_2);
    
    PShape face_3 = createShape();
    face_3.beginShape(QUADS);
    face_3.textureMode(NORMAL);
    face_3.texture(img);
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
    creerPointInFigure(face_3, obj.getpointD(), xx, xx); // D
    creerPointInFigure(face_3, obj.getpointH(), yy, xx); // H
    creerPointInFigure(face_3, obj.getpointG(), yy, yy); // G
    creerPointInFigure(face_3, obj.getpointC(), xx, yy); // C
    face_3.endShape(CLOSE);
    group.addChild(face_3);
    
    PShape face_4 = createShape();
    face_4.beginShape(QUADS);
    face_4.textureMode(NORMAL);
    face_4.texture(img);
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
    creerPointInFigure(face_4, obj.getpointE(), xx, xx); // E
    creerPointInFigure(face_4, obj.getpointF(), yy,xx); // F
    creerPointInFigure(face_4, obj.getpointG(), yy, yy); // G
    creerPointInFigure(face_4, obj.getpointH(), xx, yy); // H
    face_4.endShape(CLOSE);
    group.addChild(face_4);
    
    PShape face_5 = createShape();
    face_5.beginShape(QUADS);
    face_5.textureMode(NORMAL);
    face_5.texture(img);
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
     creerPointInFigure(face_5, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_5, obj.getpointE(), yy, xx); // E
    creerPointInFigure(face_5, obj.getpointH(), yy, yy); // H
    creerPointInFigure(face_5, obj.getpointD(), xx, yy); // D
    face_5.endShape(CLOSE);
    group.addChild(face_5);
    
    PShape face_6 = createShape();
    face_6.beginShape(QUADS);
    face_6.textureMode(NORMAL);
    face_6.texture(img);
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
    
    creerPointInFigure(face_6, obj.getpointB(), xx, xx); // B
    creerPointInFigure(face_6, obj.getpointF(), yy, xx); // F
    creerPointInFigure(face_6, obj.getpointG(), yy, yy); // G
    creerPointInFigure(face_6, obj.getpointC(), xx, yy); // C
    face_6.endShape(CLOSE);
    group.addChild(face_6);
    
    return group;
    
}

PShape[] createElementsTable(int x, int y, int z) {
  PShape[] tab = new PShape[10]; // tableau initial avec une taille de 10
  int[] defColors = new int[3];
  defColors[0] = 255;
  defColors[1] = 255;
  defColors[2] = 255;

  ObjetTP obj;
  int largeurMoitieTable = 100, grossTable = 14, z2 = 40;
  int diff = 100;
  
  int xPiedADEH = -largeurMoitieTable - (x/2); int xBCFG = largeurMoitieTable  - (x/2);  
  int yABEF = -y -diff - grossTable;           int yCDGH = -y -diff;
  int profABCD = z2;                        int profEFGH = -z;
  obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
  obj.setImageFace(floorImage);   obj.setImageUp(tableImage);     obj.setImageDown(floorImage);
  
  obj.setImageGauche(floorImage); obj.setImageDroite(floorImage); obj.setImageDerriere(floorImage);
  tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  
  // == Pieds Table ==
  int xPied1 = largeurMoitieTable, xPied2 = 25, zPied = z2, zinc = 20;
  for(int j = 1; j <= 4; j++) {    
    if(j == 1 || j == 3) { xPied1 = largeurMoitieTable; xPied2 = 25;   }
    if(j == 2 || j == 4) { xPied1 = -largeurMoitieTable; xPied2 = -25; }
    if(j == 1 || j == 2) { zPied = z2; zinc = 20;  }
    if(j == 3 || j == 4) { zPied = -z; zinc = -20; }
    xPiedADEH = -(x/2) -xPied1;  xBCFG = xPiedADEH + xPied2;  
    yABEF = -y-diff;             yCDGH = -y;                  
    profABCD = zPied;            profEFGH = profABCD - zinc;  
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    
    //obj = new ObjetTP("pied", pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  }
  
  int prof = -10;
  // ==== PCs ====
  
  // KEYBOARDS
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 40;
    if(i > 1) prof -= 150;
    zinc = 100;
     
    xPiedADEH = -(x/2) + largeurMoitieTable   - x3;   xBCFG = -(x/2) + largeurMoitieTable   - 10;  
    yABEF = -y - diff - grossTable-5;                 yCDGH = yABEF+5;
    profABCD = prof;                                  profEFGH = prof-zinc;
    
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setImageUp(keyboard);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  }
  
  //  ========= BASE PC ==========
  prof = -45;
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 140;
    if(i > 1) prof -= 150;
    zinc = 30;
    int xBase = -(x/2) + largeurMoitieTable;
    xPiedADEH = xBase  - x3;               xBCFG = xPiedADEH + 50;  
    yABEF = -y - diff - grossTable-5;      yCDGH = yABEF+5;
    profABCD = prof;                       profEFGH = profABCD-zinc;
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  }
  
  prof = -45;
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 120;
    if(i > 1) prof -= 150;
    zinc = 30;
    int xBase = -(x/2) + largeurMoitieTable;
    xPiedADEH = xBase  - x3;               xBCFG = xPiedADEH + 10;  
    yABEF = -y - diff - grossTable -5 -15;      yCDGH = yABEF+15;
    profABCD = prof-10;                       profEFGH = profABCD-10;
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(255); obj.setColorG(255); obj.setColorB(255);
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  }
  
  // Ecran
  prof = -45;
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 130;
    if(i > 1) prof -= 150;
    zinc = 100;
    int xBase = -(x/2) + largeurMoitieTable;
    xPiedADEH = xBase  - x3;               xBCFG = xPiedADEH + 20;  
    yABEF = -y - diff - grossTable-5 - 15 - 70;      yCDGH = yABEF+70;
    profABCD = prof+30;                       profEFGH = profABCD-zinc;
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  }
  
  prof = -45;
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 120;
    if(i > 1) prof -= 150;
    zinc = 80;
    int xBase = -(x/2) + largeurMoitieTable;
    xPiedADEH = xBase  - x3;               xBCFG = xPiedADEH + 12;  
    yABEF = -y - diff - grossTable-5 - 15 - 60;      yCDGH = yABEF+50;
    profABCD = prof+20;                       profEFGH = profABCD-zinc; 
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    obj.setImageDroite(ubuntuImage);
    /*obj.setImageDerriere(ubuntuImage);
    obj.setImageFace(ubuntuImage);
    obj.setImageUp(ubuntuImage);
    obj.setImageDown(ubuntuImage);*/
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  }
  
  
  
  int profTot = z;
  
  // Chairs
  
  prof = profTot - 40;
  
  // Chairs base
  /*for(int inc = 1; inc <= 4 ; inc++) {
    int x3 = 140;
    if(inc > 1) prof = prof - x3;
    pointA = new PVector( - (x/2) - largeurMoitieTable  + x3 , -y - (diff/2) - grossTable , -prof);
    pointB = new PVector( - (x/2) + largeurMoitieTable  + 40 , -y - (diff/2) - grossTable , -prof);
    pointC = new PVector( - (x/2) + largeurMoitieTable  + 40 , -y - (diff/2)      , -prof);
    pointD = new PVector( - (x/2) - largeurMoitieTable  + x3 , -y - (diff/2)      , -prof);
     
    pointE = new PVector( - (x/2) - largeurMoitieTable  + x3 , -y - (diff/2) - grossTable , -prof+90);
    pointF = new PVector( - (x/2) + largeurMoitieTable  + 40 , -y - (diff/2) - grossTable , -prof+90);
    pointG = new PVector( - (x/2) + largeurMoitieTable  + 40 , -y - (diff/2)      , -prof+90);
    pointH = new PVector( - (x/2) - largeurMoitieTable  + x3 , -y - (diff/2)      , -prof+90);
    obj = new ObjetTP("Base", pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);
    obj.setImageFace(chairImage);   obj.setImageUp(chairImage);
    obj.setImageDown(chairImage);   obj.setImageGauche(chairImage);
    obj.setImageDroite(chairImage); obj.setImageDerriere(chairImage);
    tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
  
    // Chair back
    for(int j = 1 ; j <= 4 ; j++) {
        int ytemp = 100, xtemp = x3 + 100;
        pointA = new PVector( - (x/2) - largeurMoitieTable  + xtemp , -y - (diff/2) - grossTable - ytemp , -prof);
        pointB = new PVector( - (x/2) + largeurMoitieTable  + 50 , -y - (diff/2) - grossTable    - ytemp , -prof);
        pointC = new PVector( - (x/2) + largeurMoitieTable  + 50 , -y - (diff/2)    , -prof);
        pointD = new PVector( - (x/2) - largeurMoitieTable  + xtemp , -y - (diff/2)      , -prof);
         
        pointE = new PVector( - (x/2) - largeurMoitieTable  + xtemp , -y - (diff/2) - grossTable - ytemp, -prof+90);
        pointF = new PVector( - (x/2) + largeurMoitieTable  + 50 , -y - (diff/2) - grossTable - ytemp , -prof+90);
        pointG = new PVector( - (x/2) + largeurMoitieTable  + 50 , -y - (diff/2)    , -prof+90);
        pointH = new PVector( - (x/2) - largeurMoitieTable  + xtemp , -y - (diff/2)    , -prof+90);
        
        obj = new ObjetTP("Back", pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);
        obj.setColorR(80); obj.setColorG(74); obj.setColorB(66);        
        tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
    }
    
    // chair foot
    for(int j = 1 ; j <= 4 ; j++) {
          zinc = 5;
          if(j == 1 || j == 3) { xPied1 = x3     ; xPied2 = 50  ; }
          if(j == 2 || j == 4) { xPied1 = x3+100 ; xPied2 = -50 ; }
          if(j == 1 || j == 2) { zPied = -prof + 90 ; }
          if(j == 3 || j == 4) { zPied = -prof + 10 ; }
          
          pointA = new PVector( - (x/2) - largeurMoitieTable  + xPied1  , -y - (diff/2) , zPied);
          pointB = new PVector( - (x/2) + largeurMoitieTable  - xPied2  , -y - (diff/2) , zPied);
          pointC = new PVector( - (x/2) + largeurMoitieTable  - xPied2  , -y            , zPied);
          pointD = new PVector( - (x/2) - largeurMoitieTable  + xPied1  , -y            , zPied);
       
          pointE = new PVector( - (x/2) - largeurMoitieTable  + xPied1  , -y - (diff/2) , zPied- zinc);
          pointF = new PVector( - (x/2) + largeurMoitieTable  - xPied2  , -y - (diff/2) , zPied- zinc);
          pointG = new PVector( - (x/2) + largeurMoitieTable  - xPied2  , -y            , zPied- zinc);
          pointH = new PVector( - (x/2) - largeurMoitieTable  + xPied1  , -y            , zPied- zinc);
          
          obj = new ObjetTP("Foot", pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);
          obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
          tab = (PShape[]) append(tab, creerTable(obj, 7, 10));
      }
    
  } */
  
  
  return tab;
}

ObjetTP creerObjects(int xPiedADEH, int xBCFG, int yABEF, int yCDGH, int profABCD, int profEFGH  ) {
    PVector pointA = new PVector( xPiedADEH , yABEF       , profABCD);
    PVector pointB = new PVector( xBCFG     , yABEF       , profABCD);
    PVector pointC = new PVector( xBCFG     , yCDGH       , profABCD);
    PVector pointD = new PVector( xPiedADEH , yCDGH       , profABCD);
    
    PVector pointE = new PVector( xPiedADEH ,  yABEF      , profEFGH);
    PVector pointF = new PVector( xBCFG     ,  yABEF      , profEFGH);
    PVector pointG = new PVector( xBCFG     ,  yCDGH      , profEFGH);
    PVector pointH = new PVector( xPiedADEH ,  yCDGH      , profEFGH);
    ObjetTP obj = new ObjetTP("Clavier", pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);
    return obj;
}

PShape creerTable(ObjetTP obj, int xx, int yy) {
  //PImage img = floorImage1; 
  PShape group = createShape(GROUP);
    // Face 1 => FACE
    PShape face_1 = createShape();
    face_1.beginShape(QUADS);
    face_1.textureMode(NORMAL);
    
    if(obj.getImageFace() != null) { face_1.texture(obj.getImageFace()); } 
    else { face_1.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    //face_1.texture(img);
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
    
    creerPointInFigure(face_1, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_1, obj.getpointB(), yy, xx); // B
    creerPointInFigure(face_1, obj.getpointC(), yy, yy); // C
    creerPointInFigure(face_1, obj.getpointD(), xx, yy); // D
    face_1.endShape(CLOSE);
    group.addChild(face_1);
    
    
    // FACE 2 => UP
    PShape face_2 = createShape();
    face_2.beginShape(QUADS);
    face_2.textureMode(NORMAL);
    
    if(obj.getImageUp() != null) {
      System.out.println("Image up");
      System.out.println(obj.getName());
      face_2.texture(obj.getImageUp()); 
  } else { face_2.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    //face_2.texture(img);
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
    creerPointInFigure(face_2, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_2, obj.getpointE(), yy, xx); // E
    creerPointInFigure(face_2, obj.getpointF(), yy, yy); // F
    creerPointInFigure(face_2, obj.getpointB(), xx, yy); // B
    
    face_2.endShape(CLOSE);
    group.addChild(face_2);
    
    // FACE 3 => DOWN
    PShape face_3 = createShape();
    face_3.beginShape(QUADS);
    face_3.textureMode(NORMAL);
    
    if(obj.getImageDown() != null) { face_3.texture(obj.getImageDown()); } 
    else { face_3.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    //face_3.texture(img);
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
    creerPointInFigure(face_3, obj.getpointD(), xx, xx); // D
    creerPointInFigure(face_3, obj.getpointH(), yy, xx); // H
    creerPointInFigure(face_3, obj.getpointG(), yy, yy); // G
    creerPointInFigure(face_3, obj.getpointC(), xx, yy); // C
    face_3.endShape(CLOSE);
    group.addChild(face_3);
    
    // FACE 4 => Derriere
    PShape face_4 = createShape();
    face_4.beginShape(QUADS);
    face_4.textureMode(NORMAL);
    
    if(obj.getImageDerriere() != null) { face_4.texture(obj.getImageDerriere()); } 
    else { face_4.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    //face_4.texture(img);
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
    creerPointInFigure(face_4, obj.getpointE(), xx, xx);  
    creerPointInFigure(face_4, obj.getpointF(), yy,xx);   
    creerPointInFigure(face_4, obj.getpointG(), yy, yy);  
    creerPointInFigure(face_4, obj.getpointH(), xx, yy);  
    face_4.endShape(CLOSE);
    group.addChild(face_4);
    
    // Face 5 = Gauche
    PShape face_5 = createShape();
    face_5.beginShape(QUADS);
    face_5.textureMode(NORMAL);
    
    if(obj.getImageGauche() != null) { face_5.texture(obj.getImageGauche()); } 
    else { face_5.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    //face_5.texture(img);
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
     creerPointInFigure(face_5, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_5, obj.getpointE(), yy, xx); // E
    creerPointInFigure(face_5, obj.getpointH(), yy, yy); // H
    creerPointInFigure(face_5, obj.getpointD(), xx, yy); // D
    face_5.endShape(CLOSE);
    group.addChild(face_5);
    
    // Face 5 = Droite
    PShape face_6 = createShape();
    face_6.beginShape(QUADS);
    face_6.textureMode(NORMAL);
    
    if(obj.getImageDroite() != null) { face_6.texture(obj.getImageDroite());
    } else { face_6.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    //face_6.texture(img);
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
    
    creerPointInFigure(face_6, obj.getpointB(), xx, xx); // B
    creerPointInFigure(face_6, obj.getpointF(), yy, xx); // F
    creerPointInFigure(face_6, obj.getpointG(), yy, yy); // G
    creerPointInFigure(face_6, obj.getpointC(), xx, yy); // C
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

void creerPointInFigure(PShape figure, PVector p, float u, float v){ 
  figure.vertex( p.x, p.y, p.z, u, v); 
  return;
}

boolean increment = true;
void draw() {
  int x = 1000, y = 10, z = 600;
  
  PVector pointA = new PVector( -x, -y, z);
  PVector pointB = new PVector( x, -y, z);
  PVector pointC = new PVector( x, y, z);
  PVector pointD = new PVector( -x, y, z);
  
  PVector pointE = new PVector( -x, -y, -z);
  PVector pointF = new PVector( x, -y, -z);
  PVector pointG = new PVector( x, y, -z);
  PVector pointH = new PVector( -x, y, -z);
  ObjetTP obj = new ObjetTP("Floor", pointA, pointB, pointC, pointD, pointE, pointF, pointG, pointH);
  //obj.setImageFace(tableImage);
  obj.setImageUp(floorImage);
  //PShape floorComp = creerComposite(600, 10, 400, floorImage1, 0, 1, obj);
  PShape floorComp = creerTable(obj, 0, 1);
    //PShape floorComp = creerComposite(floorImage, 0, 1, obj);

  PShape[] tab = createElementsTable(x, y, z);
  x = x-800;
  PShape[] tab2 = createElementsTable(x, y, z);
  x = x-800;
  PShape[] tab3 = createElementsTable(x, y, z);
  x = x-800;
  PShape[] tab4 = createElementsTable(x, y, z);
  
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
    
    shape(floorComp);
    
    for(int i = 0; i < tab.length; i++) {
        if (tab[i] != null) {
          shape(tab[i]);
        }  
        if (tab2[i] != null) {
          shape(tab2[i]);
        }  
        
        if (tab3[i] != null) {
          shape(tab3[i]);
        }  
        
        if (tab4[i] != null) {
          shape(tab4[i]);
        }  
    }
  
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
