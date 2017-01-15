/*PeasyCamOrthoViewZoom
by  Jun Maruyama https://github.com/junmaruyamamusic/PeasyCamOrthoZoom

# Overview
This is a Sample code of processing 3 to enable zooming in ortho view with PeasyCam library by Jonathan Feinberg.

# Reference
http://mrfeinberg.com/peasycam/  
http://30min-processing.hatenablog.com/entry/2016/05/09/000000  
see also:  
https://forum.processing.org/one/topic/peasycam-with-ortho-view.html

# Description
PeasyCamはJonathan Feinbergさんが開発した
カメラのズームや回転などを簡単に行える便利なライブラリです。  
processingのortho()メソッドを使って、遠近感の無いortho視点にすると
PeasyCamのカメラのズームが効かなくなるので、
ortho()メソッドの第一引数、第二引数の値(=ortho視点のクリッピング範囲)を、
マウスホイールの操作に応じて変化させることで、疑似的にズームできるようにしました。  
現状ではzoomの動きがカクカクするという課題があります。

# Usage
press 'c' key to switch ortho/perspective view.

*/

import peasy.*;
PeasyCam cam;
boolean isOrtho=true; //描画モードをorthoモードにするかperspectiveモードにするか
float zoomRatio = 1.0; //orthoモードのときのズーム比率
PFont font;

void setup() {
  size(500, 500, P3D);

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  font = createFont("SansSerif.plain", 48);
  textFont(font);
  
}
void draw() {
  
  if (isOrtho) {
    ortho(-width / 2*zoomRatio, width / 2*zoomRatio, -height / 2*zoomRatio, height / 2*zoomRatio, 0, 1000);
  } else {
    perspective();
  }

  //print(cam.getDistance());
  //print("  ");
  //println(zoomRatio);
  
  rotateX(-.5);
  rotateY(-.5);
  background(0);
  fill(255, 0, 0);
  box(30);
  pushMatrix();
  translate(0, 0, 20);
  fill(0, 0, 255);
  box(5);
  popMatrix();

  //描画モードの表示
  textSize(10);
  textAlign(LEFT);
  fill(225, 255, 255);
  if (isOrtho) {
    text("ortho view", width/15, 0);
  } else {
    text("perspective view", width/15, 0);
  }  
  
}

//cキーをクリックするたびに、perspectiveモードとorthoモードを切り替える
void keyPressed() {
  if (key=='c') {
    if (isOrtho) {
      toPerspetive();
    } else {
      toOrtho();
    }
  }
}

//orthoモードの時に、マウスホイールの動きに合わせてズームする(ズームというよりwindowに投影する範囲を変える?)
void mouseWheel(MouseEvent event) {
  float e = event.getCount();

  zoomRatio += e/20; //適当な数字でeを割って、ホイールによるズームの効き具合を調整

  //peasyCamのカメラのズーム範囲とorthoモードののズーム範囲をむりやり合わせる
  if (zoomRatio>1.2) {
    zoomRatio =1.2;
  }
  if (zoomRatio < 0.1) {
    zoomRatio = 0.1;
  }
}

//perspectiveモードにする
void toPerspetive() {
  //現在のorthoモードのズーム比率を、easycamのカメラ距離にmapする
  cam.setDistance(map(zoomRatio, 0.1, 1.2, 50, 500));
  isOrtho = !isOrtho;
}

//orthoモードにする
void toOrtho() {
  //現在のeasycamのカメラ距離をorthoモードのズーム比率にmapする
  zoomRatio = map((float)cam.getDistance(), 50, 500, 0.1, 1.2);
  isOrtho = !isOrtho;
}