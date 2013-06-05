String somAtual;
boolean carregandoSom;

class Bolas {
  color corb;
  float x;
  float y;
  float vx;
  float vy;
  float  raio, g, atrito, ax;
  boolean cai;
  float t;
  //float brilho;
  int canal;
  boolean selecionada;

  //  boolean paraBola = false;

  Bolas () {
    raio = 42.5;
    g = 0.98;
    ax = 0;
    atrito = 1;
    t=255;
    canal= 0;
    selecionada = false;
    nbola = nbola +1;
    x = pmouseX; // incialização dos parâmetros das novas bolinhas criadas
    y = pmouseY;
    vx=0;
    vy=0;

    selecionada = false;
    cai = false;// a bolinha inicia parada
  }

  void criabola() {//desenha a bola

      for (int i= 0; i < nbola; i++) {
      pushMatrix();
      //scale(0.85);
      stroke(corb);
      fill(0, t); 
      strokeWeight(5);
      ellipse(x, y, raio, raio);
      strokeWeight(1);

      fill(cmenu[canal]);
      ellipse(x, y, raio/3, raio/3);  
      popMatrix();
    }
  }

  void gravidade() {// bola com a gravidade

      if (cai == true) {
      vy = vy +g;
    }
  }


  void chao() { // interação da bola com o chão
    if (y >= height- raio/2 ) {
      //inverte a velocidade da bolinha ao tocar ao chão
      vy= -vy;

      int qualNota;
      // garante que a bolinha sempre caia em uma tecla
      x = constrain(x, 1, width-1);  
      //diz qual nota foi tocada e acende o pedaço correspondente
      qualNota = int((x/intervalo));
      brilho[qualNota] = 255;

      //---------------------
      //println("toca" + qualNota + "------------------");
      tocadores[qualNota].tocaNota();

      //----------------------------
    }
  }
  void movimento() {// cinemática da bola
    for (int i= 0; i < nbola; i++) {

      if (cai == true) {
        vy = vy +g;
        y = y + vy;
        x= x + vx;
      }
      if (x<=0+raio/2 ||x>=width-raio/2) {
        vx=-vx;
      }
    }
  }


  void calcdentro() {

    //for (int i= 0; i < nbola; i++) {
    corb =color( 0);// a cor do stroke de cada bolinha


    //for (int i= 0; i < nbola; i++) {
    if ( (dist(mouseX, mouseY, x, y)<raio/2)) {    
      selecionada = true; // se o mouse tiver em cima, seleciona a bolinha
    }
    else {
      selecionada = false;
    }

    if (selecionada= true) {// se a bolinha esta selecionada
      cai = false;//ela para de cair
      strokeWeight(5);
      stroke(255, 0, 0);//fica selecionada em vermelho
      vy = 0;//zera as velocidades
      vx = 0;
      t=80;// fica transparente 
      corb= color(255, 0, 0);
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

    //for (int i= 0; i < nbola; i++) {

    if (x > xrect && x < xrect + tamxrect &&
      y > yrect && y < yrect + tamyrect) {// se as bolinhas estiverem dentro do quadrado seletor

      corb = color(255, 0, 0);
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






void maisbola(int knal) {// função costrutora das bolinhas
  //nbola refere ao número total de bolinhas

  nbola = nbola +1;
  bola[nbola].x = pmouseX; // incialização dos parâmetros das novas bolinhas criadas
  bola[nbola].y = pmouseY;
  bola[nbola].t=255;
  bola[nbola].vx=0;
  bola[nbola].vy=0;
  bola[nbola].canal = knal; 
  bola[nbola].selecionada = false;
  bola[nbola].cai = false;// a bolinha inicia parada
  nbola = nbola +1;
  if (nbola > 300) {// garante o número máximo de 300 bolinhas
    nbola = 300;
  }
}

void menosbola() { // função destrutora das bolinhas

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
//}

