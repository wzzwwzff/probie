<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    String fileName = (String)request.getParameter("fileName");
    String filePath= (String)request.getParameter("filePath");

    response.setContentType("application/x-download");
    response.setHeader ("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(fileName,"utf-8"));
    ServletOutputStream stream = response.getOutputStream ();
    BufferedInputStream in =null ;
    filePath = request.getRealPath("")+filePath;
    try{
        in = new BufferedInputStream (new FileInputStream(filePath) );
        int length;
        while((length = in.read())!=-1)   {
            stream.write(length);
        }
    }catch(Exception e){
        System.out.println(e.toString());
        //response.sendRedirect("www.baidu.com");
        //response.sendRedirect("/common/404.jsp");
    }finally{
        if(in!=null){
            in.close();
        }
        stream.close();
    }
    out.clear();
    out = pageContext.pushBody();
    response.setStatus(response.SC_OK );
    response.flushBuffer();
%>
