var text = "piesio";
console.log(text + ' = ' + typeof (text));
var liczba = 123;
console.log(liczba + ' = ' + typeof (liczba));
var x = true;
console.log(x + ' = ' + typeof (x));
var imie = "pies";
var nazwisko = 'psi';
var pelne = "mam na imie ".concat(imie, " a na nazwisko ").concat(nazwisko);
console.log(pelne + "\n");
console.log("".concat(imie, " = ").concat(typeof imie));
console.log("".concat(nazwisko, " = ").concat(typeof imie));
console.log("".concat(pelne, " = ").concat(typeof imie));
var posesja = 17;
var metraz = 232.33;
var wartosc = 232322;
console.log("Wartosc domu przy ulicy lesna ".concat(posesja, " o metrazu ").concat(metraz, "m2 wynosi ").concat(wartosc, "zl \n"));
var binary = 37441;
console.log("".concat(binary, " = ").concat(typeof binary, " \n"));
var mezczyzna;
var kobieta;
var Agnieszka = 'kobieta';
if (Agnieszka == 'kobieta') {
    kobieta = true;
    mezczyzna = false;
}
else {
    kobieta = true;
    mezczyzna = false;
}
console.log("zmienna mezczyzna ma wartosc ".concat(mezczyzna, " a zmienna kobieta ma wartosc ").concat(kobieta, " dla osoby o imieniu Agnieszka \n"));
var limit = 100;
var i = 2;
while (i != 100) {
    if (limit % i == 0) {
        console.log("".concat(i, " to liczba pierwsza"));
        limit -= 1;
        i++;
    }
    else {
        console.log("".concat(i, " to nie jest liczba pierwsza"));
        limit -= 1;
        i++;
    }
}
