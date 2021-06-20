void keyPressed() {
  if (key == '1' && state >0 ) {
    updatePixels();
    state--;
    println(state);
  } else if (key == '2' && state < 8) {
    state++;
    println(state);
  }
  drawShapeType=state;

  if (keyCode == DOWN) 
  {
    // gain/=2;
    init_gain1/=2;  
    // println(gain);
  } 
  else if (keyCode == UP)
  {
    // gain*=2;
    init_gain1*=2;
    // println(gain);
  }
  else if (key == 'k')
  {
    doShake=!doShake;
    println("Rotation =",doShake);
  }
  else if (key == 'j')
  {
    doBackground=!doBackground;
    jPressed=!jPressed;
  }
  else if (key == 'l')
  {
    doBackgroundToggle=!doBackgroundToggle;
  }
  else if (key == ';')
  {
    fxsys.startRandomEffect(int(random(0,fxsys.totalNumEffects)));
  } 
  else if (keyCode == LEFT) 
  {
    if(effectIndex==0) effectIndex=fxsys.totalNumEffects-1;
    else effectIndex--;
    println(effectsList[effectIndex]);
  }
  else if (keyCode == RIGHT) 
  {
    effectIndex=(effectIndex+1)%fxsys.totalNumEffects;
    println(effectsList[effectIndex]);
  } 
  else if (key == ' ')
  {
    fxsys.startRandomEffect(effectIndex);
  } 
  else if (key == 'o')
  {
    doMouseRotate=!doMouseRotate;
  } 
  else if (key == 'x')
  {
    colorSpan=max(0.1,colorSpan/2);
  }
  else if (key == 'c')
  {
    colorSpan=min(1,colorSpan*2);
  } 
 else if (key == 'c')
  {
    colorSpan=min(1,colorSpan*2);
  } 
  // println("GAIN:",gain);
}

// void mousePressed() {
//   if(mouseButton == RIGHT) {
//     doMouseRotate=!doMouseRotate;
//     println("doMouseRotate: "+doMouseRotate);
//   }
// }

void keyReleased() {
  if (key == 'j')
  {
    doBackground=true;
  }
}