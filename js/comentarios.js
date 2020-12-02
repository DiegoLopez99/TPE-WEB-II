"use strict";

document.addEventListener('DOMContentLoaded', () =>{
    getComentarios();

    document.querySelector("#form-comentario").addEventListener('submit', e => {
        e.preventDefault();
        agregarComentario();
    });

    document.querySelector("#eliminar").addEventListener("click", eliminarComentario);
});

function getComentarios(){
    fetch('api/comentarios')
        .then(response => response.json())
        .then(comentarios => render(comentarios))
        .catch(error => console.log(error));
}

function agregarComentario() {
    let juego = document.querySelector("#cont-juego");
    const comentario = {
        texto: document.querySelector('input[name="texto"]').value,
        id_usuario: document.querySelector('select[name="id_usuario"]').value,
        id_juego: juego.dataset.idJuego,
        puntuacion: document.querySelector('select[name="puntuacion"]').value
    }
    console.log(comentario);

    fetch('api/comentarios',{
        method: 'POST',
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(comentario)
    })
        .then(response => response.json())
        .then(coment => getComentarios())
        .catch(error => console.log(error));
}

function render(comentarios) {
    const container = document.querySelector("#comentarios-list");
    container.innerHTML = "";
    let contJuego = document.querySelector("#cont-juego");
    for (let comentario of comentarios) {
        if(comentario.id_juego == contJuego.dataset.idJuego){
            container.innerHTML += `<li>${comentario.texto} <button id="eliminar" data-id-comentario=${comentario.id}>Eliminar</button></li>`;
        }
    }
}

function eliminarComentario(){

}