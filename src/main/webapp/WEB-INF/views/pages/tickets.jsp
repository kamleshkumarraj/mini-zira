<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // ---------------- DUMMY DATA (replace with DB later) ----------------
    String ticketKey = "NUC-205";
    String title = "Implement feedback collector module";
    String type = "TASK";
    String priority = "HIGH";
    String status = "IN_PROGRESS";
    String assignee = "Amit Kumar";
    String reporter = "Ritika Sharma";
    String sprint = "Sprint 14 - Q4 2025";
    String createdAt = "2025-10-30 11:40";
    String updatedAt = "2025-11-05 08:22";

    String description = "We need to create a new feedback collector module ...";

    java.util.List<String[]> comments = new java.util.ArrayList<>();
    comments.add(new String[]{"AK", "Amit Kumar", "2025-11-05 09:20",
            "Completed backend API integration. Need UI testing."});
    comments.add(new String[]{"RS", "Ritika Sharma", "2025-11-05 10:11",
            "UI tests running. Approving soon."});
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= ticketKey %> — Mini Zira Ticket</title>

    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/tickets.css">
</head>

<body>

<div class="ticket-shell">

    <!-- Glass Background -->
    <div class="ticket-glass"></div>
    <div class="ticket-shine"></div>

    <!-- MAIN CONTENT -->
    <main class="ticket-main">

        <!-- HEADER BAR -->
        <header class="ticket-header">
            <div class="header-left">
                <span class="ticket-key"><%= ticketKey %></span>
                <h1 class="ticket-title"><%= title %></h1>
            </div>

            <div class="header-right">
                <button class="btn small grey">More</button>
            </div>
        </header>

        <div class="content-layout">

            <!-- LEFT SECTION: DETAILS + DESCRIPTION + COMMENTS -->
            <section class="content-left">

                <!-- STATUS & ACTIONS -->
                <div class="ticket-actions">
                    <div class="field-block">
                        <label>Status</label>
                        <select>
                            <option <%= status.equals("TO_DO")?"selected":"" %>>TO_DO</option>
                            <option <%= status.equals("IN_PROGRESS")?"selected":"" %>>IN_PROGRESS</option>
                            <option <%= status.equals("IN_REVIEW")?"selected":"" %>>IN_REVIEW</option>
                            <option <%= status.equals("DONE")?"selected":"" %>>DONE</option>
                        </select>
                    </div>

                    <div class="field-block">
                        <label>Priority</label>
                        <select>
                            <option <%= priority.equals("LOW")?"selected":"" %>>LOW</option>
                            <option <%= priority.equals("MEDIUM")?"selected":"" %>>MEDIUM</option>
                            <option <%= priority.equals("HIGH")?"selected":"" %>>HIGH</option>
                        </select>
                    </div>

                    <div class="field-block">
                        <label>Type</label>
                        <select>
                            <option <%= type.equals("TASK")?"selected":"" %>>TASK</option>
                            <option <%= type.equals("BUG")?"selected":"" %>>BUG</option>
                            <option <%= type.equals("STORY")?"selected":"" %>>STORY</option>
                        </select>
                    </div>
                </div>

                <!-- DESCRIPTION -->
                <section class="ticket-section">
                    <h2>Description</h2>
                    <div class="ticket-description">
                        <p><%= description %></p>
                    </div>
                </section>

                <!-- COMMENTS SECTION -->
                <section class="ticket-section">
                    <h2>Comments</h2>

                    <!-- Comment Input -->
                    <div class="comment-input">
                        <textarea placeholder="Add a comment..." rows="3"></textarea>
                        <button class="btn blue">Post</button>
                    </div>

                    <!-- Comments List -->
                    <div class="comments-list">
                        <%
                            for (String[] c : comments) {
                        %>
                        <div class="comment">
                            <div class="comment-avatar"><%= c[0] %></div>
                            <div class="comment-body">
                                <div class="comment-meta">
                                    <strong><%= c[1] %></strong>
                                    <span class="comment-date"><%= c[2] %></span>
                                </div>
                                <p class="comment-text"><%= c[3] %></p>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </section>

            </section>

            <!-- RIGHT SIDEBAR -->
            <aside class="content-right">

                <div class="side-box">
                    <h3>Details</h3>
                    <div class="row"><span>Assignee</span><strong><%= assignee %></strong></div>
                    <div class="row"><span>Reporter</span><strong><%= reporter %></strong></div>
                    <div class="row"><span>Sprint</span><strong><%= sprint %></strong></div>
                    <div class="row"><span>Created</span><strong><%= createdAt %></strong></div>
                    <div class="row"><span>Updated</span><strong><%= updatedAt %></strong></div>
                </div>

                <div class="side-box">
                    <h3>Actions</h3>
                    <button class="btn block grey">Move to Sprint</button>
                    <button class="btn block blue">Assign</button>
                    <button class="btn block red">Delete</button>
                </div>

            </aside>

        </div>
    </main>

</div>
</body>
</html>
