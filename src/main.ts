let text:string = "piesio";
console.log(text + ' = ' + typeof(text));
let liczba: number = 123;
console.log(liczba +  ' = ' + typeof(liczba));
let x = true;
console.log(x + ' = ' + typeof(x));
let imie:string = "pies";
let nazwisko:string = 'psi';
let pelne:String = `mam na imie ${imie} a na nazwisko ${nazwisko}`;
console.log(pelne + "\n");

console.log(`${imie} = ${typeof imie}`);
console.log(`${nazwisko} = ${typeof imie}`);
console.log(`${pelne} = ${typeof imie}`);

let posesja: number = 17;
let metraz: number = 232.33;
let wartosc:number = 232322;
console.log(`Wartosc domu przy ulicy lesna ${posesja} o metrazu ${metraz}m2 wynosi ${wartosc}zl \n`)
let binary = 0o111101;
console.log(`${binary} = ${typeof binary} \n`)

let mezczyzna: boolean;
let kobieta: boolean;
const Agnieszka:string = 'kobieta';

if(Agnieszka=='kobieta'){
  kobieta = true;
  mezczyzna = false;
}
else{
  kobieta=true;
  mezczyzna=false;
}

console.log(`zmienna mezczyzna ma wartosc ${mezczyzna} a zmienna kobieta ma wartosc ${kobieta} dla osoby o imieniu Agnieszka \n`);

let limit:number = 100;
let i:number = 2;
while(i!=101){
  if(limit%i==0){
    console.log(`${i} to liczba pierwsza`)
    limit--;
    i++;
  }
  else{
    console.log(`${i} to nie jest liczba pierwsza`)
    limit-=1;
    i++;
  }
}
