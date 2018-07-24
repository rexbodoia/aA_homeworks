document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 50, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 8;
  ctx.stroke();
  ctx.fillStyle = 'green';
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(350, 75);
  ctx.lineTo(125, 350);
  ctx.lineTo(125, 50);
  ctx.fillStyle = 'purple'
  ctx.fill();
});
