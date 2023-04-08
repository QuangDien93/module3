package codegym.list_client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListClient", value = "/ListClient")
public class ListClient extends HttpServlet {
    private static List<Person> listClient = new ArrayList<>();
    static {
        listClient.add (new Person("Mai Văn Hoàng","1983-08-20","Ha-Noi", "hoang.PNG"));
        listClient.add (new Person("Nguyễn Văn Nam","1983-08-21","Bắc Giang", "nam.PNG"));
        listClient.add (new Person("Nguyễn Thái Hòa","1983-08-22","Nam ĐỊnh ", "hoa.PNG"));
        listClient.add (new Person("Trần Đăng Khoa","1983-08-19","Hà Tây ", "khoa.PNG"));
        listClient.add (new Person("Nguyễn Đình Thi","1983-08-19","Đà Năng ", "thi.PNG"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listClient",listClient);
        request.getRequestDispatcher("/list_client.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
