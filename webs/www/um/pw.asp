<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<link rel="stylesheet" href="../css/button.css" type="text/css"/>
<script src="../js/unav.js" type="text/javascript"></script>
<script src="../js/user.js" type="text/javascript"></script>
<title>修改密码</title>
<style type="text/css">
<!--
body {
 background-color: #C0C0C0;
}
.c td{padding:5px;}
-->
</style>
<script type="text/javascript">
	<%Privilege();%>

function check(flag){
 if (flag==1)
   document.pwForm.ok.value="OK";
 pwForm.submit();
}
</script>
</head>

<body>
<ul id="nav">
	<script type="text/javascript">
	showUserNav(privilege,null);
 </script>
  <li><span>用户管理=></span></li>
  <!--<li><a href="ugroup.asp">用户组</a></li>-->
  <li><a href="user.asp">用户列表 </a></li>
  <li><a href="adduser.asp">添加用户</a></li>
  <li><a href="pw.htm" class="current">修改密码</a></li>
  <li><a href="limit.asp">访问权限</a></li>
  <li><a href="savecfg.asp">保存</a></li>
  <li><a href="../help/user.htm" target="new">帮助</a></li>
</ul>
<div id="content">
      <form name="pwForm" action=/goform/ModPass method="POST">
	<table  border="1" align="center" cellPadding="0" cellSpacing="0" class="dt">
      <tr>
        <td>用户名</td>
        <td >
        <input type=text name=user maxlength=15 size=14 value="">
        </td>
      </tr>
      <tr>
        <td>旧密码</td>
        <td >
        <input type="hidden" value="2" name=enabled />
        <input input type=password name=oldpass maxlength=15 size="15" value=""/>
        </td>
      </tr>
      <tr>
        <td>新密码</td>
        <td>
        <input input type=password name=password maxlength=15 size="15" value=""/>
        </td>
      </tr>
      <tr>
        <td>确认密码</td>
        <td>
        <input type=password name=passconf size=15 value=""/>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        <input type="hidden" name="ok" value="c">
        <input class="button white medium bw" type=button value="提交" onClick="return check(1);">
        <input class="button white medium bw" type=button value="取消" onClick="return check(2);"></td>
        </td>
      </tr>
    </table>
</form>
</div>
</body>
</html>
