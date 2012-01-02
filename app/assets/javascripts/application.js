// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
var canvas;
var clickX = new Array();
var clickY = new Array();
var clickDrag = new Array();
var paint;

var width = 500;
var height = 500;

function prepareCanvas() {

	var canvasDiv = document.getElementById('canvasDiv');
	canvas = document.createElement('canvas');
	canvas.setAttribute('id', 'drawingCanvas');
	canvas.setAttribute('width', width);
	canvas.setAttribute('height', height);
	canvasDiv.appendChild(canvas);
	if(typeof G_vmlCanvasManager != 'undefined') {
		canvas = G_vmlCanvasManager.initElement(canvas);
	}

	document.onselectstart = function(){ return false; }

	context = canvas.getContext("2d");

	canvas = $('#drawingCanvas');

	canvas.mousedown(function(e){
		var mouseX = e.pageX - this.offsetLeft;
		var mouseY = e.pageY - this.offsetTop;

		paint = true;
		addClick(e.pageX - this.offsetLeft, e.pageY - this.offsetTop);
		redraw();
	});

	canvas.mousemove(function(e){
		if(paint){
			addClick(e.pageX - this.offsetLeft, e.pageY - this.offsetTop, true);
			redraw();
		}
	});

	canvas.mouseup(function(e){
		paint = false;
	});

	canvas.mouseleave(function(e){
		paint = false;
	});

	$('#clearButton').click( function() {
		clearCanvas();
	});

	$('#saveButton').click( function() {
		saveImage();
	});
}

function saveImage() {
	var oCanvas = document.getElementById("drawingCanvas");
	Canvas2Image.saveAsPNG(oCanvas);
}

function redraw(){
	context.fillStyle = '#ffffff';
	context.fillRect(0, 0, width, height);
	canvas.width = canvas.width;

	context.strokeStyle = "#333";
	context.lineJoin = "round";
	context.lineWidth = 3;

	for(var i=0; i < clickX.length; i++)
	{
		context.beginPath();
		if(clickDrag[i] && i){
			context.moveTo(clickX[i-1], clickY[i-1]);
		}else{
			context.moveTo(clickX[i]-1, clickY[i]);
		}
		context.lineTo(clickX[i], clickY[i]);
		context.closePath();
		context.stroke();
	}
}

function addClick(x, y, dragging)
{
	clickX.push(x);
	clickY.push(y);
	clickDrag.push(dragging);
}

function clearCanvas()
{
	context.fillStyle = '#ffffff'; // Work around for Chrome
	context.fillRect(0, 0, width, height); // Fill in the canvas with white
	canvas.width = canvas.width; // clears the canvas
	clickX = new Array();
	clickY = new Array();
	clickDrag = new Array();
}