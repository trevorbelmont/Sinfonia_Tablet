import apwidgets.*;

class Tocador {
  APMediaPlayer tocador;


  Tocador( int q, PApplet p ) {
    tocador = new APMediaPlayer( p );
    tocador.setMediaFile(q+".wav");
    tocador.setLooping(false);
    tocador.setVolume(1.0, 1.0);
  }

  void tocaNota() {

    //tocador.setMediaFile(("0.wav");
    tocador.seekTo(0); //rebobina depois de tocar
    tocador.start();
  }

  void destroi() {
    if (tocador!=null) { //must be checked because or else crash when return from landscape mode
      tocador.release(); //release the player
    }
  }


}

