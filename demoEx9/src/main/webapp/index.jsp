
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <form action="display-discount" method="post">
  <label>Product description: </label>
    <input type="text" name="description" placeholder="Enter description" required><br>
    <label>Enter price: </label>
    <input type="number" name="price" placeholder="Enter number" required><br>
    <label>Enter percent: </label>
    <input type="number" name="percent" placeholder="Enter percent" required><br>

    <input type="submit" value="Calculate Discount">
  </form>
  </body>
</html>
