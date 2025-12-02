<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Profile — Mini Zira</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- External CSS (adjust path if needed) -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/profile.css" />
</head>
<body>
<div class="app-shell">

    <!-- decorative animated background layers -->
    <div class="bg-gradient"></div>
    <div class="bg-gloss"></div>
    <div class="bg-particles" aria-hidden="true"></div>

    <!-- Sidebar (B architecture) -->
    <aside class="sidebar" role="navigation" aria-label="Main sidebar">
        <div class="brand">
            <div class="logo">MZ</div>
            <div class="brand-text">Mini-Zira</div>
        </div>

        <nav class="nav">
            <a href="<%= request.getContextPath() %>/app/dashboard" class="nav-item">Dashboard</a>
            <a href="<%= request.getContextPath() %>/app/profile" class="nav-item active">Profile</a>
            <a href="<%= request.getContextPath() %>/app/tickets" class="nav-item">Tickets</a>
            <a href="<%= request.getContextPath() %>/auth/logout" class="nav-item">Logout</a>
        </nav>

        <div class="sidebar-footer">
            <small>Mini-Zira • v1</small>
        </div>
    </aside>

    <!-- Main content area -->
    <main class="main">
        <!-- Wide premium glassmorphic profile card (C style) -->
        <section class="profile-wide" role="region" aria-label="User profile">
            <div class="profile-left">
                <div class="avatar-ring">
                    <%
                        // compute initials safely
                        String fullName = (String) request.getAttribute("fullName");
                        String initials = "U";
                        if (fullName != null && fullName.trim().length() > 0) {
                            String[] p = fullName.trim().split("\\s+");
                            if (p.length > 0 && p[0].length() > 0) initials = p[0].substring(0,1).toUpperCase();
                        }
                    %>
                    <div class="avatar">
                        <span class="initials"><%= initials %></span>
                    </div>
                    <div class="glow"></div>
                </div>

                <div class="user-meta">
                    <h1 class="fullname">
                        <%= (request.getAttribute("fullName") != null)
                                ? (String) request.getAttribute("fullName")
                                : "Unknown User" %>
                    </h1>
                    <div class="role-badge">
                        <%= (request.getAttribute("role") != null)
                                ? (String) request.getAttribute("role")
                                : "Member" %>
                    </div>
                </div>
            </div>

            <div class="profile-right">
                <div class="fields-grid">
                    <div class="field">
                        <label>Username</label>
                        <div class="value">
                            <%= (request.getAttribute("username") != null)
                                    ? (String) request.getAttribute("username")
                                    : "-" %>
                        </div>
                    </div>

                    <div class="field">
                        <label>Email</label>
                        <div class="value">
                            <%= (request.getAttribute("email") != null)
                                    ? (String) request.getAttribute("email")
                                    : "-" %>
                        </div>
                    </div>
                </div>

                <div class="actions">
                    <a class="btn primary" href="<%= request.getContextPath() %>/account/edit">Edit Profile</a>
                    <a class="btn ghost" href="<%= request.getContextPath() %>/app/dashboard">Back</a>
                </div>
            </div>

            <!-- subtle shimmer stripe -->
            <div class="shimmer-strip" aria-hidden="true"></div>
        </section>

        <!-- Placeholder right column for dashboard widgets (optional) -->
        <section class="widgets">
            <div class="widget">
                <h3>Recent activity</h3>
                <p class="muted">No recent activity to show.</p>
            </div>
            <div class="widget small">
                <h4>Account</h4>
                <p class="muted">Plan • Free</p>
            </div>
        </section>
    </main>
</div>

<!-- small script to adjust long names -->
<script>
    (function () {
        var el = document.querySelector('.fullname');
        if (!el) return;
        if (el.textContent.trim().length > 28) el.style.fontSize = '1.3rem';
    })();
</script>
</body>
</html>
