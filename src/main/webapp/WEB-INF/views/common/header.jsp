<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String fullName = (String) request.getAttribute("fullName");
    String email = (String) request.getAttribute("email");
%>


<div class="header">
    <div class="nav-container">

        <!-- Logo -->
        <div class="logo">MiniZira</div>

        <!-- Navigation Links -->
        <div class="nav-links">
            <a href="dashboard.jsp">Dashboard</a>
            <a href="projects.jsp">Projects</a>
            <a href="tasks.jsp">Tasks</a>
            <a href="teams.jsp">Teams</a>
            <a href="issues.jsp">Issues</a>
            <a href="reports.jsp">Reports</a>
        </div>

        <!-- Right Side -->
        <div class="right">

            <% if(email == null){ %>

            <button  class="login-btn" onclick="location.href='<%= request.getContextPath() %>/auth/login'">
                Login
            </button>

            <% } else { %>

            <div class="avatar-box">
                <div style="width: 40px; height: 40px; border-radius: 50%; font-size: 28px; background: cyan; color: red; text-align: center; font-weight: bold" > <%= fullName.charAt(0)%> </div>

                <div style="top: 40px; right: -80px" class="dropdown">
                    <a href="#">👤 <%= fullName %></a>
                    <a href="profile.jsp">Profile</a>
                    <a href="settings.jsp">Settings</a>
                    <a href="logout">Logout</a>
                </div>
            </div>

            <% } %>

        </div>

    </div>
</div>
