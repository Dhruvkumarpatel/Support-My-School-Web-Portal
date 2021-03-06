<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">   
    <script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script>
    <script src="js/NewsGoth_400.font.js" type="text/javascript"></script>
    <script src="js/NewsGoth_700.font.js" type="text/javascript"></script>
    <script src="js/NewsGoth_Lt_BT_italic_400.font.js" type="text/javascript"></script>
    <script src="js/Vegur_400.font.js" type="text/javascript"></script> 
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/jquery.featureCarousel.js" type="text/javascript"></script>     
    <script type="text/javascript">
      $(document).ready(function() {
        $("#carousel").featureCarousel({
			autoPlay:7000,
			trackerIndividual:false,
			trackerSummation:false,
			topPadding:50,
			smallFeatureWidth:.9,
			smallFeatureHeight:.9,
			sidePadding:0,
			smallFeatureOffset:0
		});
      });
    </script>
	<!--[if lt IE 7]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
        	<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
	<![endif]-->
    <!--[if lt IE 9]>
   		<script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	<![endif]-->
</head>
<body id="page1">
	<div class="extra">
    	<!--==============================header=================================-->
        <header>
        	<div class="row-top">
           	  <div class="main">
           	    <div class="wrapper">
                  <h1><a href="">School Portal</a></h1>
				  <div class=ls>
				<a href="school_stu.jsp">Logout </a>	
				  </div>
                   
       	          
       	        </div>
           	  </div>
            </div>
            <div class="menu-row">
            	<div class="menu-bg">
                    <div class="main">
                        <nav class="indent-left">
                            <ul class="menu wrapper">
                                <li class="active">
                                <li><a href="stu_pro_final.jsp">Home</a></li>
                                <li><a href="vision_another.jsp">Vision</a></li>
                                <li><a href="services_another.jsp">Services</a></li>
                                <li><a href="About_us_another.jsp">About Us</a></li>
                                <li><a href="contact_us_another.jsp">Contact Us</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row-bot">
           	  <div class="center-shadow"></div>
            </div>
        </header>
        
        <!--==============================content================================-->
        <section id="content"><div class="ic">More Website Templates @ TemplateMonster.com. December10, 2011!</div>
		<div class="content-bg">
            <div class="main">
                <div class="container_12">
                    <div class="wrapper">
                      <article class="grid_4">
                 
				 <img src="ves_l.jpeg" width="106" height="127"><br>
				 <br>
				<h3> Student Name</h3><br><br>
				<a href="vendor_stu.jsp">
                                 <%
                                                try{
                                                    String Driver="com.mysql.jdbc.Driver";
                                                    String db="schoolportal";
                                                     String url="jdbc:mysql://localhost:3306/";
                                                      String user="root";
                                                     String password="";
                                                     String qry="select * from main_master where identity_sc='vendor' ";       
                                                     
                                                 Class.forName(Driver).newInstance();
                                                Connection con=DriverManager.getConnection(url+db, user, password);
                                                Statement st=con.createStatement();
                                                ResultSet rs=st.executeQuery(qry);
                                                    %><%
                                                while (rs.next())    {   
                                                %>
                                                <%=rs.getString("name")%>
                                                <br><br>
                                                <%} %>
                                                        </a>
				 
                      </article>
                                                        <article class="grid_8">
							<h3><b>Vendor1 Support</b><br><br>
											</h3>
						<%
                                               String qry2="select * from school_vendor_collaboration  ";       
                                                     
                                                ResultSet rs1=st.executeQuery(qry2);
                                                    %><%
                                                while (rs1.next())    {   
                                                %>
                                                <%=rs.getString("school_name")%>
                                                <br><br>
                                                <%} %>
					</article>

                  </div>
                </div>
            </div>
            <div class="block"></div>
			</div>
        </section>
    </div>
	
	<!--==============================footer=================================-->
	<footer>
      <div class="padding">
        <div class="main">
          <div class="container_12">
            <div class="wrapper">
              <article class="grid_8">
                <h4>Contact Form:</h4>
                <form id="contact-form" method="post">
                  <fieldset>
                  <label>
                    <input name="email" value="Email" onBlur="if(this.value=='') this.value='Email'" onFocus="if(this.value =='Email' ) this.value=''" />
                  </label>
                  <label>
                    <input name="subject" value="Subject" onBlur="if(this.value=='') this.value='Subject'" onFocus="if(this.value =='Subject' ) this.value=''" />
                  </label>
                  <textarea name="textarea" onFocus="if(this.value =='Message' ) this.value=''" onBlur="if(this.value=='') this.value='Message'">Message</textarea>
                  <div class="buttons"> <a href="#" onClick="document.getElementById('contact-form').reset()">Clear</a> <a href="#" onClick="document.getElementById('contact-form').submit()">Send</a> </div>
                  </fieldset>
                </form>
              </article>
              <article class="grid_4">
                <h4 class="indent-bot">Link to Us:</h4>
                <ul class="list-services border-bot img-indent-bot">
                  <li><a href="#">Facebook</a></li>
                  <li><a class="item-1" href="#">Twitter</a></li>
                </ul>
                <!-- {%FOOTER_LINK} -->
              </article>
            </div>
          </div>
        </div>
      </div>
</footer>
	<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>

<%
}catch(Exception e){}%>