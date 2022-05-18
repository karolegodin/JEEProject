<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Login</title>
           <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
   </head>
   <body>

     <div class="login-page">
  <div class="form">
  <form class="login-form" action="${pageContext.request.contextPath}/login" method="POST">
     
   
      <input type="text" placeholder="username" name="userName" value= "${user.userName}" />
      <input type="password" placeholder="password" name="password" value= "${user.password}"/>
      <button>login</button> 
      <%
		String message=(String)session.getAttribute("login_message");
		
		if(message!=null){
			out.println(message);
			session.removeAttribute("login_message");
		}
		
		
		%>
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="login_form_js/index.js"></script>

     

   </body>
</html>