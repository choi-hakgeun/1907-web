<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_param</title>
</head>
<body>
<h3>el param</h3>
<form name='frm' method='post'>
	<label>id</label>
	<input type='text' name='id' value='${param.id}'><br/>
	<label>name</label>
	<input type='text' name='pwd' = value='${param.pwd }'><br/>
	<label>hobby</label>
	<label><input type='checkbox' name='hobby' value='축구'>축구</label>
	<label><input type='checkbox' name='hobby' value='야구'>야구</label>
	<label><input type='checkbox' name='hobby' value='농구'>농구</label>
	<label><input type='checkbox' name='hobby' value='배구'>배구</label>
	<p/>
	<input type='submit' value='RUN' />
</form>
<p>
<script>
	frm.hobby[0].checked=${paramValues.hobby[0]=='축구'? true : false };
	frm.hobby[1].checked=${paramValues.hobby[1]=='야구'? true : false };
	frm.hobby[2].checked=${paramValues.hobby[2]=='농구'? true : false };
	frm.hobby[3].checked=${paramValues.hobby[3]=='배구'? true : false };
</script>
hobby : ${paramValues.hobby }
</p>
</body>
</html>