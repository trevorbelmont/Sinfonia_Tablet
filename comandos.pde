String somAtual;
boolean carregandoSom;

void criabola() {//desenha a bola

    for (int i= 0; i < nbola; i++) {
    pushMatrix();
    //scale(0.85);
    stroke(corb[i]);
    fill(0, t[i]); 
    strokeWeight(5);
    ellipse(x[i], y[i], raio, raio);
    strokeWeight(1);

    fill(cmenu[canal[i]]);
    ellipse(x[i], y[i], raio/3, raio/3);  
    popMatrix();
  }
}

void gravidade() {// bola com a gravidade
  for (int i= 0; i < nbola; i++) {  
    if (cai[i] == true) {
      vy[i] = vy[i] +g;
    }
  }
}

void chao() { // interação da bola com o chão
  for (int i= 0; i < nbola; i++) {
    if (y[i] >= height- raio/2 ) {
      //inverte a velocidade da bolinha ao tocar ao chão
      vy[i] = -vy[i];

      int qualNota;
      // garante que a blinha sempre caia em uma tecla
      x[i] = constrain(x[i], 1, width-1);  
      //diz qual nota foi tocada e acende o pedaço correspondente
      qualNota = int((x[i]/intervalo));
      brilho[qualNota] = 255;
    
     //---------------------
     println("toca" + qualNota + "------------------");
     tocadores[qualNota].tocaNota();
     
    //---------------------------- 
     
     
    }
  }
}

void lixeira(float _x, float _y) {
  if (segurou) {
    fill(75, 159, 191, 100);
    rect(Xlixeira, Ylixeira, tamXlixeira, tamYlixeira);
    image(lixeira, Xlixeira, Ylixeira, tamXlixeira, tamYlixeira);
    if (_x > Xlixeira && _x < Xlixeira + tamXlixeira &&
      _y > Ylixeira && _y < Ylixeira + tamYlixeira) {// se as bolinhas estiverem dentro do quadrado seletor

      menosbola();
      segurou = false;
    }
  }
}


void movimento() {// cinemática da bola
  for (int i= 0; i < nbola; i++) {

    if (cai[i] == true) {
      vy[i] = vy[i] +g;
      y[i] = y[i] + vy[i];
      x[i]= x[i] + vx[i];
    }
    if (x[i]<=0+raio/2 ||x[i]>=width-raio/2) {
      vx[i]=-vx[i];
    }
  }
}


void calcdentro() {

  for (int i= 0; i < nbola; i++) {
    corb[i] =color( 0);// a cor do stroke de cada bolinha
  }

  for (int i= 0; i < nbola; i++) {
    if ( (dist(mouseX, mouseY, x[i], y[i])<raio/2)) {    
      qualCai = i; // se o mouse tiver em cima, seleciona a bolinha
    }
  }

  if (qualCai > -1) {// se a bolinha esta selecionada
    cai[qualCai] = false;//ela para de cair
    strokeWeight(5);
    stroke(255, 0, 0);//fica selecionada em vermelho
    vy[qualCai] = 0;//zera as velocidades
    vx[qualCai] = 0;
    t[qualCai]=80;// fica transparente 
    corb[qualCai] = color(255, 0, 0);
  }
}
void rect_select() { // função que desenha o quadrado seletor das bolinhas
  noStroke();
  fill(43, 195, 214, 50);
  //stroke(0,255,0);
  rect(xrect, yrect, tamxrect, tamyrect);
}

void calc_rect_dentro() {//função que calcula interação do quadrado seletor com as bolinhas
  if (!mousePressed) return;// se n apertar o mouse sai da função

  for (int i= 0; i < nbola; i++) {

    if (x[i] > xrect && x[i] < xrect + tamxrect &&
      y[i] > yrect && y[i] < yrect + tamyrect) {// se as bolinhas estiverem dentro do quadrado seletor

      corb[i] = color(255, 0, 0);
    }
  }
}

void maisbola(int knal) {// função costrutora das bolinhas
  //nbola refere ao número total de bolinhas
  x[nbola] = pmouseX; // incialização dos parâmetros das novas bolinhas criadas
  y[nbola] = pmouseY;
  t[nbola]=255;
  vx[nbola] =0;
  vy[nbola] =0;
  canal[nbola] = knal; 
  cai[nbola] = false;// a bolinha inicia parada
  nbola = nbola +1;
  if (nbola > 300) {// garante o número máximo de 300 bolinhas
    nbola = 300;
  }
}

void menosbola() {// função destrutora das bolinhas

  nbola = nbola -1;
  if (nbola < 0) {
    nbola = 0;
  }
}
//********************************************
// funções responsáveis por carregar os sons de cada tecla ( notas dentro das oitavas)
//-> void fechaSons() {
//-> carregandoSom = true;
//->  for(int i= 0; i < oitava; i++){ 
//->  nota[i].close();
//->}
//->}

//-> void carregaSons(String pasta) {
/* ->  carregandoSom = true;  
 somAtual = pasta.substring(0);
 
 for(int i= 0; i < oitava; i++){  
 nota[i] = controleAudio.loadFile(pasta+"\\"+i+".wav");
 brilho[i] = 200;
 }
 
 carregandoSom = false;  
 println(carregandoSom);   
 <-*/
//-> }

