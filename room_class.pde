/*
  ===== Andoni ALONSO TORT =====
  UNIVERSITÉ DU HAVRE, NORMANDIE
              2023
*/
PShape floorComp, mureTableau, mureFenetre, mureduplicate;
ObjetTP objScreen;
int counterScare = 0;
PShape[] tab, tab2, tab3, tab4, objets = new PShape[10];
int previousMouseX = 0;
int countRot = 0;


boolean downChair = false;

float angle = 0f;
int size = 200; 

float c = 600;
float camX = 0;
float camZ = 0;
float camY = 0;
float theta = 0; 
float zoom = 1500;

// == Camera ==
float cameraX, cameraY, cameraZ;
float cameraAngle = 0;
float rotateX = 0;
// ===========

float r=0, g=0, b=0;

PImage floorImage, tableImage, chairImage, floorImage1, keyboard, mureImage, tableauImage, roofImage, lhImage;
PImage ubuntuImage, vsStudioImage,  classImage;
PImage scareImage, eurekaImage; 

PImage pcBackImage, pcFaceImage;
PShader shaderTexture;

PShader colorShader;
PVector[] lightPos = { 
  /*new PVector(-250, 1400, -1850),
  new PVector(-250, 1400, -1720),*/
  new PVector(4400, 4700, 2000),
  
  new PVector(-1400, -1800, -1300),
};

PVector[] lightColor = {
  /*new PVector(226, 211, 133),
  new PVector(226, 211, 133),*/
  new PVector(226, 211, 133),
  new PVector(226, 211, 133)
};


// ===========  FLOOR ======================
PShape cubeFloor;
/*PVector pointA, pointB, pointC, pointD;
PVector pointE, pointF, pointG, pointH;*/
// =========================================

void setup() {
  size(600, 600, P3D);
  cameraX = width/2.0;
  cameraY = height/2.0 - 10;
  cameraZ = 0;
  camera(cameraX, cameraY, cameraZ,
         cameraX, cameraY, cameraZ - 70,
         0, 1, 0);
  /*camera(width/2.0, height/2.0, 0, // position
         width/2.0, height/2.0, -1, // point d'intérêt
         0, 1, 0); // orientation verticale
  perspective(PI/3.0, float(width)/float(height), 0.1, 100);
  
  c = c/2;
  */
   
  chairImage = loadImage("chair.jpg");
  floorImage = loadImage("floor.JPG");
  tableImage = loadImage("table.jpg");
  floorImage1 = loadImage("floor1.JPG");
  keyboard = loadImage("keyboard.JPG");
  mureImage = loadImage("mure.jpg");
  tableauImage = loadImage("tableau.jpg");
  roofImage = loadImage("roof.jpg");
  scareImage = loadImage("scare.jpg");
  eurekaImage = loadImage("eureka.JPG");
  
  ubuntuImage = loadImage("ubuntu.JPG");
  vsStudioImage = loadImage("vs.JPG");
  classImage = loadImage("classroom.JPG");
   pcBackImage = loadImage("pcBack.JPG");
   pcFaceImage = loadImage("pcFace.JPG");
   lhImage = loadImage("LH.jpeg");
     lhImage.resize(600, 600); // redimensionner l'image 


  shaderTexture = loadShader("Lambert1DiffuseFrag.glsl", "lightDifusseeVert.glsl");
  colorShader = loadShader("lightFrag.glsl", "lightVert.glsl");
  
  // Creation des objets
  int x = 1400, y = 10, z = 700;
  int hauteur = 700;
      // == FLO0R ===========
     int xPiedADEH = -x;       int xBCFG = x;  
     int yABEF = -y;           int yCDGH = y;
     int profABCD = z;     int profEFGH = -z;
    
      ObjetTP obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
      obj.setImageUp(floorImage);
      objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
      
      // ==== SCREEN ======
      float rotX = 0; float rotY = 0; float rotZ = 0;
      rotX = 80;
      rotY = 20;
      /*rotZ = 80;*/
      int transY = 0; int transX =  0 ; int transZ = 0;
      
      transY = 0  -y-hauteur/2 - 200;
      transZ =-z+300;
      transX = -x + hauteur/2  + 100;
      /*transZ =-z+300;*/
      
       //  ===> SUPORT
          int grosX = 200; int grosZ = 300;
          xPiedADEH = -x + 400;    xBCFG    = xPiedADEH + grosX;  
          yABEF     = -y - 30;     yCDGH    = yABEF - 30;
          profABCD  = z - grosZ;     profEFGH = profABCD - grosZ;
        
          obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
          obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
          obj.setRotateX(rotX); obj.setRotateY(rotY); obj.setRotateZ(rotZ);
          obj.setTranslateX(transX); obj.setTranslateY(transY); obj.setTranslateZ(transZ);
          objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
          
          xPiedADEH  = xPiedADEH + grosX/2;  xBCFG    = xPiedADEH + 20;  
          yABEF      = yCDGH - hauteur/2;;     yCDGH    = yABEF + hauteur/2;
          profABCD   = z - grosZ - grosZ/2 + 20;         profEFGH = profABCD - 40; 
        
          obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
          obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
          obj.setRotateX(rotX); obj.setRotateY(rotY); obj.setRotateZ(rotZ);
          obj.setTranslateX(transX); obj.setTranslateY(transY); obj.setTranslateZ(transZ);
          
          objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
          
          // Screen
          xPiedADEH  += 10;  xBCFG    = xPiedADEH + 10;  
          yABEF      = yABEF + 250 ;     yCDGH    = yCDGH - hauteur/2 - 100;
          profABCD  = z - grosZ +100;     profEFGH = profABCD - grosZ - 200; 
        
          obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
          obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
          obj.setRotateX(rotX); obj.setRotateY(rotY); obj.setRotateZ(rotZ);
          obj.setTranslateX(transX); obj.setTranslateY(transY); obj.setTranslateZ(transZ);
          objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
          
          xPiedADEH  += 1;  xBCFG    = xPiedADEH + 10;  
          yABEF      -= 20;     yCDGH    +=20;
          profABCD  -=20;     profEFGH +=20; 
          objScreen = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
          objScreen.setColorR(0); obj.setColorG(0); obj.setColorB(0);
          //objScreen.setImageDroite(lhImage);
          objScreen.setRotateX(rotX); objScreen.setRotateY(rotY); objScreen.setRotateZ(rotZ);
          objScreen.setTranslateX(transX); objScreen.setTranslateY(transY); objScreen.setTranslateZ(transZ);
          //objets = (PShape[]) append(objets, creerTable(objScreen, 1, 0));
          
          //PVector p = new PVector(xPiedADEH, yABEF, yCDGH);
          PVector p = new PVector(objScreen.getpointA().x - 50, objScreen.getpointA().y + 250, objScreen.getpointA().z + 100);
          lightPos = (PVector[]) append(lightPos, p);
          PVector c = new PVector(255, 255, 255);
          lightColor = (PVector[]) append(lightColor, c);
       // ===========
      
      // ROOF
      xPiedADEH = -x;       xBCFG = x;
      yABEF = -hauteur - 10;           yCDGH = yABEF+10;
      profABCD = z;         profEFGH = -z;
      obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
      obj.setImageDown(roofImage);
      objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
      
      // ===== Mure fenetre =========
        // gauche
        xPiedADEH = x;   xBCFG = x-x/3;  
        yABEF = -hauteur - 10;           yCDGH = y;
        profABCD = z;     profEFGH = z+10;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
        obj.setImageFace(mureImage); obj.setImageDerriere(mureImage);
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
        
        // down
        xPiedADEH = x-x/3;   xBCFG = -x+x/3;  
        yABEF = -hauteur/3;           yCDGH = y;
        profABCD = z;     profEFGH = z+10;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
        obj.setImageFace(mureImage); obj.setImageDerriere(mureImage);
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
        
        
        // fenetre
        xPiedADEH = x-x/3;   xBCFG = -x+x/3;  
        yABEF = -hauteur+100;           yCDGH = -hauteur/3;
        profABCD = z;     profEFGH = z+10;
        /*obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
        obj.setTransFill(200); obj.setColorFill(255);
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));*/
        
        // up
        xPiedADEH = x-x/3;   xBCFG = -x+x/3;  
        yABEF = -hauteur;           yCDGH = yABEF+(100);
        profABCD = z;     profEFGH = z+10;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
        obj.setImageFace(mureImage); obj.setImageDerriere(mureImage);
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
        
        // droite
        xPiedADEH = -x;   xBCFG = -x+x/3;  
        yABEF = -hauteur - 10;           yCDGH = y;
        profABCD = z;     profEFGH = z+10;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
        obj.setColorR(255); obj.setColorG(0); obj.setColorB(0);
        obj.setImageFace(mureImage); obj.setImageDerriere(mureImage);
        /*obj.setTransFill(100); obj.setColorFill(255);*/
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
        
        
        // ==== MARCOS ==========
            // DROITE
            xPiedADEH = x-x/3+10;   xBCFG = xPiedADEH-40;  
            yABEF = -hauteur+100;           yCDGH = -hauteur/3;
            profABCD = z;     profEFGH = profABCD-30;
            obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            //obj.setImageFace(mureImage); obj.setImageDerriere(mureImage);
            obj.setColorR(189); obj.setColorG(189); obj.setColorB(189);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
            // GAUCHE
            xPiedADEH = -x+x/3;   xBCFG = (-x+x/3)-20; yABEF = -hauteur+100; yCDGH = -hauteur/3; profABCD = z;  profEFGH = z-30;
            obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            obj.setColorR(189); obj.setColorG(189); obj.setColorB(189);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
            // HAUT    
            xPiedADEH = x-x/3;   xBCFG = -x+x/3; yABEF = -hauteur+100; yCDGH = yABEF+30; profABCD = z;  profEFGH = z-30;
            obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            obj.setColorR(189); obj.setColorG(189); obj.setColorB(189);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
            xPiedADEH = x-x/3;   xBCFG = -x+x/3; yABEF = -hauteur+200; yCDGH = yABEF+10; profABCD = z; profEFGH = z-15;
            obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            obj.setColorR(200); obj.setColorG(200); obj.setColorB(200);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
            int dist = 500;
            xPiedADEH = -x+x/3;
            for(int i = 0; i < 3 ; i++) {
                xPiedADEH +=dist;   xBCFG = xPiedADEH+10; yABEF = -hauteur+100; yCDGH = yABEF+100; profABCD = z; profEFGH = z-15;
                obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
                obj.setColorR(200); obj.setColorG(200); obj.setColorB(200);
                objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
                
                int xPiedADEHTemp = xPiedADEH;
                xBCFG = xPiedADEHTemp - dist;                   
                obj = creerObjects(xPiedADEHTemp, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
                obj.setTransFill(100); obj.setColorFill(255);
                objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
                
            }
            xPiedADEH += dist; xBCFG = xPiedADEH - dist;                   
            obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            obj.setTransFill(100); obj.setColorFill(255);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
            dist = 700;
            xPiedADEH = -x+x/3;
            for(int i = 0; i < 2 ; i++) {
                xPiedADEH +=dist;   xBCFG = xPiedADEH+40; yABEF = -hauteur+200; yCDGH =  -hauteur/3; profABCD = z; profEFGH = z-15;
                obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
                obj.setColorR(200); obj.setColorG(200); obj.setColorB(200);
                objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
                
                /*xPiedADEH += dist;*/
                int xPiedADEHTemp = xPiedADEH-dist;
                xBCFG = xPiedADEH + 50;  
                yABEF = -hauteur+200;           yCDGH = -hauteur/3;
                profABCD = z;     profEFGH = z+10;
                obj = creerObjects(xPiedADEHTemp, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
                obj.setTransFill(200); obj.setColorFill(255);
                objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            }
            
            int xPiedADEHTemp = xPiedADEH+250;
            xBCFG = xPiedADEHTemp -400 ;  
            yABEF = -hauteur+200;           yCDGH = -hauteur/3;
            profABCD = z;     profEFGH = z+10;
            obj = creerObjects(xPiedADEHTemp, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            obj.setTransFill(100); obj.setColorFill(255);
            obj.setRotateY(20);
            obj.setTranslateX(-xBCFG+50);
            obj.setTranslateZ(z);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
            // bas
            xPiedADEH = x-x/3; xBCFG = -x+x/3; yABEF = -hauteur/3; yCDGH = yABEF-10; profABCD = z;     profEFGH = z-30;
            obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
            obj.setColorR(189); obj.setColorG(189); obj.setColorB(189);
            objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
            
      
      // == MUR TABLEAU ==========
      
      xPiedADEH = -x;        xBCFG = -x+20;  
      yABEF = y;            yCDGH = -hauteur;
      profABCD = -z;      profEFGH = z;
      obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);      
      obj.setImageDroite(mureImage);
      objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
      
        // == TABLEAU ==
        xPiedADEH +=10;        xBCFG +=10;  
        yABEF =y - 200;            yCDGH = -hauteur+200;
        profABCD = profABCD+50;      profEFGH= (profEFGH/2)-100;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);      
        obj.setImageDroite(tableauImage);
        obj.setColorR(0); obj.setColorG(0); obj.setColorB(0); 
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
        
      
       xPiedADEH = x;        xBCFG = xPiedADEH+20;  
      yABEF = y;            yCDGH = -hauteur;
      profABCD = -z;      profEFGH = z;
      obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);      
      obj.setImageDroite(mureImage);
      objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
      
        
      // MURE DROITE
        xPiedADEH = x;   xBCFG = -x;  
        yABEF = -hauteur - 10;           yCDGH = y;
        profABCD = -z;     profEFGH = profABCD+10;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
        obj.setImageFace(mureImage); obj.setImageDerriere(mureImage);
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
        
        
      int separation = 800;
      x = x-100;
      
      for(int i = 1; i <= 3; i++) {
        tab = createElementsTable(x, y, z);
        for(int j = 0; j < tab.length; j++) objets = (PShape[]) append(objets, tab[j]);
        x = x-separation;
      }
      
        // SUPPORT
         xPiedADEH = -x+100;        xBCFG = xPiedADEH+100;  
        yABEF = y;            yCDGH = -hauteur;
        profABCD = -z;      profEFGH = -z+100;
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);      
        obj.setImageDroite(mureImage);
        objets = (PShape[]) append(objets, creerTable(obj, 1, 0));
      
  //cube = creerCube(100);
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
  
  int xPiedADEH = 0; int xBCFG = 0;  
  int yABEF     = 0; int yCDGH = 0;
  int profABCD  = 0; int profEFGH = 0;
    
  int xPied1 = largeurMoitieTable, xPied2 = 25, zPied = z2, zinc = 20;
  for(int i = 1 ; i <= 2 ; i++ ) {
    xPiedADEH = -largeurMoitieTable - (x/2); xBCFG = largeurMoitieTable - (x/2);  
    yABEF = -y -diff - grossTable;           yCDGH = -y -diff;
    if(i == 1) { profABCD = z2;                profEFGH = profABCD + (-z/2) + 10; }
    if(i > 1) { profABCD = profEFGH - 5;             profEFGH = profEFGH + (-z/2); }
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setImageFace(floorImage);   obj.setImageUp(tableImage);     obj.setImageDown(floorImage);
    obj.setImageGauche(floorImage); obj.setImageDroite(floorImage); obj.setImageDerriere(floorImage);
  
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
    
    int xPiedADEHTemp = xPiedADEH; int xBCFGTemp; int yABEFTemp; int yCDGHTemp; int profABCDTemp; int profEFGHTemp; 
    for(int j = 1; j <= 4; j++) {    
      if(j == 1 || j == 3) { xPied1 = largeurMoitieTable; xPied2 = 10;   }
      if(j == 2 || j == 4) { xPied1 = -largeurMoitieTable; xPied2 = -10; }
      if(j == 1 || j == 2) { zPied = profABCD; zinc = 7;  }
      if(j == 3 || j == 4) { zPied = profABCD - (z/2) + 10; zinc = -7; }
      
      xPiedADEHTemp = -(x/2) - xPied1;  xBCFGTemp = xPiedADEHTemp + xPied2;  
      yABEFTemp = -y-diff;             yCDGHTemp = -y;
      profABCDTemp = zPied;            profEFGHTemp = profABCDTemp - zinc;
      
      obj = creerObjects(xPiedADEHTemp, xBCFGTemp, yABEFTemp, yCDGHTemp, profABCDTemp, profEFGHTemp);
      obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
      tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
    }
  }
  
    
  // == Pieds Table ==
  
    
 
  
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
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
  }
  
  //  ========= BASE PC ==========
  int profBaseInit = - 20;
  int sepBase = 170;
  prof = profBaseInit;
  
  //prof = -45;
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 140;
    if(i > 1) prof -= sepBase;
    zinc = 30;
    int xBase = -(x/2) + largeurMoitieTable;
    xPiedADEH = xBase  - x3;               xBCFG = xPiedADEH + 50;  
    yABEF = -y - diff - grossTable-5;      yCDGH = yABEF+5;
    profABCD = prof;                       profEFGH = profABCD-zinc;
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
  }
  
  //prof = -45;
  prof = profBaseInit;
  for(int i = 1 ; i <= 4 ; i++) {
    int x3 = 120;
    if(i > 1) prof -= sepBase;
    zinc = 30;
    int xBase = -(x/2) + largeurMoitieTable;
    xPiedADEH = xBase  - x3;               xBCFG = xPiedADEH + 10;  
    yABEF = -y - diff - grossTable -5 -15;      yCDGH = yABEF+15;
    profABCD = prof-10;                       profEFGH = profABCD-10;
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(255); obj.setColorG(255); obj.setColorB(255);
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
  }
  
  // Ecran
  prof = profBaseInit;
  for(int i = 1 ; i <= 4 ; i++) {
    
    int x3 = 130;
    if(i > 1) prof -= sepBase;
    zinc = 100;
    int xBase = -(x/2) + largeurMoitieTable;
    
    xPiedADEH = xBase  - x3;                          xBCFG = xPiedADEH + 20;  
    yABEF = -y - diff - grossTable - 100 + 80 ;                            yCDGH = -y - diff - grossTable - 100;
    profABCD  = prof+30;                              profEFGH = profABCD-zinc;
    
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
    
    // Image ubuntu
    zinc = 80;
    
    xPiedADEH+=10;                                   xBCFG = xPiedADEH+12;  
    yABEF =yABEF-10;                                      yCDGH = yCDGH+10;
    profABCD=prof+20-zinc;                        profEFGH = profABCD+zinc;
    
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    
    int random = int(random(0, 4));
    switch(random) {
      case 0 : { obj.setImageDroite(ubuntuImage); break; }
      case 1 : { obj.setImageDroite(vsStudioImage); break; }
      case 2 : { obj.setImageDroite(classImage); break; }
    }
    //System.out.println("random : " + random);
    
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
    
    // Unité
    zinc = 40;
    xPiedADEH = xBase  - x3;                          xBCFG = xPiedADEH + 80;  
    yABEF     = -y - diff - grossTable- 90;           yCDGH = -y - diff - grossTable;
    profABCD  = prof-90 ;                              profEFGH = profABCD-zinc;
    
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
    obj.setImageGauche(pcBackImage); obj.setImageDroite(pcFaceImage);
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
    
  }
  
  
  int profTot = z;
  
  // Chairs
  
  prof = profTot - 100;
  
  // Chairs base
  for(int inc = 1; inc <= 4 ; inc++) {
    float rotX = 0; float rotY = 0; float rotZ = 0; 
    float randomNum = 0.0;
    int transX = 0; int transY = 0; int transZ = 0;
    
    if(inc == 4) {
        //randomNum = random(24, 25);
      if(!downChair) {
        rotX = 80;
        rotY = 8;
        transY =  -20;
        transX = int(random(-x, x/2));
        transZ =-z+300;
        downChair = true;
      }  
    }
    
    //randomNum = int(random(0, 3));
  
    // == BASE ==========
    int x3 = 140;
    //int x3 = z/2;
    if(inc > 1) prof = prof - x3 - 30;
    
    xPiedADEH = - (x/2) - largeurMoitieTable  + x3;               xBCFG = - (x/2) + largeurMoitieTable  + 40;  
    yABEF = -y - (diff/2) - grossTable;      yCDGH = -y - (diff/2);
    profABCD = -prof;                       profEFGH = profABCD+90;
    
    
    obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);
    obj.setImageFace(chairImage);   obj.setImageUp(chairImage);
    obj.setImageDown(chairImage);   obj.setImageGauche(chairImage);
    obj.setImageDroite(chairImage); obj.setImageDerriere(chairImage);

    obj.setRotateX(rotX); obj.setRotateY(rotY); obj.setRotateZ(rotZ);
    obj.setTranslateX(transX); obj.setTranslateY(transY); obj.setTranslateZ(transZ);
    tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
  
    // === Chair back ====
    for(int j = 1 ; j <= 4 ; j++) {
        int ytemp = 100, xtemp = x3 + 100;
        
        xPiedADEH = - (x/2) - largeurMoitieTable  + xtemp;               xBCFG = - (x/2) + largeurMoitieTable  + 50;  
        yABEF = -y - (diff/2) - grossTable - ytemp ;      yCDGH = yABEF + 80 ;
        profABCD = -prof;                       profEFGH = profABCD+90;
        
        obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);    
        obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
        
        obj.setImageGauche(chairImage); obj.setImageDroite(chairImage);
        
        obj.setRotateX(rotX); obj.setRotateY(rotY); obj.setRotateZ(rotZ);
        obj.setTranslateX(transX); obj.setTranslateY(transY);  obj.setTranslateZ(transZ);
        
        tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
    }
  
    // chair foot
    for(int j = 1 ; j <= 4 ; j++) {
          zinc = 5;
          if(j == 1 || j == 3) { xPied1 = x3     ; xPied2 = 50  ;  yABEF = -y - (diff/2); }
          if(j == 2 || j == 4) { xPied1 = x3+100 ; xPied2 = -50 ;  yABEF = -y - diff + 10;     }
          if(j == 1 || j == 2) { zPied = -prof + 90 ; }
          if(j == 3 || j == 4) { zPied = -prof + 10 ; }
          
          xPiedADEH = - (x/2) - largeurMoitieTable  + xPied1;               xBCFG = - (x/2) + largeurMoitieTable  - xPied2;  
          yCDGH = -y;
          profABCD = zPied;                       profEFGH = profABCD-zinc; 
          obj = creerObjects(xPiedADEH, xBCFG, yABEF, yCDGH, profABCD, profEFGH);  
          obj.setColorR(0); obj.setColorG(0); obj.setColorB(0);
          obj.setRotateX(rotX); obj.setRotateY(rotY); obj.setRotateZ(rotZ);
          obj.setTranslateX(transX); obj.setTranslateY(transY);  obj.setTranslateZ(transZ);
          tab = (PShape[]) append(tab, creerTable(obj, 1, 0));
      }
    
  } 
  
  
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
  noStroke();
    // Face 1 => FACE
    PShape face_1 = createShape();
    face_1.beginShape(QUADS);
    face_1.textureMode(NORMAL);
    
    
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      face_1.setFill(color(obj.getColorFill(), obj.getTransFill()));
    } else if(obj.getImageFace() != null) { face_1.texture(obj.getImageFace()); } 
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
    
    face_1.noStroke();
    face_1.endShape(CLOSE);
    group.addChild(face_1);
    
    
    // FACE 2 => UP
    PShape face_2 = createShape();
    face_2.beginShape(QUADS);
    face_2.textureMode(NORMAL);
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      face_2.setFill(color(obj.getColorFill(), obj.getTransFill()));
    } else if(obj.getImageUp() != null) {
      face_2.texture(obj.getImageUp()); 
    } else { face_2.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    face_2.shininess(200.0);  
    face_2.emissive(0, 0, 0);
     face_2.specular(255, 255, 0);
    face_2.ambient(255, 255, 255);
    
    face_2.normal(PA_n.x, PA_n.y, PA_n.z);
    face_2.normal(PE_n.x, PE_n.y, PE_n.z);
    face_2.normal(PF_n.x, PF_n.y, PF_n.z);
    face_2.normal(PB_n.x, PB_n.y, PB_n.z);
    
    //face_2.stroke(0);
    creerPointInFigure(face_2, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_2, obj.getpointE(), yy, xx); // E
    creerPointInFigure(face_2, obj.getpointF(), yy, yy); // F
    creerPointInFigure(face_2, obj.getpointB(), xx, yy); // B
    
    face_2.noStroke();
    face_2.endShape(CLOSE);
    group.addChild(face_2);
    
    // FACE 3 => DOWN
    PShape face_3 = createShape();
    face_3.beginShape(QUADS);
    face_3.textureMode(NORMAL);
    
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      face_3.setFill(color(obj.getColorFill(), obj.getTransFill()));
    } else if(obj.getImageDown() != null) { face_3.texture(obj.getImageDown()); } 
    else { face_3.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    face_3.shininess(200.0);  
    face_3.emissive(0, 0, 0);
    face_3.specular(255, 255, 0);
    face_3.ambient(255, 255, 255);

    face_3.normal(PD_n.x, PD_n.y, PD_n.z);
    face_3.normal(PH_n.x, PH_n.y, PH_n.z);
    face_3.normal(PG_n.x, PG_n.y, PG_n.z);
    face_3.normal(PC_n.x, PC_n.y, PC_n.z);
    
    creerPointInFigure(face_3, obj.getpointD(), xx, xx); // D
    creerPointInFigure(face_3, obj.getpointH(), yy, xx); // H
    creerPointInFigure(face_3, obj.getpointG(), yy, yy); // G
    creerPointInFigure(face_3, obj.getpointC(), xx, yy); // C
    face_3.noStroke();
    face_3.endShape(CLOSE);
    
    group.addChild(face_3);
    
    // FACE 4 => Derriere
    PShape face_4 = createShape();
    face_4.beginShape(QUADS);
    face_4.textureMode(NORMAL);
    
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      face_4.setFill(color(obj.getColorFill(), obj.getTransFill()));
    } else if(obj.getImageDerriere() != null) { face_4.texture(obj.getImageDerriere()); } 
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
    face_4.noStroke();
    face_4.endShape(CLOSE);
    group.addChild(face_4);
    
    // Face 5 = Gauche
    PShape face_5 = createShape();
    face_5.beginShape(QUADS);
    face_5.textureMode(NORMAL);
    
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      face_5.setFill(color(obj.getColorFill(), obj.getTransFill()));
    } else if(obj.getImageGauche() != null) { face_5.texture(obj.getImageGauche()); } 
    else { face_5.fill(obj.getColorR(), obj.getColorG(), obj.getColorB()); }
    
    face_5.shininess(200);  
    face_5.emissive(0, 0, 0);
    face_5.specular(255, 255, 0);
    face_5.ambient(255, 255, 255);
    face_5.normal(0, 0, 1);
    
    face_5.normal(PA_n.x, PA_n.y, PA_n.z);
    face_5.normal(PE_n.x, PE_n.y, PE_n.z);
    face_5.normal(PH_n.x, PH_n.y, PH_n.z);
    face_5.normal(PD_n.x, PD_n.y, PD_n.z);
     creerPointInFigure(face_5, obj.getpointA(), xx, xx); // A
    creerPointInFigure(face_5, obj.getpointE(), yy, xx); // E
    creerPointInFigure(face_5, obj.getpointH(), yy, yy); // H
    creerPointInFigure(face_5, obj.getpointD(), xx, yy); // D
    face_5.noStroke();
    face_5.endShape(CLOSE);
    group.addChild(face_5);
    
    // Face 5 = Droite
    PShape face_6 = createShape();
    face_6.beginShape(QUADS);
    face_6.textureMode(NORMAL);
    
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      face_6.setFill(color(obj.getColorFill(), obj.getTransFill()));
    } else if(obj.getImageDroite() != null) { face_6.texture(obj.getImageDroite());
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
    face_6.noStroke();
    /*if(obj.getRotateX()>0) face_6.rotateX(obj.getRotateX());
    if(obj.getRotateY()>0) face_6.rotateY(obj.getRotateY());
    if(obj.getRotateZ()>0) face_6.rotateZ(obj.getRotateZ());*/
    
    group.addChild(face_6);
    group.noStroke();    
        
    if(obj.getRotateX()!=0) group.rotateX(obj.getRotateX());
    if(obj.getRotateY()!=0) group.rotateY(obj.getRotateY());
    if(obj.getRotateZ()!=0) group.rotateZ(obj.getRotateZ());
    
    group.translate(obj.getTranslateX(), obj.getTranslateY(), obj.getTranslateZ());
    
    //obj.setTransFill(100); obj.setColorFill(255);
    if(obj.getTransFill() > 0 && obj.getColorFill() > 0) {
      group.setFill(color(obj.getColorFill(), obj.getTransFill()));
    }
    return group;   
}

void creerPointInFigure(PShape figure, PVector p, float u, float v){ 
  figure.vertex( p.x, p.y, p.z, u, v); 
  return;
}

boolean increment = true;
void draw() {
  background(lhImage);
  
  System.out.println(frameCount);
  /*background(200, 200, 255);*/
  //pushMatrix();
      if(increment) {
        r++; g++; b++;
      } else {
        r--; g--; b--;
      }
      
      if(r == 255) increment = false;
      if(r == 0 ) increment = true;
      
      /*background(color(r, g, b));*/
      //stroke(255);
      //noFill();
      //fill(140, 0, 80);
      
        pushMatrix();
            translate(width/2.0, height/2.0, 0);
            /*rotateY(frameCount * 0.02);*/
            rotateY(rotateX);
            fill(255, 255, 0);
            
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
                  if(i == lightPos.length - 1) box(10, 10, 10);
                  else box(150, 10, 150);
               popMatrix(); 
            }
            
            emissive(0, 0, 0);
            /*rotateY(angle);
            rotateX(0.5);*/
            
            /*bougerCamera();
             camera(
            camX, camY, camZ,
            0, 0, 0,
            0, 1, 0);*/
           
            //box(size);
            pushMatrix();
            if(counterScare == 0) {
               if(frameCount % int(random(30, 40)) ==0) {
                objScreen.setImageDroite(null);
              } else {
                objScreen.setImageDroite(eurekaImage);
              }
            } 
            
            if(frameCount % int(random(100, 110)) ==0 && counterScare == 0) {
              objScreen.setImageDroite(scareImage);
              counterScare++;
            
            }
            
            if(counterScare > 0) {
              counterScare++;
              if(counterScare > 10) counterScare = 0;
            }
              
              shape(creerTable(objScreen, 1, 0));
            popMatrix();
            for(int i = 0 ; i < objets.length ; i++ ) {
              pushMatrix();
              if(objets[i] != null) shape(objets[i]);
              popMatrix();
            }
            //shape(mureFenetre);
    
            /*for(int i = 0; i < tab.length; i++) {
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
            }*/

            popMatrix();

//        popMatrix();
        updateCamera();
        
        /*lightColor[0].x = lightColor[0].x > 0 ? 0 : 226;
          lightColor[0].y = lightColor[0].y > 0 ? 0 : 211;
          lightColor[0].z = lightColor[0].z > 0 ? 0 : 133;*/
        
        if(frameCount% int(random(4, 20)) ==0) {
          lightColor[2].x = lightColor[2].x > 0 ? 0 : 226;
          lightColor[2].y = lightColor[2].y > 0 ? 0 : 211;
          lightColor[2].z = lightColor[2].z > 0 ? 0 : 133;
        }
        
}



void updateCamera() {
  float cameraSpeed = 60.0;
  float cameraDrag = 0.95;

  // Déplacement de la caméra en fonction des touches enfoncées
  if (keyPressed) {
    if (key == 'w') {
      cameraZ -= cameraSpeed;
    } else if (key == 's') {
      cameraZ += cameraSpeed;
    } else if (key == 'a') {
      cameraX -= cameraSpeed;
    } else if (key == 'd') {
      cameraX += cameraSpeed;
    } else if (key == 'q') {
       countRot-=4;
    rotateX = countRot * 0.01;
    } else if (key == 'e') {
      countRot+=4;
    rotateX = countRot * 0.01; 
    }
  }

  // Déplacement de la caméra en fonction de la position de la souris
  /*cameraX += (mouseX - cameraX) * cameraDrag;
  cameraY += (mouseY - cameraY) * cameraDrag;*/

  // Mise à jour de la position de la caméra
  camera(cameraX, cameraY, cameraZ,
         cameraX, cameraY, cameraZ - 100,
         0, 1, 0);
}

void mouseMoved() {
  float cameraDrag = 0.95;
  /*cameraX += (mouseX - cameraX) * cameraDrag;*/
  /*cameraY += (mouseY - cameraY) * cameraDrag;*/
  /*cameraX += -cameraX * cameraDrag;
  cameraY += -cameraY * cameraDrag;*/
  // Mise à jour de la position de la caméra
         
  int currentMouseX = mouseX;
  if (currentMouseX > previousMouseX) {
    countRot+=4;
    rotateX = countRot * 0.01;  
  } else if (currentMouseX < previousMouseX) {
    countRot-=4;
    rotateX = countRot * 0.01;
  }
  previousMouseX = currentMouseX;
  
  camera(cameraX, cameraY, cameraZ,
         cameraX, cameraY, cameraZ - 100,
         0, 1, 0);
         
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
