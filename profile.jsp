<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>My Profile - Lenskart Clone</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    .profile-container { max-width: 1000px; margin: 40px auto; display: flex; gap: 30px; padding: 20px; }
    .sidebar-profile { width: 250px; background: white; padding: 20px; border-radius: 8px; border: 1.5px solid #ebebeb; }
    .sidebar-profile h3 { margin-bottom: 15px; color: #111; font-size: 18px; }
    .sidebar-profile ul { list-style: none; padding: 0; }
    .sidebar-profile ul li { margin-bottom: 10px; }
    .sidebar-profile ul li a { text-decoration: none; color: #333; font-weight: 500; display: block; padding: 10px; border-radius: 6px; }
    .sidebar-profile ul li a:hover, .sidebar-profile ul li a.active { background: #e8f5f4; color: #006761; }
    
    .profile-main { flex: 1; background: white; padding: 30px; border-radius: 8px; border: 1.5px solid #ebebeb; }
    .profile-main h2 { color: #111; margin-bottom: 20px; border-bottom: 1px solid #ebebeb; padding-bottom: 10px; font-weight: 800; font-size: 20px; }
    
    .user-info { margin-bottom: 30px; }
    .user-info p { font-size: 15px; margin-bottom: 8px; color: #555; }
    
    .order-card { border: 1.5px solid #ebebeb; padding: 16px; border-radius: 8px; margin-bottom: 16px; display: flex; justify-content: space-between; align-items: center; }
    .order-details h4 { color: #111; margin-bottom: 5px; font-size: 15px; }
    .order-details p { font-size: 13px; color: #777; margin: 2px 0; }
    
    .reorder-btn { padding: 8px 16px; background: rgba(0,103,97,0.1); color: #006761; border: 1.5px solid rgba(0,103,97,0.2); border-radius: 6px; cursor: pointer; font-weight: bold; font-size: 13px; transition: all 0.2s; }
    .reorder-btn:hover { background: #006761; color: white; border-color: #006761; }
  </style>
</head>
<body data-page="profile">
  <!-- Navbar -->
  <nav class="navbar">
    <div class="navbar-inner">
      <a href="index.jsp" class="logo">
        <div class="logo-icon">👁</div>
        <span class="logo-text">Lenskart</span>
      </a>
      <div class="search-bar">
        <input type="search" id="nav-search" placeholder="Search for eyeglasses, sunglasses..." />
        <button class="search-btn" onclick="navSearch()">🔍</button>
      </div>
      <ul class="nav-links">
        <li><a href="products.jsp?cat=Eyeglasses">Eyeglasses</a></li>
        <li><a href="products.jsp?cat=Sunglasses">Sunglasses</a></li>
        <li><a href="products.jsp?cat=Contact+Lenses">Contact Lenses</a></li>
      </ul>
      <div class="nav-actions">
        <a href="profile.jsp">👤 <span><%= session.getAttribute("user_name") %></span></a>
        <a href="logout.jsp" style="font-size: 12px; color: #777;">Logout</a>
        <a href="cart.jsp" title="Cart" style="position:relative">
          🛒 <span>Cart</span>
          <span class="cart-badge" style="display:none">0</span>
        </a>
      </div>
    </div>
  </nav>
  <!-- Profile Content -->
  <div class="profile-container">
    <div class="sidebar-profile">
      <h3>My Account</h3>
      <ul>
        <li><a href="#" class="active">Profile & Orders</a></li>
        <li><a href="logout.jsp">Log Out</a></li>
      </ul>
    </div>
    
    <div class="profile-main">
      <h2>Welcome, <%= session.getAttribute("user_name") %>!</h2>
      <div class="user-info">
        <p><strong>Email:</strong> <%= session.getAttribute("user_email") %></p>
        <p><strong>Status:</strong> Active Member</p>
      </div>
      <h2>Order History</h2>
      
      <!-- Example Previous Order 1 -->
      <div class="order-card">
        <div class="order-details">
          <h4>Order #LK-9988</h4>
          <p>Product: Vincent Chase Full Frame</p>
          <p>Date: 12 Oct 2023</p>
        </div>
        <div class="order-actions" style="text-align: right;">
          <p style="font-weight: 800; margin-bottom: 8px; color: #111; font-size: 15px;">Rs. 1,499</p>
          <button class="reorder-btn" onclick="window.location='product-buy.jsp?id=1'">Reorder</button>
        </div>
      </div>
      <!-- Example Previous Order 2 -->
      <div class="order-card">
        <div class="order-details">
          <h4>Order #LK-1122</h4>
          <p>Product: Lenskart BLU Blue Light</p>
          <p>Date: 04 Mar 2024</p>
        </div>
        <div class="order-actions" style="text-align: right;">
           <p style="font-weight: 800; margin-bottom: 8px; color: #111; font-size: 15px;">Rs. 1,299</p>
          <button class="reorder-btn" onclick="window.location='product-buy.jsp?id=9'">Reorder</button>
        </div>
      </div>
      
    </div>
  </div>
  <script src="script.js"></script>
  <script>
    function navSearch() {
      const q = document.getElementById('nav-search').value.trim();
      if (q) window.location.href = 'products.jsp?q=' + encodeURIComponent(q);
    }
  </script>
</body>
</html>
