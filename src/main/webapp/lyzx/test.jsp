<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<script src="js/jquery.js"></script>
</head>
<body>
<input type="file" multiple id="file"/> //multiple(多文件上传)
<div id='dd'></div>
<script>
$(document).ready(function () {
$("#file").change(function () {
var fil = this.files;
for (var i = 0; i < fil.length; i++) {
reads(fil[i]);
}
});
});
function reads(fil){
var reader = new FileReader();
reader.readAsDataURL(fil);
reader.onload = function()
{
document.getElementById("dd").innerHTML += "<img src='"+reader.result+"' width=25px; height=25px;>";
};
}
</script>
</body>
<html>