<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/frontpage.css">
<title>Select_paintings</title>
</head>
<!-- <h1>Online Art Gallery</h1> -->
<body>
<h2>Online Art Gallery</h2>

 <div class="navbar">
  <a href="frontpage.jsp">Home</a>
  <a href="About_us.jsp">About Us</a>
   <a href="My_profile.jsp">My Profile</a>
   <a href="Exhibition.jsp">Exhibitions</a>
    <a href="gallery_option.jsp">Gallery options</a>
     <a href="upload_paintings.jsp">Upload Paintings</a>
      <a href="frontpage.jsp">Logout</a>
      <a href="#" class="navbar1">
      									<% HttpSession httpSession=request.getSession();
      								out.println("hii "+httpSession.getAttribute("login1"));
      								String a1 = (String)session.getAttribute("login1");
      								%>
 </a>  
      </div>
        <!-- <form method="post" action="upload_paintings.jsp" >  -->  
      <div class="user">
    <header class="user__header">
        <h2 class="user__title">Upload Painting Info...</h2>
    </header>
    
    <form action="upload_paintings.jsp" method="post" class="form" >
              <div class="form__group">
            <input type="text" placeholder="Title" name="title" required = "required" class="form__input" />
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Year" name="year" required = "required" pattern="[0-9]{4}" class="form__input" title="enter valid year"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="ImageUrl" name="url"required = "required" class="form__input" />
        </div>
        
        <div class="form__group">
<!--             <input type="text" placeholder="ImageUrl" name="url" class="form__input" />
 -->         <select name="ptype" class="form__input" placeholder="ImageUrl" required = "required" >
      		<option value=" ">Please select</option> 
      		<option>Abstract</option>
     		<option>Oil painting</option>
      		<option >Watercolour</option>
      		<option >Postercolour</option>
      		<option >Acrylic</option>
       		<option >Pencil sketch</option>
      
    </select>
        </div>
        
        <button class="btn" type="submit" name="Upload">Upload</button>
    
</div>
<% Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
    String dbName="art_gallery";
    String driver="com.mysql.jdbc.Driver";
//String dbUserName="root";
//String dbPassword="root";

try{  Class.forName(driver).newInstance(); 
System.out.println("hhhhhhhhh");
//System.out.println(id);
conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
if(request.getParameter("Upload")!= null){

  String title = request.getParameter("title");  
  String year = request.getParameter("year");  
  String iurl = request.getParameter("url");  
  String type= request.getParameter("ptype");  
  String email= (String)session.getAttribute("login1");
  String id = "abc";
  
  /* if (title==null)
      title="";
  if (year==null)
      year="";
  if (url==null)
      url="" */; 
  /* if (year==null)
      year=""; */
  Class.forName(driver).newInstance(); 
  
   
  conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
  PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into painting values(?,?,?,?,?,?)");//try2 is the name of the table  
 
  
  pst.setString(1,title);  
  pst.setString(2, id);
  pst.setString(3,year);        
  pst.setString(4,iurl);
  pst.setString(5,type);
  pst.setString(6,email);
   
  int i = pst.executeUpdate();
  //conn.commit(); 
  String msg=" ";
  if(i!=0){  
    msg="Record has been inserted";
   out.println("<font size='6' color=blue>" + msg + "</font>"); 
    RequestDispatcher rd=request.getRequestDispatcher("Artist1.jsp");  
    rd.forward(request,response);  


  }  
  else{  
    msg="failed to insert the data";
     out.println("<font size='6' color=blue>" + msg + "</font>"); 
   }  
  pst.close();
  conn.commit();
}  
}
catch (Exception e){  
  out.println(e);  
}  

%>" </form>

<style>
$font-family:   "Roboto";
$font-size:     14px;

$color-primary: #ABA194;

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: $font-family;
    font-size: $font-size;
    background-size: 200% 100% !important;
    animation: move 10s ease infinite;
    transform: translate3d(0, 0, 0);
    background: linear-gradient(45deg, #49D49D 10%, #A2C7E5 90%);
    height: 100vh
}

.user {
    width: 90%;
    max-width: 340px;
    margin: 10vh auto;
}

.user__header {
    text-align: center;
    opacity: 0;
    transform: translate3d(0, 500px, 0);
    animation: arrive 500ms ease-in-out 0.7s forwards;
}

.user__title {
    font-size: $font-size;
    margin-bottom: -10px;
    font-weight: 500;
    color: white;
}

.form {
    margin-top: 40px;
    border-radius: 6px;
    overflow: hidden;
    opacity: 0;
    transform: translate3d(0, 500px, 0);
    animation: arrive 500ms ease-in-out 0.9s forwards;
}

.form--no {
    animation: NO 1s ease-in-out;
    opacity: 1;
    transform: translate3d(0, 0, 0);
}

.form__input {
    display: block;
    width: 100%;
    padding: 20px;
    font-family: $font-family;
    -webkit-appearance: none;
    border: 0;
    outline: 0;
    transition: 0.3s;
    
    &:focus {
        background: darken(#fff, 3%);
    }
}



.btn {
    display: block;
    width: 100%;
    padding: 20px;
    font-family: $font-family;
    -webkit-appearance: none;
    outline: 0;
    border: 0;
    color: black;
    background: $color-primary;
    transition: 0.3s;
    
    &:hover {
        background: darken($color-primary, 5%);
    }
}

@keyframes NO {
  from, to {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }

  10%, 30%, 50%, 70%, 90% {
    -webkit-transform: translate3d(-10px, 0, 0);
    transform: translate3d(-10px, 0, 0);
  }

  20%, 40%, 60%, 80% {
    -webkit-transform: translate3d(10px, 0, 0);
    transform: translate3d(10px, 0, 0);
  }
}

@keyframes arrive {
    0% {
        opacity: 0;
        transform: translate3d(0, 50px, 0);
    }
    
    100% {
        opacity: 1;
        transform: translate3d(0, 0, 0);
    }
}

@keyframes move {
    0% {
        background-position: 0 0
    }

    50% {
        background-position: 100% 0
    }

    100% {
        background-position: 0 0
    }
}
</style>
<script>
$('.btn').on('click', function () {
    $('.form').addClass('form--no');
});
</script>
 
     <%--  <% Connection conn=null;
      String url="jdbc:mysql://localhost:3306/";
      String dbName="art_gallery";
      String driver="com.mysql.jdbc.Driver";
  //String dbUserName="root";
  //String dbPassword="root";

  try{  
    String title = request.getParameter("title");  
    String year = request.getParameter("year");  
    String iurl = request.getParameter("url");  
    String type= request.getParameter("ptype");  
    String id= (String)session.getAttribute("login");
    
    
    /* if (title==null)
        title="";
    if (year==null)
        year="";
    if (url==null)
        url="" */; 
    /* if (year==null)
        year=""; */
    Class.forName(driver).newInstance(); 
     System.out.println("hhhhhhhhh");
     System.out.println(id);
     
    conn = DriverManager.getConnection(url+dbName,"root", "rutuja8079");
    PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into painting values(?,?,?,?,?)");//try2 is the name of the table  
   
    
    pst.setString(1,title);  
    pst.setString(2, id);
    pst.setString(3,year);        
    pst.setString(4,iurl);
    pst.setString(5,type);
    System.out.println("qqqqqqq");
     
    int i = pst.executeUpdate();
    System.out.println("ppppppp");
    //conn.commit(); 
    String msg=" ";
    if(i!=0){  
      msg="Record has been inserted";
     out.println("<font size='6' color=blue>" + msg + "</font>"); 
      RequestDispatcher rd=request.getRequestDispatcher("thankyou.jsp");  
      rd.forward(request,response);  


    }  
    else{  
      msg="failed to insert the data";
       out.println("<font size='6' color=blue>" + msg + "</font>"); 
     }  
    pst.close();
  }  
  catch (Exception e){  
    out.println(e);  
  }  
 %> --%>
</form>
</body>
</html>