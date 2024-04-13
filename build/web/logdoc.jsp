<%-- 
    Author     : HARINI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOCUS VISION</title>
    <link rel="stylesheet" type="text/css" href="style.css">

</head>
<style>
 #dropdown {
  position: relative;
  background-color: #4F7942;
  margin-top:-10px ;
}

#dropdown-menu {
  display: none;
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #333;
  padding: 5px;
  border-radius: 5px;
}

#dropdown-menu li {
  list-style-type: none;
}

#dropdown-menu li a {
  color: white;
  text-decoration: none;
}
#username:hover{
cursor: pointer;
}
#dropdown-menu li a:hover {
  background-color: #555;
}

</style>

<body>

<header class="clinic-header">
    <h1 class="clinic-name">Focus Vision</h1>
    <nav class="clinic-nav">
        <ul>
            <li><a href="logdoc.jsp" id="doc">DOCTORS</a></li>
            <li><a><form action="ogapp" method="post">
                <input type="submit" value="Book" style="background-color: transparent; border: none; cursor: pointer; 
                       padding: 0; margin: 0; color: #154406; text-decoration: underline; font-size: 25px; font-family: 'Lucida Console', 
                       monospace;">
                </form></a></li>
            <li><a><form action="appointment" method="post">
                <input type="submit" value="appointment" style="background-color: transparent; border: none; cursor: pointer; 
                       padding: 0; margin: 0; color: #154406; text-decoration: underline; font-size: 25px; font-family: 'Lucida Console', 
                       monospace;">
                </form></a></li>
            
            <li id="dropdown">
                <ul>
                    <li>
                        <img src="progfile.png" alt="Dropdown" style="width: 25px; padding: 0;margin: 0; align:left;"></li>
                        <% String name = (String) session.getAttribute("pname"); %>
                        <p id="username" style='color:white; font-size: 25px; '><%= name %></p>
                        <ul id="dropdown-menu">
                            <li><a href="index.html">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
</header>

      <script>
    document.getElementById("dropdown").addEventListener("click", function() {
  var dropdownMenu = document.getElementById("dropdown-menu");
  dropdownMenu.style.display = (dropdownMenu.style.display === "block") ? "none" : "block";
});

document.addEventListener("click", function(event) {
  var dropdown = document.querySelector(".dropdown");
  if (!dropdown.contains(event.target)) {
    document.getElementById("dropdown-menu").style.display = "none";
  }
});


      </script>
  
  <div id="mid1">
    <h1> OUR CLINIC TEAM</h1>
<table>
    <h3>DOCTORS</h3>
    <tr>
    <th>
<div class="container-doc" onclick="navigateToAppPage('Srinivasan N')">
  <img src="male.jpg" alt="Avatar" class="image-doc" >
          <p style="font-size: 30px;">Srinivasan N</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Srinivasan N</p><br> <br> TM.B.B.S, D.O, M.S Ophthalmology, Medical Director . <br><br> 
        <p style="color: #243221;">Click To Book An Appoinmnet</p></div>
  </div></div></th>
<th>
<div class="container-doc" onclick="navigateToAppPage('Malar V')">
  <img src="f1.jpg" alt="Avatar" class="image-doc">
  <p style="font-size: 30px;">Malar V</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Malar V </p><br><br>Vitreo-Retinal Surgeon <p style="color: #243221;">Click To Book An Appoinmnet</p></div>
  </div>
</div></th>
<th> 
<div class="container-doc" onclick="navigateToAppPage('Sindhu R')">
  <img src="f1.jpg" alt="Avatar" class="image-doc">
  <p style="font-size: 30px;">Sindhu R</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Sindhu R </p><br><br>Anaesthesiologist<p style="color: #243221;">Click To Book An Appoinmnet</p></div>
  </div>
</div></th></tr>
<tr>
    <th>
<div class="container-doc" onclick="navigateToAppPage('Saravanan T')">
  <img src="male.jpg" alt="Avatar" class="image-doc">
  <p style="font-size: 30px;">Saravanan T</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Saravanan T </p><br><br> Ophthalmology<p style="color: #243221;">Click To Book An Appoinmnet</p></div>
  </div></div></th>
  <th>
<div class="container-doc" onclick="navigateToAppPage('Renuka K')">
  <img src="female.jpg" alt="Avatar" class="image-doc">
  <p style="font-size: 30px;">Renuka K</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Renuka K </p><br><br>Corneal Surgeon<p style="color: #243221;">Click To Book An Appoinmnet</p>
</div>
  </div></div>
  </th></tr>
</table>
</div>


<div id="mid1">
<table>
    <h3>OTHERS</h3>
    <tr>
       <th>
        <div class="container-doc">
                <a href="ser.html">
  <img src="female.jpg" alt="Avatar" class="image-doc"></a>
  <p style="font-size: 30px;">Amudha D</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Amudha D</p><br> <br> Ophthalmic Technician<br><br> 
  </div>
</a>
</div>
    </th> 
    <th>
        <div class="container-doc">
  <img src="male.jpg" alt="Avatar" class="image-doc">
    <p style="font-size: 30px;">Kamal Y</p>
  <div class="overlay">
    <div class="text-doc"><p style="font-size:25px; color: #476442">Kamal Y</p><br> <br>Retina Specialist<br><br> 
  </div></div>
    </th> 
    </tr>
    
    </table>
</div>

    <div id="footer">
  <div class="contact-info">
<h1>CONTACT US</h1>
<p>69, Clinic Street, chennai, moondram kattalai ,</p><br>
    <p>Kundrathur - 600069</p><br>
  </div>
  <div class="copyright">
    <p>&copy; 2024 Focus Vision. All Rights Reserved.</p>
  </div>
</div>

<script type="text/javascript">
function navigateToAppPage(doctorName) {
    window.location.href = "app.html?doctor=" + encodeURIComponent(doctorName);
}

</script>
</body>
</html>