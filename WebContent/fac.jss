var a = parseInt(0);

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    
}
window.addEventListener('click', function(f){
  if ((!document.getElementById('exception').contains(f.target))){
    a=parseInt(1);
  }
})
window.addEventListener('click', function(e){
  if (a==1&&(!document.getElementById('mySidenav').contains(e.target))){
    document.getElementById("mySidenav").style.width = "0";
    a=parseInt(0);
  }
})