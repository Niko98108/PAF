<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@page import="com.Item"%>
<%
if (request.getParameter("itemCode") != null)
 {
 Item itemObj = new Item();
 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 request.getParameter("itemName"),
 request.getParameter("itemPrice"),
 request.getParameter("itemDesc"));
 session.setAttribute("statusMsg", stsMsg);
 }

if (request.getParameter("btnRemove") !=null)
{
	Item itemObj = new Item();
	 String stsMsg1 = itemObj.removeItem(request.getParameter("itemID"));
	 session.setAttribute("statusMsg", stsMsg1);
}


if(request.getParameter("btnUpdate") !=null){
	Item itemObj = new Item();
	 String stsMsg3 = itemObj.updateItem(request.getParameter("itemCode"),request.getParameter("itemName"),request.getParameter("itemPrice"),request.getParameter("itemDesc"),request.getParameter("itemID"));
	 session.setAttribute("statusMsg", stsMsg3);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<link href="css/Bootstrap.css" rel="stylesheet" type="text/css">
<body>
<h1 >Items Management</h1>
<div class="container">
<form method="post" action="items.jsp">
	 <div class="mb-1 col-6">
   		 <label for="itemCode" class="form-label">Item Code</label>
    	<input type="text"name="itemCode"  class="form-control" id="itemcode">
    </div>
    <div class="mb-1 col-6">
   		 <label for="itemCode" class="form-label">Item Name</label>
    	<input type="text"name="itemName"  class="form-control" id="itemname">
    </div>
    <div class="mb-1 col-6">
   		 <label for="itemCode" class="form-label">Item Price</label>
    	<input type="text"name="itemPrice"  class="form-control" id="itemcode" placeholder="ooo.oo/-">
    </div>
    <div class="mb-4 col-6">
   		 <label for="itemCode" class="form-label">Item Description</label>
    	<input type="text"name="itemDesc"  class="form-control" id="itemdescription">
    </div>

 <input name="btnSubmit" class="btn btn-primary mb-3" type="submit" value="Save">
 
</form>
<br>
<div class="alert alert-primary" role="alert">
	<%
 		out.print(session.getAttribute("statusMsg"));
	%>
</div>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>
</div>
</body>
</html>

