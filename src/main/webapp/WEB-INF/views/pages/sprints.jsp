<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sprints — Mini Zira</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/sprints.css" />
</head>
<body>

<div class="jira-shell">

    <aside class="sidebar">
        <div class="logo-box">MZ</div>
        <nav class="nav">
            <a href="<%= request.getContextPath() %>/app/dashboard">Dashboard</a>
            <a href="<%= request.getContextPath() %>/app/sprints" class="active">Sprints</a>
            <a href="<%= request.getContextPath() %>/app/tickets">Tickets</a>
            <a href="<%= request.getContextPath() %>/auth/logout">Logout</a>
        </nav>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="jira-main">

        <h1 class="page-title">Project Backlog & Sprints</h1>

        <%
            // ---------------- Dummy sprint list -------------------
            class Sprint {
                Long id; String name; String goal; String start; String end; String deadline; int issues;
                Sprint(Long id, String name, String goal, String start, String end, String deadline, int issues){
                    this.id=id; this.name=name; this.goal=goal; this.start=start; this.end=end; this.deadline=deadline; this.issues=issues;
                }
            }

            java.util.List<Sprint> active = java.util.Arrays.asList(
                    new Sprint(1L,"Sprint 14","Complete payment gateway overhaul.",
                            "2025-01-01","2025-01-14","2025-01-16",18),

                    new Sprint(2L,"Sprint 15","Prepare UI revamp for dashboard analytics.",
                            "2025-01-15","2025-01-29","2025-02-01",22)
            );

            Sprint backlog = new Sprint(999L,"Backlog","Collection of backlog tasks.",
                    "-", "-", "-", 41);
        %>

        <!-- ACTIVE SPRINTS -->
        <section class="sprint-list">

            <% for(Sprint s: active){ %>

            <div class="sprint-block">
                <div class="sprint-header">
                    <div class="left">
                        <div class="sprint-title"><%= s.name %></div>
                        <div class="sprint-dates"><%= s.start %> → <%= s.end %></div>
                    </div>

                    <div class="right">
                        <span class="count"><%= s.issues %> issues</span>
                        <a class="btn-view" href="<%= request.getContextPath() %>/app/tickets?sprint=<%= s.id %>">
                            View Sprint
                        </a>
                    </div>
                </div>

                <div class="sprint-goal">
                    <strong>Goal:</strong> <%= s.goal %>
                </div>

                <div class="sprint-body collapsed">
                    <p class="empty-msg">Sprint items will display here (collapsed preview).</p>
                </div>

                <div class="line-shine"></div>
            </div>

            <% } %>

        </section>

        <!-- BACKLOG SECTION -->
        <section class="sprint-block backlog">
            <div class="sprint-header">
                <div class="left">
                    <div class="sprint-title">Backlog</div>
                </div>

                <div class="right">
                    <span class="count"><%= backlog.issues %> issues</span>
                    <a class="btn-view" href="<%= request.getContextPath() %>/app/tickets?sprint=<%= backlog.id %>">
                        View Backlog
                    </a>
                </div>
            </div>

            <div class="sprint-goal">
                <strong>Goal:</strong> Backlog items (not scheduled).
            </div>

            <div class="sprint-body collapsed">
                <p class="empty-msg">Backlog items preview here...</p>
            </div>

            <div class="line-shine"></div>
        </section>

    </main>
</div>

</body>
</html>
