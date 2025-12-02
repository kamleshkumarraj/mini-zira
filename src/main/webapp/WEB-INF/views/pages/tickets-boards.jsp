<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Board — Mini Zira</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <!-- adjust path if needed -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/tickets-boards.css"/>
</head>
<body>
<div class="board-shell">

    <!-- header -->
    <header class="board-header">
        <div class="header-left">
            <div class="breadcrumbs">Projects / <strong>Beyond Gravity</strong></div>
            <h1 class="board-title">Board</h1>
        </div>

        <div class="header-right">
            <div class="remaining">⚡ <span>4 days remaining</span></div>
            <button class="btn action">Complete sprint</button>
        </div>
    </header>

    <!-- top controls -->
    <div class="board-controls">
        <div class="search">
            <input type="search" placeholder="Search issues, e.g. NUC-205...">
        </div>
        <div class="filters">
            <div class="avatars">
                <span class="av">AK</span>
                <span class="av">RD</span>
                <span class="av">VS</span>
                <span class="av">+3</span>
            </div>
            <div class="groupby">Group By: <select><option>Choices</option></select></div>
        </div>
    </div>

    <!-- board area -->
    <main class="board-area">

        <!-- shimmering background / glass layer -->
        <div class="glass-bg"></div>
        <div class="glass-shine"></div>

        <%
            // ---------- Dummy tickets data ----------
            class Ticket {
                Long id; String key; String title; String description; String status;
                String type; String priority; String assignee; String dueDate;
                Ticket(Long id, String key, String title, String status, String type, String priority, String assignee, String dueDate){
                    this.id = id; this.key = key; this.title = title; this.status = status;
                    this.type = type; this.priority = priority; this.assignee = assignee;
                    this.dueDate = dueDate; this.priority = priority;
                }
            }

            java.util.List<Ticket> tickets = new java.util.ArrayList<>();
            tickets.add(new Ticket(1L,"NUC-205","Implement feedback collector","TO_DO","STORY","HIGH","Amit K","2025-11-10"));
            tickets.add(new Ticket(2L,"NUC-206","Bump version for new API for billing","TO_DO","BUG","MEDIUM","Ritika S","2025-11-12"));
            tickets.add(new Ticket(3L,"NUC-208","Add NPS feedback to wallboard","TO_DO","TASK","LOW","Neha P","2025-11-08"));

            tickets.add(new Ticket(4L,"NUC-213","Update T&C copy with v1.9","IN_PROGRESS","TASK","MEDIUM","Rohit V","2025-11-15"));
            tickets.add(new Ticket(5L,"NUC-215","Tech spike on new stripe integration","IN_PROGRESS","SPIKE","HIGH","Karan G","2025-11-14"));
            tickets.add(new Ticket(6L,"NUC-216","Refactor stripe verification key validator","IN_PROGRESS","TASK","LOW","Samir","2025-11-18"));

            tickets.add(new Ticket(7L,"NUC-338","Multi-dest search UI web","IN_REVIEW","TASK","MEDIUM","Anita","2025-11-09"));

            tickets.add(new Ticket(8L,"NUC-336","Quick booking for accomodations - web","DONE","TASK","MEDIUM","Rohit","2025-11-05"));
            tickets.add(new Ticket(9L,"NUC-346","Adapt web app no new payments provider","DONE","BUG","HIGH","Neha","2025-11-03"));
            tickets.add(new Ticket(10L,"NUC-343","Fluid booking on tablets","DONE","TASK","LOW","Vikram","2025-11-06"));
            tickets.add(new Ticket(11L,"NUC-354","Shopping cart purchasing error - quick fix required.","DONE","BUG","LOW","Maya","2025-11-02"));

            // helper map by status
            java.util.Map<String, java.util.List<Ticket>> byStatus = new java.util.HashMap<>();
            byStatus.put("TO_DO", new java.util.ArrayList<Ticket>());
            byStatus.put("IN_PROGRESS", new java.util.ArrayList<Ticket>());
            byStatus.put("IN_REVIEW", new java.util.ArrayList<Ticket>());
            byStatus.put("DONE", new java.util.ArrayList<Ticket>());

            for (Ticket t : tickets) {
                java.util.List<Ticket> list = byStatus.get(t.status);
                if (list != null) list.add(t);
            }
        %>

        <!-- column: TO DO -->
        <section class="col">
            <div class="col-header">TO DO <span class="col-count"><%= byStatus.get("TO_DO").size() %></span></div>
            <div class="col-body">
                <%
                    for (Ticket t : byStatus.get("TO_DO")) {
                %>
                <article class="card">
                    <div class="card-top">
                        <div class="type <%= t.type.toLowerCase() %>"><%= t.type.substring(0,1) %></div>
                        <div class="card-key"><%= t.key %></div>
                        <div class="badge priority <%= t.priority.toLowerCase() %>"><%= t.priority %></div>
                    </div>

                    <h3 class="card-title"><%= t.title %></h3>
                    <p class="card-desc"><%= t.description != null ? t.description : "" %></p>

                    <div class="card-meta">
                        <div class="meta-left">
                            <div class="avatar-sm"><%= t.assignee != null ? t.assignee.substring(0,1) : "U" %></div>
                            <div class="meta-small"><strong>Due</strong> <span><%= t.dueDate %></span></div>
                        </div>
                        <div class="meta-right">
                            <div class="dots">⋯</div>
                        </div>
                    </div>
                    <div class="card-shine"></div>
                </article>
                <%
                    }
                %>
            </div>
        </section>

        <!-- column: IN PROGRESS -->
        <section class="col">
            <div class="col-header">IN PROGRESS <span class="col-count"><%= byStatus.get("IN_PROGRESS").size() %></span></div>
            <div class="col-body">
                <%
                    for (Ticket t : byStatus.get("IN_PROGRESS")) {
                %>
                <article class="card">
                    <div class="card-top">
                        <div class="type <%= t.type.toLowerCase() %>"><%= t.type.substring(0,1) %></div>
                        <div class="card-key"><%= t.key %></div>
                        <div class="badge priority <%= t.priority.toLowerCase() %>"><%= t.priority %></div>
                    </div>

                    <h3 class="card-title"><%= t.title %></h3>
                    <p class="card-desc"><%= t.description != null ? t.description : "" %></p>

                    <div class="card-meta">
                        <div class="meta-left">
                            <div class="avatar-sm"><%= t.assignee != null ? t.assignee.substring(0,1) : "U" %></div>
                            <div class="meta-small"><strong>Due</strong> <span><%= t.dueDate %></span></div>
                        </div>
                        <div class="meta-right">
                            <div class="dots">⋯</div>
                        </div>
                    </div>
                    <div class="card-shine"></div>
                </article>
                <%
                    }
                %>
            </div>
        </section>

        <!-- column: IN REVIEW -->
        <section class="col">
            <div class="col-header">IN REVIEW <span class="col-count"><%= byStatus.get("IN_REVIEW").size() %></span></div>
            <div class="col-body">
                <%
                    for (Ticket t : byStatus.get("IN_REVIEW")) {
                %>
                <article class="card">
                    <div class="card-top">
                        <div class="type <%= t.type.toLowerCase() %>"><%= t.type.substring(0,1) %></div>
                        <div class="card-key"><%= t.key %></div>
                        <div class="badge priority <%= t.priority.toLowerCase() %>"><%= t.priority %></div>
                    </div>

                    <h3 class="card-title"><%= t.title %></h3>
                    <p class="card-desc"><%= t.description != null ? t.description : "" %></p>

                    <div class="card-meta">
                        <div class="meta-left">
                            <div class="avatar-sm"><%= t.assignee != null ? t.assignee.substring(0,1) : "U" %></div>
                            <div class="meta-small"><strong>Due</strong> <span><%= t.dueDate %></span></div>
                        </div>
                        <div class="meta-right">
                            <div class="dots">⋯</div>
                        </div>
                    </div>
                    <div class="card-shine"></div>
                </article>
                <%
                    }
                %>
            </div>
        </section>

        <!-- column: DONE -->
        <section class="col">
            <div class="col-header">DONE <span class="col-count"><%= byStatus.get("DONE").size() %></span></div>
            <div class="col-body">
                <%
                    for (Ticket t : byStatus.get("DONE")) {
                %>
                <article class="card">
                    <div class="card-top">
                        <div class="type <%= t.type.toLowerCase() %>"><%= t.type.substring(0,1) %></div>
                        <div class="card-key"><%= t.key %></div>
                        <div class="badge priority <%= t.priority.toLowerCase() %>"><%= t.priority %></div>
                    </div>

                    <h3 class="card-title"><%= t.title %></h3>
                    <p class="card-desc"><%= t.description != null ? t.description : "" %></p>

                    <div class="card-meta">
                        <div class="meta-left">
                            <div class="avatar-sm"><%= t.assignee != null ? t.assignee.substring(0,1) : "U" %></div>
                            <div class="meta-small"><strong>Due</strong> <span><%= t.dueDate %></span></div>
                        </div>
                        <div class="meta-right">
                            <div class="dots">⋯</div>
                        </div>
                    </div>
                    <div class="card-shine"></div>
                </article>
                <%
                    }
                %>
            </div>
        </section>

    </main>
</div>

<script>
    // optional: click handlers can be added here
    document.addEventListener('click', function (e) {
        if (e.target.closest('.card')) {
            // placeholder: open modal or redirect
            // window.location = '/mini-zira/app/ticket?id=' + (e.target.closest('.card').querySelector('.card-key').textContent);
        }
    });
</script>
</body>
</html>
