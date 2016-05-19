const datasym = 0;
const dataval = 1;
const datatip = 2;

const t1 = '\u0304'; // ровный
const t2 = '\u0301'; // восходящий
const t3 = '\u0306'; // волна
const t4 = '\u0300'; // нисходящий

var dict = [
  ["你","ni$t3", "ты"],
  ["好", "ha${t3}o", "хорошо"],
  ["吗", "ma", "?"],
  ["我", "wo$t3", "я"],
  ["很", "he${t3}n", "очень"],
  ["呢", "ne", "но"],
  ["也", "ye$t3", "тоже"],
  ["忙", "ma${t2}ng", "занят"],
  ["不", "bu$t4", "нет"],
  ["哥哥", "ge${t1}ge${t1}", "старший брат"],
  ["第第", "di${t4}di${t4}", "младший брат"],
  ["们", "men", "мн. число"],
  ["都", "do${t1}u", "все"],
  ["他", "ta$t1", "он"],
  ["这", "zhe${t4}", "это"],
  ["是", "shi${t4}", "есть, да, правильно"],
  ["爸爸", "ba${t4}ba${t4}", "папа"],
  ["妈妈", "ma${t1}ma${t1}", "мама"],
  ["朋友", "pe${t2}ngyou", "друг"],
  ["大夫", "da${t4}ifu", "врач"],
  ["的", "de", "притяжание"],
  ["车", "che${t1}", "транспорт"],
  ["那", "na${t4}", "то"],
  ["她", "ta${t1}'", "она"],
  ["书", "shu${t1}", "книга"],
  ["哪", "na$t3", "какой"],
  ["国", "guo$t2", "страна"],
  ["人", "re${t2}n", "люди"],
  ["谁", "she${t2}i", "кто"],
  ["老师", "la${t3}oshi${t1}", "учитель"],
  ["老", "la${t3}o", "старый"],
  ["师", "shi${t1}", "мастер"],
  ["汉语", "ha${t4}nyu${t3}", "китайский язык"],
  ["汉", "ha${t4}n", "китайский"],
  ["语", "yu${t3}", "язык"],
  ["中国", "Zho${t1}ngguo${t2}"]
];
//
// ["", "", ""],