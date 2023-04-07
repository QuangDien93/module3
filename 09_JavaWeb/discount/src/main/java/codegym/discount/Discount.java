package codegym.discount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Discount", value = "/display-discount")
public class Discount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String product = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));
    int percent = Integer.parseInt(request.getParameter("percent"));
    double discountAmount = price*percent*0.01;
    double discountPrice = price-discountAmount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product Description :"+ product+ "</h1>");
        writer.println("<h1>List Price :"+ price+ "</h1>");
        writer.println("<h1>Discount Percent :"+ percent+ "</h1>");
        writer.println("<h1>Discount Amount:"+ discountAmount+ "</h1>");
        writer.println("<h1>Discount Price:"+ discountPrice+ "</h1>");
        writer.println("</html>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
