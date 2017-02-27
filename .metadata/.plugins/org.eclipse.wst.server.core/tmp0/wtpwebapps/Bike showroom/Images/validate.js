function validateText(x){
  	var ed=x.value;
 var pattern = /^([a-zA-Z0-9\_\. ]{4,25})$/;
 if(pattern.test(ed)) 
  return true;
  else
    return false;
 }

function validateNumber(x){
  	var ed=x.value;
 var pattern = /^([0-9]{1,7})$/;
 if(pattern.test(ed)) 
  return true;
  else
    return false;
 }
function chekNum(x){
	var val=x.value;
	if(isNaN(val)==true){
		alert("Please Enter numbers only");
		x.value="";
//		x.focus();
		return false;
	}
	else
		return true;

}
function validateEmail(x){
  	var ed=x.value;
 var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
 if(pattern.test(ed)) 
  return true;
  else
    return false;
 }
// Checking wether starting date is lessthan ending date or not
function validatePeriod(x,y){
  var sd=x.value;
  sd=document.calform .Start.value;
  var dd=sd.substr(0,2);
  var mm=sd.substr(5,2);
  
  var yy=sd.substr(8,4);
  var sdobj = new Date(dd,mm,yy);

  var ed=y.value;
ed=document.calform .Start.value;
  var dd=ed.substr(0,2);
  var mm=ed.substr(5,2);
  var yy=ed.substr(8,4);
  
  var edobj = new Date(dd,mm,yy);
  
  if(sdobj<edobj) 
    return true;
  else{
	/*alert("please select valid dates");*/
    return true;
	}
 }
//Validating date format (yyyy/mm/dd)
function validateDate(x,y,z){
  	var yyyy=z.value;
	var mm=y.value;
	var dd=x.value;
	var ed=dd+"/"+mm+"/"+yyy;

 var pattern = /^[0-9]{2}-[0-9]{2}-[0-9]{4}$/;
 if(!pattern.test(ed)) 
  alert("Invalid Format");
  }

    /* this function shows the pop-up when
     user moves the mouse over the link */
    function ShowToolTip(DivID)
    {
        /* get the mouse left position */
        x = event.clientX + document.body.scrollLeft;
        /* get the mouse top position  */
        y = event.clientY + document.body.scrollTop + 35;
        /* display the pop-up */
        DivID.style.display="block";
        /* set the pop-up's left */
        DivID.style.left = x;
        /* set the pop-up's top */
        DivID.style.top = y;
    }
    /* this function hides the pop-up when
     user moves the mouse out of the link */
    function HideToolTip(DivID)
    {
        /* hide the pop-up */
        DivID.style.display="none";
    }
	function fnEmpPopUp(URL,h,w)
	{ 
		var strTitle ='Details';
		var strUrl = URL;
		var strOptions= 'menubar=no,toolbar=no,scrollbars=Yes,status=yes,resizable=yes,height='+h+',width='+w+',left=300,top=0';
		window.open(strUrl,strTitle,strOptions).focus();
	}
