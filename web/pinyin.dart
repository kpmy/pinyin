import 'dart:html';
import 'dart:math';
import 'data.dart';
import 'dart:async';

var rnd = new Random();
var x = querySelector("#text");
var a = querySelector("#a");
var b = querySelector("#b");
var c = querySelector("#c");

void nextSym(){

  var next = rnd.nextInt(data.length);
  x.attributes["data-answer"] = next.toString();
  x.text = data[next][datasym];

  var variants = [];
  variants.length = 3;
  var correct = rnd.nextInt(variants.length);
  variants[correct] = next;
  for(var i = 0; i<3;){
    if (i == correct) {
      i++;
    } else {
      var v = rnd.nextInt(data.length);
      if (v != next) {
        variants[i] = v;
        i++;
      }
    }
  }
  a.attributes["value"] = data[variants[0]][dataval];
  a.attributes["data-answer"] = variants[0].toString();
  b.attributes["value"] = data[variants[1]][dataval];
  b.attributes["data-answer"] = variants[1].toString();
  c.attributes["value"] = data[variants[2]][dataval];
  c.attributes["data-answer"] = variants[2].toString();
}

void reset(){
  x.attributes["style"] = "color: black;";
  nextSym();
}

const duration = const Duration(milliseconds: 500);

void correct(){
  x.attributes["style"] = "color: green;";
  new Timer(duration, reset);
}

void incorrect(){
  x.attributes["style"] = "color: red;";
  new Timer(duration, reset);
}

void answer(int variant){
  print(variant);
  print(int.parse(x.attributes["data-answer"]));
  if (int.parse(x.attributes["data-answer"]) == variant) {
    correct();
  } else {
    incorrect();
  }
}

void main() {

  a.onClick.listen((e) => answer(int.parse(a.attributes["data-answer"])));
  b.onClick.listen((e) => answer(int.parse(b.attributes["data-answer"])));
  c.onClick.listen((e) => answer(int.parse(c.attributes["data-answer"])));

  nextSym();
}
