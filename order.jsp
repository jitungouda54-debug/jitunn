<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        Integer userId = (Integer) session.getAttribute("user_id");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment_method");
        String totalStr = request.getParameter("total_amount");

        if (userId != null && address != null && totalStr != null) {
            double total = Double.parseDouble(totalStr);
            
            String DB_URL  = "jdbc:postgresql://localhost:5432/lenskart_db";
            String DB_USER = "postgres";
            String DB_PASS = "jitun@321";

            Connection conn = null;
            PreparedStatement ps = null;

            try {
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                
                String sql = "INSERT INTO orders (user_id, total_amount, shipping_address, payment_method) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setDouble(2, total);
                ps.setString(3, address);
                ps.setString(4, payment);
                
                int result = ps.executeUpdate();

                if (result > 0) {
                    // Order Success UI
%>
                    <!DOCTYPE html>
                    <html>
                    <head><link rel="stylesheet" href="style.css"></head>
                    <body style="text-align:center; padding:50px;">
                        <div style="font-size: 50px;">🎉</div>
                        <h1 style="color:#006761;">Order Placed Successfully!</h1>
                        <p>Thank you, <%= session.getAttribute("user_name") %>. Your order is being processed.</p>
                        <a href="index.jsp" class="btn btn-primary" style="text-decoration:none; background:#006761; color:white; padding:10px 20px; border-radius:5px;">Back to Home</a>
                    </body>
                    </html>
<%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        }
    } else {
        response.sendRedirect("cart.jsp");
    }
%>