package servlet_controller;

import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.*;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

public class UploadImage extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        System.out.println("request: " + request);
        if (!isMultipart) {
            System.out.println("File Not Uploaded");
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                items = upload.parseRequest((RequestContext) request);
            } catch (FileUploadException ex) {
                Logger.getLogger(UploadImage.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("items: " + items);
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    System.out.println("name: " + name);
                    String value = item.getString();
                    System.out.println("value: " + value);
                } else {
                    try {
                        String itemName = item.getName();
                        Random generator = new Random();
                        int r = Math.abs(generator.nextInt());

                        String reg = "[.*]";
                        String replacingtext = "";
                        System.out.println("Text before replacing is:-" + itemName);
                        Pattern pattern = Pattern.compile(reg);
                        Matcher matcher = pattern.matcher(itemName);
                        StringBuffer buffer = new StringBuffer();

                        while (matcher.find()) {
                            matcher.appendReplacement(buffer, replacingtext);
                        }
                        int IndexOf = itemName.indexOf(".");
                        String domainName = itemName.substring(IndexOf);
                        System.out.println("domainName: " + domainName);

                        String finalimage = buffer.toString() + "_" + r + domainName;
                        System.out.println("Final Image===" + finalimage);

                        File savedFile = new File("E:\\Neil\\ce sem7-8 Project\\LATEST UPGRADE\\site\\ProjectSchoolPortal\\web\\ImageSavings\\ImageSavings" + finalimage);
                        item.write(savedFile);
                        out.println("<html>");
                        out.println("<body>");
                        out.println("<table><tr><td>");
                        out.println("<img src=images/" + finalimage + ">");
                        out.println("</td></tr></table>");

                        Connection conn = null;
                        String url = "jdbc:mysql://localhost:3306/";;
                        String dbName = "schoolportal";
                        String driver = "com.mysql.jdbc.Driver";
                        String username = "root";
                        String userPassword = "";
                        String strQuery = null;
                        String strQuery1 = null;
                        String imgLen = "";

                        try {
                            System.out.println("itemName::::: " + itemName);
                            Class.forName(driver).newInstance();
                            conn = DriverManager.getConnection(url + dbName, username, userPassword);
                            Statement st = conn.createStatement();
                            strQuery = "insert into for_image values(null,'" + finalimage + "')";
                            int rs = st.executeUpdate(strQuery);
                            System.out.println("Query Executed Successfully++++++++++++++");
                            out.println("image inserted successfully");
                            out.println("</body>");
                            out.println("</html>");
                            
                            HttpSession hse=request.getSession(true);
                            hse.setAttribute("fi", finalimage);
                            
                            response.sendRedirect("school_sch.jsp");
                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                        } finally {
                            conn.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
