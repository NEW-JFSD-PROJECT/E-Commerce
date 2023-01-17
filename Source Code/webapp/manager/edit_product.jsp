
<%@page import="com.entity.product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entity.category"%>
<%@page import="com.dao.CategoryDao"%>

<%@page import="java.util.List"%>
<%@page import="com.db.DBConn"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<%@include file="../componet/allcss.jsp"%>
<link rel="stylesheet" href="../componet/style.css">
<%@page isELIgnored="false"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<script type="text/javascript">
        var subcategory = {
           

        		Beauty_More:["Beauty_Personal Care", "Foods_Drinks","Toy","Musical Instruments"],
                Fashion: ["Shirt", "Pant", "T-shirts","Krutas_Kurties","Men_Dresss","Women_Dresses"],
                Electronics: ["Camera", "Gaming", "Health_Care","Lactop_Desktop","Power Bank","Storage"],
                Home: ["Furniture", "Kitchen_Dining"],
                Two_Wheelers: ["Petorl Bike", "Electric Bike"]
  
        }

        function makeSubmenu(value) {
            if (value.length == 0) document.getElementById("categorySelect").innerHTML = "<option></option>";
            else {
                var citiesOptions = "";
                for (categoryId in subcategory[value]) {
                    citiesOptions += "<option>" + subcategory[value][categoryId] + "</option>";
                }
                document.getElementById("categorySelect").innerHTML = citiesOptions;
            }
        }

        function displaySelected() {
            var country = document.getElementById("category").value;
            var city = document.getElementById("categorySelect").value;
            alert(country + "\n" + city);
        }

        function resetSelection() {
            document.getElementById("category").selectedIndex = 0;
            document.getElementById("categorySelect").selectedIndex = 0;
        }
    </script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Update Product</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ProductDao dao2 = new ProductDao(DBConn.getConn());
						product p = dao2.getProductById(id);
						%>
						<form action="../updateProduct" method="post"
							enctype="multipart/form-data">


							<div class="mb-3">
								<label class="form-label">Product Name</label> <input type="text"
									required name="pname" class="form-control"value="<%=p.getPname()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Product Category</label> <select name="pcategory"id="category"size="1" onchange="makeSubmenu(this.value)"
									required class="form-control"value="<%=p.getPcategory()%>">
									<option>--select--</option>

									<%
									CategoryDao dao = new CategoryDao(DBConn.getConn());
									List<category> list = dao.getAllCategory();
									for (category s : list) {
									%>
									<option><%=s.getCategoryname()%></option>
									<%
									}
									%>


								</select>
								<label class="form-label">Product Sub Category</label>
								 <select name="psubcategory"id="categorySelect" size="1"class="form-control"value="<%=p.getPsubcategory()%>">
								<option value="" disabled selected>Choose Subcategory</option>
									
									</select>
							</div>


							<div class="mb-3">
								<label class="form-label">Product Price</label> <input
									type="text" required name="pprice" class="form-control"
									value="<%=p.getPprice()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Product Color</label> <input
									type="text" required name="pcolor" class="form-control"
									value="<%=p.getPcolor()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Product Image</label> <input
									type="file" required name="pimage" class="form-control"
									value="<%=p.getPimage()%>">
							</div>
							
								<div class="mb-3">
								<label class="form-label">Product Descripistion</label> <input type="text"
									required name="pdecs" class="form-control">
							</div>
 
							
							<input type="hidden" name="id" value="<%=p.getPid()%>">


							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>



		</div>
	</div>
</body>
</html>