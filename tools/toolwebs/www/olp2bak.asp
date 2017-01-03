<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <title>OLP 基本信息</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <script src="js/checknum.js" type="text/javascript"></script>
    <script src="js/checkfloat.js" type="text/javascript"></script>
   <script src="js/opt.js" type="text/javascript"></script>
   <script src="js/msg.js" type="text/javascript"></script>
   
   <link rel="stylesheet" href="css/grids-min.css" />
   <link rel="stylesheet" href="css/cview.css" type="text/css"/>
   <link rel="stylesheet" href="css/style.css" type="text/css" />
   <link rel="stylesheet" href="css/button.css" type="text/css"/>
</head>
<script language="javascript">
function toUrl(p)   
{ 
  location.href="/unit?cid=0&uid=" +olpForm.uid.value +"&page=" +p;   
} 
function checkmode() {  
 if(document.getElementById('mode').checked==true){
    document.getElementById("L1").disabled=true;
    document.getElementById("L2").disabled=true;
  }
  else{
    document.getElementById('L1').disabled=false;  
    document.getElementById('L2').disabled=false; 
  }
}
function check(disabled) {  
 if(document.getElementById('ret').checked==true) 
  {
     document.getElementById('rettime').style.visibility="visible";
  }
  else{
      document.getElementById('rettime').style.visibility="hidden";     
    }
}

function valid(obj,i){
var msg="",minv=0,maxv=100;
msg=document.getElementById("T"+i).innerText;
if (i>8 && i<12)
{
  minv=-50;
  maxv=20;
}
else if (i==5)
{
  minv=0;
  maxv=999;
}
return checkNumber(obj,minv,maxv,msg);
}
function checkPower(obj,i)
{
  var t;
  if (9==i)
     t="L1切换功率";
  else if (10==i)
     t="L2切换功率";
  else if (11==i)
     t="Tx告警功率";
  else
       return false;
  return checkFloatRange(obj,-50, 10,t);
}
function checkAll()
{
  var n;
  var ret;
  for (n=9;n<12;n++)
   {
    if (true!=checkFloatRange(document.getElementById("T"+n),n))
        return false;
   }
   return true; 
}
function app(act)
{
  var ret;
  
  if (1==act)
  {
    if (true!=checkAll())
       return false;
    ret=opt_ack(1,"OLP 信号");
  }
  else if (2==act)
    ret=opt_ack(0,"恢复缺省设置");
  else
       return false;
  if (false!=ret)
  {
   showWait("ibox",true,"");
   document.body.style.cursor="wait";
   if (2==act)
    {
      //alert("/goform/olp?act=2&cid=0&uid=" +olpForm.uid.value);
       window.location.href="/goform/olp?act=2&cid=0&uid=" +olpForm.uid.value;
      return true;
    }
  }
  return ret;
}

window.onload=function(){
 showWait("ibox",false,"");
 checkmode();
 check();
}
</script>
<body class="yui-skin-sam"  style="margin:0;padding:0;">
<div id="doc3" class="yui-t1">
   <div id="hd" role="banner">
    <ul id="nav">
    <li><span>OLP=></span></li>
    <li><a href="#" id="base" name="navitem" onclick="javascript:toUrl('olpbi');">基本信息</a></li>
    <li><a href="#" id="olp" name="navitem" class="current" onclick="javascript:toUrl('olp');">OLP 信息</a></li>
    <li><a href="../help/olp.htm" target="new">帮助</a></li>
  </ul>
   </div>
   <div id="bd" role="main">
	<div id="yui-main">
	<div class="yui-b" >
     <div class="yui-g" style="margin-top:20px;">
     <div id="ibox"></div>
     <form name="olpForm" method="POST" action="/goform/olp" onsubmit="return app(1);">
     <input type="hidden" id="pid" name="page" value="olp">
     <input type="hidden" id="cid" name="cid" value="0"/>
     <input type="hidden" id="act" name="act" value="1"/>
     <input type="hidden" id="uid" name="uid" value="<%UnitID();%>"/>
   <table border="1" align="center" cellpadding="0" cellspacing="0" class="dt vst10">
   <thead>
   <tr>
     <th colspan="6">OLP 信号</th>
   </tr>
   </thead>
   <%UnitInfo(4,1);%>
   <tr>
     <td align="center" colspan="6">
         <input class="button gray medium" type="button" value="刷新" onclick="window.location.href('olp.asp');" name="default"/><input class="button gray medium" type="submit" value="应用" name="apply" />
      <input class="button gray medium bw" type="button" value="恢复缺省设置" onclick="app(2);" name="refresh"/>
     </td>
   </tr>
   </table>
   </form>
  </div>
</div>
	</div>
	<div class="yui-b">
	  <div class="uh"><%UnitID();%></div>
        <div class="clr"></div>
	  <%UnitView(4);%>
	  <div class="clr"></div>
	  <div class="uf"></div>
        <div class="clr"></div>
	</div>
	
	</div>
   <div id="ft" role="contentinfo"></div>
</div>
</body>
</html>

