let gameMatrix;


function initGameEngine() {
    gameMatrix = new Array(16);
    for (let i = 0; i < 16; i++)
        gameMatrix[i] = {
            x: i % 4,
            y: Math.floor(i / 4)
        };
}

function canMove(num) {

    let selectedPosition = gameMatrix[num];
    let emptyPosition = gameMatrix[15];
    if(selectedPosition.x === emptyPosition.x){
        return Math.abs(selectedPosition.y-emptyPosition.y) === 1;
    }
    if(selectedPosition.y === emptyPosition.y){
        return Math.abs(selectedPosition.x-emptyPosition.x) === 1;
    }
    return false;
}

function showCanMove(num, div) {
    if(canMove(num))
        div.classList.add("hover");
}

function hideCanMove(div) {
    div.classList.remove("hover");
}

function movePiece(num, div) {
    if(!canMove(num))
        return;

    let selectedPosition = gameMatrix[num];
    let emptyPosition = gameMatrix[15];
    let xOffset = 0;
    let yOffset = 0;
    if(selectedPosition.x === emptyPosition.x){
        yOffset = selectedPosition.y-emptyPosition.y;
    }
    if(selectedPosition.y === emptyPosition.y){
        xOffset = selectedPosition.x-emptyPosition.x;
    }

    //swap
    let temp = gameMatrix[num];
    gameMatrix[num] = gameMatrix[15];
    gameMatrix[15] = temp;


    let pos = 0;
    let id = setInterval(frame, 5);
    function frame() {
        if (pos === 100) {
            clearInterval(id);
        } else {
            pos++;
            if(yOffset !== 0)
            div.style.top = (parseInt(div.style.top,10) - yOffset) + "px";
            if(xOffset !== 0)
            div.style.left = (parseInt(div.style.left,10) - xOffset) + "px";
        }
    }
}

function initPuzzle() {
    let puzzleArea = document.getElementById("puzzlearea");
    let divs = puzzleArea.getElementsByTagName("div");
    for (let div of divs) {
        let num = parseInt(div.innerText, 10) - 1;
        let x = num % 4 ;
        let y = Math.floor(num / 4);
        div.style.backgroundImage = "url('background.jpg')";
        div.style.backgroundPositionX = (-x * 100) + "px";
        div.style.backgroundPositionY = (-y * 100) + "px";
        div.style.left = (x * 100 ) + "px";
        div.style.top = (y * 100) + "px";
        div.position = "absolute";

        div.onmouseenter = function (ev) {
            showCanMove(num, div);
        };
        div.onmouseleave = function (ev) {
            hideCanMove(div);
        }

        div.onclick = function () {
            movePiece(num, div);
        }
    }
}

function shuffle(num) {
    let x = num % 4 - 1;
    let y = Math.floor(num / 4);
}


function init() {
    document.getElementById("shufflebutton").onclick = shuffle();
    initPuzzle();
    initGameEngine();
}

window.addEventListener('DOMContentLoaded', function () {
    init();
});