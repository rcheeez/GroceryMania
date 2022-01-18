
function validate(){
	var pass1 = document.getElementById("psd1").value;
	var pass2 = document.getElementById("psd2").value;
	
	if(pass1 != pass2){
		
		document.getElementById("err").innerHTML = "Password did not match!";
		return false;
		
	}
	else{
		
	}
	

}