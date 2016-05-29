import 'dart:html';
import 'dart:math';
import 'data.dart';
import 'dart:async';

var rnd = new Random();
var x = querySelector("#text");
var tip = querySelector("#tip");
var a = querySelector("#a");
var b = querySelector("#b");
var c = querySelector("#c");
var sw = querySelector("#switch");

var data = [];
void next(){
  var next = rnd.nextInt(data.length);
  x.attributes["data-answer"] = next.toString();
  x.text = data[next][datasym];
  tip.text = data[next][datatip];

  var variants = [];
  variants.length = 3;
  var correct = rnd.nextInt(variants.length);
  variants[correct] = next;
  for(var i = 0; i<3;){
    if (i == correct) {
      i++;
    } else if (data.length == 1){
      variants[0] = correct;
      variants[1] = correct;
      variants[2] = correct;
      break;
    } else {
      var v = rnd.nextInt(data.length);
      if (v != next) {
        variants[i] = v;
        i++;
      }
    }
  }
  a.text = data[variants[0]][dataval];
  a.attributes["data-answer"] = variants[0].toString();
  b.text = data[variants[1]][dataval];
  b.attributes["data-answer"] = variants[1].toString();
  c.text = data[variants[2]][dataval];
  c.attributes["data-answer"] = variants[2].toString();
}

Map<String, int> score = {};

void initScore(){
  for(var i = 0; i<dict.length; i++){
    score[dict[i][datasym]] = 0;
  }
}

void nextSym(){
  data = [];
  for(var i = 0; i<dict.length; i++){
    if(score[dict[i][datasym]]<2){
      data.add(dict[i]);
    }
  }
  if(data.length>0){
    next();
  }else{
    x.text = ".";
    tip.text = "";
  }
}

void reset(){
  x.attributes["style"] = "color: black;";
  nextSym();
}

const duration = const Duration(milliseconds: 500);

void correct(variant){
  score[data[variant][datasym]]++;
  x.attributes["style"] = "color: green;";
  new Timer(duration, reset);
}

void incorrect(){
  x.attributes["style"] = "color: red;";
  new Timer(duration, reset);
}

void answer(int variant){
//  print(variant);
//  print(int.parse(x.attributes["data-answer"]));
  if (int.parse(x.attributes["data-answer"]) == variant) {
    correct(variant);
  } else {
    incorrect();
  }
}

void switchTo(){
  if(datasym == 0){
    datasym = 1;
    dataval = 0;
    sw.text = "putonghua";
  } else {
    datasym = 0;
    dataval = 1;
    sw.text = "pinyin";
  }
  initScore();
  nextSym();
}

void main() {
  a.onClick.listen((e) => answer(int.parse(a.attributes["data-answer"])));
  b.onClick.listen((e) => answer(int.parse(b.attributes["data-answer"])));
  c.onClick.listen((e) => answer(int.parse(c.attributes["data-answer"])));

  sw.onClick.listen((e) => switchTo());
  initScore();
  nextSym();
}
