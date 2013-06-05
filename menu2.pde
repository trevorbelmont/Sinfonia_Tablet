//->  ControlP5 menuP5;
 //variáveis de cor do fundo
 float a;
 float b;
 float c;
 float d;
  //String instrumento="Padrao";
 color cmenu[] = new color [20];
 
 //int valorKnob; 
 //Knob Instrumento;
 
 void inicializaMenu2() {
 //println("valor Knob: "+valorKnob);
 cmenu[0] = color (255,0,0);
 cmenu[1] = color (0,82,255);
 cmenu[2] = color (31,129,3);
 cmenu[3] = color (121,71,42);
 cmenu[4] = color (255,0,183);
 cmenu[5] = color (255,0,0);
 cmenu[6] = color (255,115,0);
 cmenu[7] = color (108,42,42);
 cmenu[8] = color (255,247,3);
 cmenu[9] = color (250,217,189);
 cmenu[10] = color (0,189,255);
 cmenu[11] = color (0,255,232);
 cmenu[12] = color (126,0,255);
 cmenu[13] = color (0,0,0);
 }
 /* -> 
 menuP5 = new ControlP5(this);
 //mais = new controlP5.Button("mais",0,100,100,80,19);
 
 //______________________________________________________
 
 // botoes de criar bolas do instrumento
 
 
 Instrumento = menuP5.addKnob("knob",0,280,0,150,175,100);
 Instrumento.setLabel(instrumento);
 controlP5.Button b;
 
 b = menuP5.addButton("MaisInstrumento",0,170,300,25,20);
 b.setLabel("  +");
 
 b = menuP5.addButton("MenosInstrumento",0,200,300,25,20);
 b.setLabel("  -");
 
 b = menuP5.addButton("Gravar_som",0,170,150,25,20);
 b.setLabel("Rec");
 
 b = menuP5.addButton("Parar_som",0,200,150,25,20);
 b.setLabel("Stop");
 
 
 }
 
 
 void knob(int theValue) {
 
 int k = theValue/20;
 
 Instrumento.setValue(k*20);
 //menu = color(k);
 valorKnob = (abs(k));
 
 //instrumento =" bateria";
 Instrumento.setColorBackground(cmenu[valorKnob]);
 
 switch(valorKnob){
 //case 0 : Instrumento.setLabel("bateria"); break;
 case 0:Instrumento.setLabel("bateria"); break;
 case 1:Instrumento.setLabel("Coral");break;
 case 2:Instrumento.setLabel("Clarineta"); break;
 case 3:Instrumento.setLabel("Celo");break;
 case 4:Instrumento.setLabel("Funk"); break;
 case 5:Instrumento.setLabel("Guitarra"); break;
 case 6:Instrumento.setLabel("Banjo"); break;
 case 7:Instrumento.setLabel("Pluked");break;
 case 8:Instrumento.setLabel("Sino");break;
 case 9:Instrumento.setLabel("Teclado");break;
 case 10:Instrumento.setLabel("Orgao");break;
 case 11:Instrumento.setLabel("Ecstacy");break;
 case 12:Instrumento.setLabel("Brass");break;
 case 13:Instrumento.setLabel("Synth"); break;
 case 14:Instrumento.setLabel("Bateria"); break;
 }
 

 cmenu[0] = color (255,0,0);
 cmenu[1] = color (0,82,255);
 cmenu[2] = color (31,129,3);
 cmenu[3] = color (121,71,42);
 cmenu[4] = color (255,0,183);
 cmenu[5] = color (255,0,0);
 cmenu[6] = color (255,115,0);
 cmenu[7] = color (108,42,42);
 cmenu[8] = color (255,247,3);
 cmenu[9] = color (250,217,189);
 cmenu[10] = color (0,189,255);
 cmenu[11] = color (0,255,232);
 cmenu[12] = color (126,0,255);
 cmenu[13] = color (0,0,0);
 
 
/* ->
 }
 public void Gravar_som(int valor) {
 //fake 10
 myBus.sendControllerChange(9, 2, 100);
 }
 
 public void Parar_som(int valor) {
 //fake 10
 myBus.sendControllerChange(8, 2, 100);
 }
 
 public void MenosInstrumento(int valor) {
 menosbola();
 //println("!!");
 }
 
 public void maisbateria1(int valor) {
 maisbola(1);
 
 //println("!!");
 }
 
 public void menosbateria1(int valor) {  
 menosbola();
 
 }
 
 public void maiscoral(int valor) {
 maisbola(2);
 //println("!!");
 }
 
 public void menoscoral(int valor) {  
 menosbola();
 
 }
 
 public void maisclarineta(int valor) {
 maisbola(3);
 //println("!!");
 }
 
 public void menosclarineta(int valor) {  
 menosbola();
 
 }
 
 public void maiscelo(int valor) {
 maisbola(4);
 //println("!!");
 }
 
 public void menoscelo(int valor) {  
 menosbola();
 
 }
 
 public void maisfunk(int valor) {
 maisbola(5);
 //println("!!");
 }
 
 public void menosfunk(int valor) {  
 menosbola();
 
 }
 
 public void maisguitarra(int valor) {
 maisbola(6);
 //println("!!");
 }
 
 public void menosguitarra(int valor) {  
 menosbola();
 
 }
 
 
 public void maisbanjo(int valor) {
 maisbola(7);
 //println("!!");
 }
 
 public void menosbanjo(int valor) {  
 menosbola();
 
 }
 
 
 public void maispluked(int valor) {
 maisbola(8);
 //println("!!");
 }
 
 public void menospluked(int valor) {  
 menosbola();
 
 }
 
 public void maissino(int valor) {
 maisbola(9);
 //println("!!");
 }
 
 public void menossino(int valor) {  
 menosbola();
 
 }
 
 public void maisteclado(int valor) {
 maisbola(10);
 //println("!!");
 }
 
 public void menosteclado(int valor) {  
 menosbola();
 
 }
 
 public void maisorgao(int valor) {
 maisbola(11);
 //println("!!");
 }
 
 public void menosorgao(int valor) {  
 menosbola();
 
 }
 
 public void maisecstacy(int valor) {
 maisbola(12);
 //println("!!");
 }
 
 public void menosecstacy(int valor) {  
 menosbola();
 
 }
 
 public void maisbrass(int valor) {
 maisbola(13);
 //println("!!");
 }
 
 public void menosbrass(int valor) {  
 menosbola();
 
 }
 public void maissynth(int valor) {
 maisbola(14);
 //println("!!");
 }
 
 public void menossynth(int valor) {  
 menosbola();
 
 }
 ->   
 */
 public void temabasico(){
 
 a=255;
 b=255;
 c=255;
 d=255;
 
 }
 
 public void tema4(){
 
 a=225;
 b=180;
 c=10;
 d=255;
 
 }
 
 public void tema1(){
 a=0;
 b=255;
 c=0;
 d=br;
 }
 
 public void tema2(){
 a= 255;
 b= 0;
 c=0;
 d=255;
 }  
 
 public void tema3(){
 a=0;
 b=0;
 c=255;
 d=255;
 }
 /* ->  
 public void play(int valor){
 for(int buz=0; buz<nbola; buz++){
 dentro = false;
 g=0.98;
 }  
 }
 
 
 public void stop(int valor){
 nbola = 0;
 }
 
 
 
 public void pause(int valor){
 for(int i=0; i<nbola; i++){
 dentro = true;
 vy[i]=0;
 vx[i] = 0;
 g=0;
 }
 }
 public void c (int valor){
 nota[0].play(1);
 brilho[0] = 255;
 
 nota[4].play(1);
 brilho[4] = 255;
 
 nota[7].play(1);
 brilho[7] = 255;
 }
 
 public void d (int valor){
 nota[2].play(1);
 brilho[2] = 255;
 
 nota[6].play(1);
 brilho[6] = 255;
 
 nota[9].play(1);
 brilho[9] = 255;
 }
 
 public void e (int valor){
 nota[4].play(1);
 brilho[4] = 255;
 
 nota[8].play(1);
 brilho[8] = 255;
 
 nota[11].play(1);
 brilho[11] = 255;
 }
 
 public void f (int valor){
 nota[5].play(1);
 brilho[5] = 255;
 
 nota[9].play(1);
 brilho[9] = 255;
 
 nota[12].play(1);
 brilho[12] = 255;
 }
 
 public void g (int valor){
 nota[7].play(1);
 brilho[7] = 255;
 
 nota[11].play(1);
 brilho[11] = 255;
 
 nota[14].play(1);
 brilho[14] = 255;
 }
 
 public void a (int valor){
 nota[9].play(1);
 brilho[9] = 255;
 
 nota[13].play(1);
 brilho[13] = 255;
 
 nota[16].play(1);
 brilho[16] = 255;
 }
 
 public void b (int valor){
 nota[11].play(1);
 brilho[11] = 255;
 
 nota[15].play(1);
 brilho[15] = 255;
 
 nota[18].play(1);
 brilho[18] = 255;
 }
 
 public void piano (int valor){
 fechaSons();
 carregaSons("piano");
 }
 
 public void baixo (int valor){
 fechaSons();
 carregaSons("baixo");
 }
 
 public void bateria (int valor){
 fechaSons();
 carregaSons("bateria");
 }
 
 public void celo (int valor){
 fechaSons();
 carregaSons("celo");
 }
 
 public void violao (int valor){
 fechaSons();
 carregaSons("violao");
 }
 
 public void vibrafone (int valor){
 }
 
 
 public void coral (int valor){
 fechaSons();
 carregaSons("coral");
 }
 
 public void clarineta (int valor){
 fechaSons();
 carregaSons("clarineta");
 }
 
 public void trance (int valor){
 fechaSons();
 carregaSons("trance");
 }
 
 public void funk (int valor){
 fechaSons();
 carregaSons("funk");
 }
 
 public void psicodelic (int valor){
 fechaSons();
 carregaSons("psicodelic");
 }
 
 public void MaisInstrumento (int valor){
 maisbola(valorKnob);
 ;
 }
 
 
 
 
 
 
 
 
 
 
 
 //public void coral (int valor){
 //carregaSons("baixo");
 //}
 
 
/*public void oitava(int valor){
 oitava = 13;
 }
 
 public void oitavas(int valor){
 oitava = 25;
 }
 ->  */
//fill(cor,cor, cor,brilho[i]); preto e branco
//fill(brilho[i],cor, 0); vermelho degradê com amarelo
//fill(0,cor, brilho[i]); azul degradê com verde água


