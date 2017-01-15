# Overview
This is a Sample code of processing 3 to enable zooming in ortho view with PeasyCam library by Jonathan Feinberg.

# Description
PeasyCamはJonathan Feinbergさんが開発した
カメラのズームや回転などを簡単に行える便利なライブラリです。  
processingのortho()メソッドを使って、遠近感の無いortho視点にすると
PeasyCamのカメラのズームが効かなくなるので、
ortho()メソッドの第一引数、第二引数の値(=ortho視点のクリッピング範囲)を、
マウスホイールの操作に応じて変化させることで、疑似的にズームできるようにしました。  
現状ではzoomの動きがカクカクするという課題があります。

# Install
download peasycamorthozoom.pde and run with processing 3.

# Requirement
PeasyCam library which can be easily installed form the Contribution Manager on processing 3 IDE.

# Usage
press 'c' key to switch ortho/perspective view.

# Reference
http://mrfeinberg.com/peasycam/  
http://30min-processing.hatenablog.com/entry/2016/05/09/000000  
see also:  
https://forum.processing.org/one/topic/peasycam-with-ortho-view.html
