#!/bin/sh
echo "Content-type: text/html"
echo ""
echo "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><title>Bash as CGI"
echo "</title></head><body>"
echo "<h3>SNMP test result:</h3>"
echo "<div id='result'> $(snmpwalk -m ALL  -c public localhost 1.3.6.1.4.1.10215.2.1.5.88.1.4.1.5) </div>"
echo "<script language=\"javascript\">"
echo "window.onload=function(){"
echo "	var o=document.getElementById('result').innerText;"
echo "if (o.indexOf(\"Hex-STRING\")>-1)"
echo "alert('Snmp ping is OK!');"
echo "else alert('Snmp ping is fail!');"
echo "}"
echo "</script>"
echo "</body></html>"
