<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="py-4 border border-lighter border-bottom-0 border-left-0 border-right-0 bg-green">
        <div class="container">
            <div class="row justify-content-between align-items-center text-center">
                <div class="col-md-3 text-md-left mb-3 mb-md-0">
                    <img src="${pageContext.request.contextPath}/img/Logo.svg" width="100" class="mb-0">
                </div>
                <div class="col-md-9 text-md-right">
                    <a href="https://itunes.apple.com/us/app/roland-garros-officiel/id1371584793?ls=1&mt=8" class="px-3">
                    	<img src="${pageContext.request.contextPath}/img/Appstore.svg" width="120" height=auto>
                    </a>
                    <a href="https://play.google.com/store/apps/details?id=com.netcosports.androlandgarros" class="px-3 middle">
                    	<img src="${pageContext.request.contextPath}/img/Playstore.svg" width="120" height=auto>
                    </a>
                    <a href="https://appgallery.huawei.com/#/app/C102782585" class="px-3">
                    	<img src="${pageContext.request.contextPath}/img/Appgalerie.svg" width="120" height=auto>
                    </a>
                </div>
            </div>
        </div>
    </div>
   <footer class="border border-green border-left-0 border-right-0 border-bottom-0 p-4 bg-green">
        <div class="container">
            <div class="row align-items-center text-center text-md-left">
                <div class="col">
                    <p class="mb-0 small">
                    	© <script>document.write(new Date().getFullYear())</script>-2023, 
                    	<a href="https://www.rolandgarros.com/fr-fr/page/cgu" target="_blank">Fédération Française de Tennis</a>  
                    	Tous droits réservés 
                    </p> 
                </div>
                <div class="d-none d-md-block">
                    <h6 class="small mb-0">
                        <a href="https://www.facebook.com/RolandGarros" class="px-2"><img alt="Facebook" src="${pageContext.request.contextPath}/img/Facebook.svg"></a>
                        <a href="https://twitter.com/rolandgarros" class="px-2"><img alt="Twitter" src="${pageContext.request.contextPath}/img/Twitter.svg"></a>
                        <a href="https://www.instagram.com/rolandgarros/" class="px-2"><img alt="Instagram" src="${pageContext.request.contextPath}/img/Instagram.svg"></a>
                        <a href="https://youtu.be/dQw4w9WgXcQ" class="px-2"><img alt="Youtube" src="http://localhost:8080/JEEProject/img/Youtube.svg"></a>
                    </h6>
                </div>
            </div>
        </div>
        
    </footer> 
</body>
</html>