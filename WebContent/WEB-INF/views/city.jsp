<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MySQL DB 查詢範例</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 900px;
        margin: 30px auto;
        background: #ffffff;
        padding: 20px 25px;
        border-radius: 10px;
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    form {
        margin-bottom: 20px;
    }

    label {
        font-size: 16px;
        font-weight: bold;
        display: block;
        margin-bottom: 8px;
        color: #555555;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        font-size: 14px;
        background-color: #fafafa;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        display: block;
        width: 100%;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th, td {
        border: 1px solid #dddddd;
    }

    th {
        background-color: #f2f2f2;
        text-align: left;
        padding: 10px;
        color: #333333;
    }

    td {
        padding: 10px;
        color: #555555;
        text-align: left;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .error-message {
        color: #d9534f;
        font-weight: bold;
        text-align: center;
        margin-bottom: 15px;
    }
</style>
<script type="text/javascript">
    let errMsg = '${errMsg}';
    if (errMsg != '') {
        alert(errMsg);
    }
</script>
</head>
<body>
    <div class="container">
        <h1>MySQL DB 查詢範例</h1>
        <c:if test="${not empty errMsg}">
            <div class="error-message">${errMsg}</div>
        </c:if>
        <form action="doQueryCity" method="post">
            <label for="countryCode">Country Code <span style="color: red">*</span></label>
            <input type="text" id="countryCode" name="countryCode" value="${countryCode}" placeholder="輸入國家代碼">
            
            <label for="district">District</label>
            <input type="text" id="district" name="district" value="${district}" placeholder="輸入地區名稱">
            
            <input type="submit" value="查詢">
        </form>
        <hr />
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Country Code</th>
                    <th>District</th>
                    <th>Population</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty cityRst}">
                    <c:forEach items="${cityRst}" var="item" varStatus="status">
                        <tr>
                            <td>${item.ID}</td>
                            <td>${item.Name}</td>
                            <td>${item.CountryCode}</td>
                            <td>${item.District}</td>
                            <td>${item.Population}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
