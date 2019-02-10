document.addEventListener("DOMContentLoaded", function () {

  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const context = canvas.getContext('2d');
  context.fillStyle = 'red';
  context.fillRect(0, 0, 500, 500);
  context.beginPath();
  context.arc(100, 100, 25, 0, 2 * Math.PI, true);
  context.strokeStyle = 'blue';
  context.lineWidth = 2;
  context.stroke();
  context.fillStyle = 'grey';
  context.fill();
});