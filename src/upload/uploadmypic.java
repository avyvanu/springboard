package upload;


import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import java.util.*;
import java.io.*;

public class uploadmypic extends BodyTagSupport 
{
    public int doAfterBody() throws JspException {
      try {
         BodyContent bodycontent = getBodyContent();
         String body = bodycontent.getString();
         JspWriter out = bodycontent.getEnclosingWriter();
         if(body != null) {
            out.print(body.toUpperCase());
         }
      } catch(IOException ioe) {
         throw new JspException("Error:"+ioe.getMessage());
      }
      return SKIP_BODY;
  }
}