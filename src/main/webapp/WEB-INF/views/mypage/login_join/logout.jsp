<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	System.out.print(session.getAttribute("email"));
    	session.invalidate();
    %>
<script>
	location.href="/app";
</script>
    