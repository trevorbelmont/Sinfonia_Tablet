

import processing.opengl.*;
//Bibliotecas do android 
import android.view.MotionEvent;
import ketai.ui.*;

KetaiGesture gesture;

Tocador tocadores[];

//vetores de movimento

float Xlixeira, Ylixeira, tamXlixeira, tamYlixeira;

// variável que controla o nº de bolas
int nbola;
float yt;
int divisao;
float oit;

boolean segurou;
PImage lixeira;

// variáveis do raio da bola, a gravidade, o atrito, aceleração do x, respectivamente  


boolean dentro;

// resolve problema do longPress + mouseDragged
boolean paraBola = false;

//boolean cai[] = new boolean[300];
int qualCai = -1;
//float t[]= new float[300];
float xrect, yrect, tamxrect, tamyrect ;
float intervalo;
float brilho[] = new float[100];

float colorir;
float br;

//int canal[] = new int [300];

Bolas bola[];

void setup() {
  bola = new Bolas[300];
   for (int i = 0; i < 300; i++) {
     bola[i] = new Bolas();
   }
  tocadores = new Tocador[25];
  for (int i = 0; i < 25; i++) {
    tocadores[i] = new Tocador(i, this);
  }


  size(displayWidth, displayHeight, OPENGL);

  orientation(LANDSCAPE);
  gesture = new KetaiGesture(this);

  //variáveis de posição do select do mouse arrastado
  xrect = mouseX;
  yrect = mouseY;

  //quantidade de divisões(notas) na tela
  divisao = 25; 
  oit = 25.0;
  smooth();
  //inicializa com nenhuma bola selecionada
  dentro = false; 
  segurou = false;
  //inicializa com 1 bola na tela
  nbola = 1;

  lixeira = loadImage ("excluir_select.png");
  Xlixeira = displayWidth - 50;
  Ylixeira = 50;
  tamXlixeira = 50;
  tamYlixeira = 50;

  /*for (int i= 0; i < nbola; i++) {
   x[i] = random(50, width - 50);
   y[i] = random(50, height-100);
   vy[i] = 0;
   t[i]=255;
   canal[i] = 0;
   yt = height/2;
   }*/


  /*
  // carrega os arquivos de audio de acordo com seu lugar nas notas na tela (oitava)
   for(int i= 0; i < divisao; i++){  
   nota[i] = controleAudio.loadFile(i+".wav");
   brilho[i] = 200;
   }
   */


  //função responsável por achar os arquivos no diretório e carregar os sons
  //recebe uma String que é o nome da pasta
  //carregaSons("piano");

  //função do tema básico.
  temabasico();


  /* raio = 42.5;
   g = 0.98;
   ax = 0;
   atrito = 1;
   */
  // estipula o numero de divisões com seu tamanha realtivo ao da tela
  intervalo = width/oit;
}

void draw() {

  background(255);

  fundo(divisao); //função do fundo

    //calc_rect_dentro();  //função da dinâmica do quadrado de seleção com a bola 

  for (int i=0; i < nbola; i++) {
    println("-------------------------------------------------------------------------------");
    println( i + " " + bola[i].selecionada);
    println("-------------------------------------------------------------------------------");
    bola[i].criabola(); //função da bola que desenha

      bola[i].gravidade(); //função da bola que determina sua gravidade

      bola[i].chao(); // função da bola que é responsável por sua interação com o chão 

      bola[i].movimento(); //função da bola responsável pela cinemática e interação com as paredes laterais

    //corInstrumento();

    /*
  //desenha o retangulo seletor e verifica se existe bolas dentro
     if (mousePressed && qualCai == -1 && !paraBola) {
     
     tamxrect = mouseX - xrect;
     tamyrect = mouseY - yrect;
     
     bola[i].calcdentro();
     
     //rect_select();
     }
     else {
     xrect = mouseX;
     yrect = mouseY;
     }
     */
    if (bola[i].selecionada = true) {
      lixeira(bola[i].x, bola[i].y);
    }
  }
}

void mouseDragged() {
  if (paraBola) return;

  for (int i = 0; i <nbola; i++) {
    println("mouseDragged: qualcai = " + qualCai);

    //quando arrastada, a bolinha segue o mouse e fica com transparência
    if (bola[i].selecionada == true) {

      bola[i].x = mouseX;
      bola[i].y = mouseY;
      bola[i].t = 80; 

      xrect = pmouseX;
      yrect = pmouseY;
      segurou = true;
    }
  }
}


void mouseReleased() {
  for (int i = 0; i <nbola; i++) {
    //quando arrastada, a bolinha segue o mouse e fica com transparência
    if (bola[i].selecionada == true) {
      paraBola = false;
      // quando solta o mouse a bolinha cai
      //implementar um clique para soltar e se segurar apertando para a bolinha
      println("released: qualcai = " + qualCai); 


      // -> if (mouseButton == RIGHT) {
      bola[i].cai = true;
      bola[i].vx = mouseX-pmouseX;
      bola[i].vy = mouseY-pmouseY;
      // -> }
      // ->else {
      // ->  cai[qualCai] = false;
      // -> }
      bola[i].t = 255;
      bola[i].selecionada = false;
      //tamxrect = mouseX;
      //tamyrect = mouseY;
      //segurou = false;
    }
  }
}


void fundo(int nTons) {

  pushMatrix();
  for (int i=0; i<nTons; i++) {
    brilho[i] = brilho[i] - 5;
    brilho[i] = constrain(brilho[i], 200, 255);
    noStroke();
    float cor=i/(nTons*1.0)*255;

    colorir=cor; 
    br=brilho[i];   

    //mapea cada canal colocando um limete de tons de acordo com o numero de intervalos
    fill( map(i, 0, nTons, 0, a), map(i, 0, nTons, 0, b), map(i, 0, nTons, 0, c), brilho[i] );
    //ceil-> arrendonda o valor pra cima
    rect(0, -1, ceil(width/(nTons*1.0)+1), height+1);
    translate(ceil(width/nTons*1.0)+1.2, 0);
  } 
  popMatrix();
}
//*Gestures


void onDoubleTap(float x, float y) {
 maisbola(1);
}

void onLongPress(float x, float y) {
  println("longPress antes: qualcai = " + qualCai);
  paraBola = true;

  for (int i = 0; i < nbola; i++) { 

    if (bola[i].selecionada == true) {
      bola[i].cai = false;
    }
    //bola[i].selecionada = false;
    println("longPress depois: qualcai = " + qualCai);
  }
}


public boolean surfaceTouchEvent(MotionEvent event) {

  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);

  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}


//The MediaPlayer must be released when the app closes
public void onDestroy() {

  super.onDestroy(); //call onDestroy on super class

  for (int i = 0; i < 25; i++) {
    tocadores[i].destroi();
  }
}

