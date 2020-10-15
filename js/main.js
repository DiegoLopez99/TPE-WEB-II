document.addEventListener("DOMContentLoaded", function(){
"use strict";

//menu toggle
let menu = document.querySelector("#menu");
let toggleIcon = document.querySelector("#icon-toggle");

toggleIcon.addEventListener("click", ()=>{
    menu.classList.toggle("menu-on");
});

//slidershow Home
let indice = 1;
mostrarSlides(indice);

function avanzarSlide(n){
    mostrarSlides(indice += n);
}

function posicionSlide(n){
    mostrarSlides(indice = n);
}

function mostrarSlides(n){
    let i;
    let slides = document.getElementsByClassName('item');
    let barras = document.getElementsByClassName('barra');

    if(n > slides.length){
        indice = 1;
    }
    if(n < 1){
        indice = slides.length;
    }
    for(i = 0; i < slides.length; i++){
        slides[i].style.display = 'none';
    }
    for(i = 0; i < slides.length; i++){
        barras[i].className = barras[i].className.replace(" active", "");
    }

    slides[indice-1].style.display = "block";
    barras[indice-1].className += " active";
}

document.querySelector("#ant").addEventListener("click", function (){
    avanzarSlide(-1);
});
document.querySelector("#sig").addEventListener("click", function(){
    avanzarSlide(1);
});
document.querySelector("#barra1").addEventListener("click", function(){
    posicionSlide(1)
});
document.querySelector("#barra2").addEventListener("click", function(){
    posicionSlide(2);
});
document.querySelector("#barra3").addEventListener("click", function(){
    posicionSlide(3);
});


});