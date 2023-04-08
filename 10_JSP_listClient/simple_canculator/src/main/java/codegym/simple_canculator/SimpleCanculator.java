package codegym.simple_canculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SimpleCanculate", value = "/SimpleCanculate")
public class SimpleCanculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    double first = Double.parseDouble(request.getParameter("first-operand"));
    double second = Double.parseDouble(request.getParameter("second-operand"));
    char operate = request.getParameter("operator").charAt(0);

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Result:</h1>");
        try {
            double result = Calculator.calculate(first,second,operate);
            writer.println(first + " " + operate + " " + second + " = " + result);
        } catch (Exception e) {
            writer.println("Error"+ e.getMessage());
        }
        writer.println("</html>");
    }
}
