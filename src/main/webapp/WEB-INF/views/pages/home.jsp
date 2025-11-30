<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MiniZira – Heavy Landing</title>

    <!-- External CSS (place this file at webapp/css/home.css) -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/footer.css">

    <!-- Small inline JS required for interactions (kept minimal) -->
    <script>
        // Simple accordion toggle
        function toggleAccordion(id){
            const el = document.getElementById(id);
            if(!el) return;
            el.classList.toggle('open');
            const panel = el.querySelector('.panel');
            if(panel){
                panel.style.maxHeight = panel.style.maxHeight ? null : panel.scrollHeight + 'px';
            }
        }

        // Simple testimonial slider
        let tIndex = 0;
        function showTestimonial(i){
            const items = document.querySelectorAll('.testimonial-item');
            if(!items.length) return;
            tIndex = (i + items.length) % items.length;
            items.forEach((it, idx) => it.classList.toggle('active', idx === tIndex));
        }
        function nextTestimonial(){ showTestimonial(tIndex+1); }
        window.addEventListener('load', ()=>{ showTestimonial(0); setInterval(nextTestimonial, 6000); });

        // Simple sticky CTA show
        document.addEventListener('scroll', ()=>{
            const cta = document.querySelector('.sticky-cta');
            if(!cta) return;
            cta.classList.toggle('visible', window.scrollY > 700);
        });
    </script>
</head>
<body>

<%-- keep header include as you have it --%>
<%@include file="/WEB-INF/views/common/header.jsp"%>

<main class="page-wrap">
    <!-- HERO -->
    <section class="hero heavy-hero">
        <div class="hero-inner">
            <div class="hero-left">
                <h1>MiniZira — Lightweight, Powerful Project Management</h1>
                <p class="lead">From idea to delivery: plan, track and ship — without the overwhelm. Built for small teams and fast-moving startups who need clarity, not complexity.</p>

                <ul class="hero-features">
                    <li><strong>Kanban & Scrum:</strong> Boards, sprints and backlogs.</li>
                    <li><strong>Issue workflows:</strong> Custom statuses, transitions, and automations.</li>
                    <li><strong>Integrations:</strong> Git, Slack, Email & Attachments.</li>
                </ul>

                <div class="hero-cta">
                    <button onclick="location.href='<%= request.getContextPath()%>/register.jsp'" class="btn primary">Get Started — It's Free</button>
                    <a class="btn ghost" href="#pricing">See Pricing</a>
                </div>

                <div class="trust">
                    <div class="stat">
                        <span class="num">12k+</span>
                        <span class="label">Active Users</span>
                    </div>
                    <div class="stat">
                        <span class="num">4.8/5</span>
                        <span class="label">Avg. Satisfaction</span>
                    </div>
                    <div class="stat">
                        <span class="num">99%</span>
                        <span class="label">Uptime SLA</span>
                    </div>
                </div>
            </div>

            <div class="hero-right">
                <div class="mockup">
                    <img src="https://saasjet.com/wp-content/uploads/2024/06/Jira-data-center.png" alt="mini-zira app mockup">
                    <div class="mockup-overlay">
                        <div class="mini-card">
                            <h4>Sprint Board</h4>
                            <div class="progress"><div style="width:72%"></div></div>
                            <div class="meta">24 tasks • 3 assignees • Due in 6 days</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FEATURE DEEP DIVE -->
    <section id="features" class="features heavy">
        <div class="section-header">
            <h2>Features that scale with your team</h2>
            <p>More than checklists — MiniZira gives structure to your work without bogging your team down. Each feature is crafted to improve collaboration and reduce meeting overhead.</p>
        </div>

        <div class="features-grid">
            <article class="feature">
                <img src="https://cdn-icons-png.flaticon.com/512/3209/3209265.png" alt="projects">
                <h3>Project Templates & Roadmaps</h3>
                <p>Create reusable templates for onboarding, releases, and incident responses. Roadmaps give you long-term visibility with milestones, dependencies and owner tags.</p>
                <ul>
                    <li>Template library (onboarding, releases, audits)</li>
                    <li>Milestones & timelines</li>
                    <li>Dependency visualization</li>
                </ul>
            </article>

            <article class="feature">
                <img src="https://cdn-icons-png.flaticon.com/512/189/189253.png" alt="issues">
                <h3>Powerful Issue Tracking</h3>
                <p>Tickets with rich text, attachments, sub-tasks and custom fields — plus filtering and saved queries so you find what matters fast.</p>
                <ul>
                    <li>Custom fields & labels</li>
                    <li>Linked issues & sub-tasks</li>
                    <li>Bulk actions & quick edit</li>
                </ul>
            </article>

            <article class="feature">
                <img src="https://cdn-icons-png.flaticon.com/512/483/483361.png" alt="kanban">
                <h3>Kanban Boards & Sprints</h3>
                <p>Drag-and-drop boards, swimlanes, and sprint planning support to keep your team focused on what’s next.</p>
                <ul>
                    <li>Custom columns & workflow rules</li>
                    <li>Swimlanes and WIP limits</li>
                    <li>Sprint planning & velocity charts</li>
                </ul>
            </article>

            <article class="feature">
                <img src="https://cdn-icons-png.flaticon.com/512/1828/1828884.png" alt="collab">
                <h3>Team Collaboration & Notifications</h3>
                <p>Comments, mentions, file attachments and threaded discussions keep context intact. Fine-grained notification controls prevent noise.</p>
                <ul>
                    <li>Email digests & Slack integration</li>
                    <li>Permissions & role management</li>
                    <li>Audit logs & activity feed</li>
                </ul>
            </article>

            <article class="feature">
                <img src="https://cdn-icons-png.flaticon.com/512/1067/1067888.png" alt="automation">
                <h3>Automation & Rules</h3>
                <p>Automate repetitive tasks with simple "when-this-then-that" rules: triage, assign, escalate, or add labels automatically.</p>
                <ul>
                    <li>Rule templates (auto-assign, priority set)</li>
                    <li>Recurring tasks & reminders</li>
                    <li>Webhooks & API access</li>
                </ul>
            </article>

            <article class="feature">
                <img src="https://cdn-icons-png.flaticon.com/512/2910/2910763.png" alt="analytics">
                <h3>Reports & Analytics</h3>
                <p>Pre-built charts and custom reports — cycle time, lead time, burndown, throughput and more — exportable to CSV/PDF.</p>
                <ul>
                    <li>Custom dashboards</li>
                    <li>Export & scheduled reports</li>
                    <li>Role-based report sharing</li>
                </ul>
            </article>
        </div>
    </section>

    <!-- WORKFLOW (Detailed) -->
    <section id="workflow" class="workflow heavy">
        <div class="section-header">
            <h2>Typical team workflow — explained</h2>
            <p>Here’s a robust workflow example that teams use to go from idea to production with minimal friction.</p>
        </div>

        <div class="workflow-steps">
            <div class="step detail">
                <div class="num">1</div>
                <div class="body">
                    <h3>Discovery & Backlog</h3>
                    <p>Stakeholders create epics and high-level goals. PMs break these into milestones and add prioritized user stories to the backlog.</p>
                    <ul>
                        <li>Capture acceptance criteria & business value</li>
                        <li>Estimate via story points</li>
                        <li>Tag with components and owners</li>
                    </ul>
                </div>
            </div>

            <div class="step detail">
                <div class="num">2</div>
                <div class="body">
                    <h3>Planning & Sprint Prep</h3>
                    <p>Draft a sprint from the backlog, plan capacity, and define sprint goals. Create subtasks for the team to pick up during the sprint.</p>
                    <ul>
                        <li>Assign stories and set owners</li>
                        <li>Link tasks to PRs and CI jobs</li>
                        <li>Set target release date</li>
                    </ul>
                </div>
            </div>

            <div class="step detail">
                <div class="num">3</div>
                <div class="body">
                    <h3>Implementation</h3>
                    <p>Engineers pick tasks, update statuses on the board, and create PRs. Automations transition issues to code-review and CI stages.</p>
                    <ul>
                        <li>Branch naming conventions & PR templates</li>
                        <li>Auto-run CI and attach results to the issue</li>
                        <li>Link deployments to releases</li>
                    </ul>
                </div>
            </div>

            <div class="step detail">
                <div class="num">4</div>
                <div class="body">
                    <h3>Review & Release</h3>
                    <p>QA runs test plans, issues are triaged, and release notes are drafted. After verification, tasks are closed and shipped.</p>
                    <ul>
                        <li>Tag release candidate builds</li>
                        <li>Postmortem for incidents</li>
                        <li>Celebrate and retro</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- SCREENS / GALLERY -->
    <section id="screens" class="screens heavy">
        <div class="section-header">
            <h2>Product Screenshots & Walkthroughs</h2>
            <p>Click any screenshot to enlarge. Images are illustrative — replace with your real app screens when ready.</p>
        </div>

        <div class="screen-grid">
            <figure class="screen-item">
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/project-management-illustration-download-in-svg-png-gif-file-formats--planning-management-people-office-pack-illustrations-2189735.png" alt="project management">
                <figcaption>Project Overview & Milestones</figcaption>
            </figure>

            <figure class="screen-item">
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/kanban-methodology-illustration-download-in-svg-png-gif-file-formats--agile-board-scrum-business-pack-illustrations-3794391.png" alt="kanban board">
                <figcaption>Kanban Board & Swimlanes</figcaption>
            </figure>

            <figure class="screen-item">
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/dashboard-illustration-download-in-svg-png-gif-file-formats--chart-analytics-admin-analysis-interface-pack-business-illustrations-4975989.png" alt="analytics">
                <figcaption>Dashboard & Analytics</figcaption>
            </figure>

            <figure class="screen-item">
                <img src="https://cdn-icons-png.flaticon.com/512/888/888879.png" alt="mobile app">
                <figcaption>Mobile quick actions & notifications</figcaption>
            </figure>
        </div>
    </section>

    <!-- PRICING -->
    <section id="pricing" class="pricing heavy">
        <div class="section-header">
            <h2>Pricing</h2>
            <p>Simple pricing that grows with you. No hidden fees. Annual plans include discounts and priority support.</p>
        </div>

        <div class="pricing-grid">
            <div class="price-card">
                <div class="badge">Free</div>
                <h3>Starter</h3>
                <div class="price">$0 <span>/ month</span></div>
                <ul>
                    <li>Up to 5 users</li>
                    <li>Basic project management</li>
                    <li>Community support</li>
                </ul>
                <button class="btn outline">Start Free</button>
            </div>

            <div class="price-card popular">
                <div class="badge">Popular</div>
                <h3>Pro</h3>
                <div class="price">$9 <span>/ user / month</span></div>
                <ul>
                    <li>All Starter features</li>
                    <li>Unlimited projects & boards</li>
                    <li>Advanced reports & integrations</li>
                </ul>
                <button class="btn primary">Get Pro</button>
            </div>

            <div class="price-card">
                <div class="badge">Enterprise</div>
                <h3>Enterprise</h3>
                <div class="price">Contact</div>
                <ul>
                    <li>Self-host or dedicated cloud</li>
                    <li>SLA & 24/7 support</li>
                    <li>Custom onboarding & training</li>
                </ul>
                <button class="btn outline">Contact Sales</button>
            </div>
        </div>

        <div class="pricing-cta">
            <p>Need help choosing? <a href="#contact">Contact our sales team</a> or start a 14-day Pro trial.</p>
        </div>
    </section>

    <!-- TESTIMONIALS -->
    <section id="testimonials" class="testimonials heavy">
        <div class="section-header">
            <h2>What teams say about MiniZira</h2>
            <p>Real quotes from teams who replaced heavy tools and regained time.</p>
        </div>

        <div class="testimonials-wrap">
            <div class="testimonial-item" data-index="0">
                <blockquote>
                    "MiniZira helped our small team (6 engineers) move from chaotic tracking to structured sprints — our delivery predictability improved by 40%."
                </blockquote>
                <div class="by">— Aisha, Engineering Manager, Flowbyte</div>
            </div>

            <div class="testimonial-item" data-index="1">
                <blockquote>
                    "The automation rules saved us several hours per week on triage and assignment. The UI is clean and fast."
                </blockquote>
                <div class="by">— Raj, Product Owner, FintechNow</div>
            </div>

            <div class="testimonial-item" data-index="2">
                <blockquote>
                    "Switching to MiniZira was painless. Onboarding was quick and our stakeholders loved the roadmap view."
                </blockquote>
                <div class="by">— Meera, CTO, HealthSync</div>
            </div>

            <div class="testimonial-controls">
                <button onclick="showTestimonial(0)"></button>
                <button onclick="showTestimonial(1)"></button>
                <button onclick="showTestimonial(2)"></button>
            </div>
        </div>
    </section>

    <!-- FAQ / RESOURCES -->
    <section id="faq" class="faq heavy">
        <div class="section-header">
            <h2>Frequently asked questions</h2>
            <p>Common questions new teams ask when trying MiniZira.</p>
        </div>

        <div class="faq-grid">
            <div class="faq-item" id="q1">
                <button class="faq-q" onclick="toggleAccordion('q1')">Can I migrate data from other tools?</button>
                <div class="panel">
                    <p>Yes — CSV import for issues, users and projects is available. We also provide migration guides for common tools and a simple API to automate imports.</p>
                </div>
            </div>

            <div class="faq-item" id="q2">
                <button class="faq-q" onclick="toggleAccordion('q2')">How does permissions & roles work?</button>
                <div class="panel">
                    <p>Roles (Admin, Manager, Member, Viewer) determine access. Project-level roles allow fine-grained control and can be customized with permissions.</p>
                </div>
            </div>

            <div class="faq-item" id="q3">
                <button class="faq-q" onclick="toggleAccordion('q3')">Is there an API?</button>
                <div class="panel">
                    <p>Yes — RESTful APIs for issues, projects, users and automation. API keys can be generated per user and scoped by permission.</p>
                </div>
            </div>

            <div class="faq-item" id="q4">
                <button class="faq-q" onclick="toggleAccordion('q4')">How secure is my data?</button>
                <div class="panel">
                    <p>We use encrypted storage, TLS in transit, role-based access control, and regular security reviews. Enterprise customers can request audits and dedicated instances.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CONTACT / CTA -->
    <section id="contact" class="contact heavy">
        <div class="section-header">
            <h2>Get started with MiniZira</h2>
            <p>Questions? Want a demo? Leave your details and our team will reach out within one business day.</p>
        </div>

        <div class="contact-grid">
            <form class="contact-form" action="<%= request.getContextPath()%>/contact" method="post">
                <label>Name <input name="name" required></label>
                <label>Email <input name="email" type="email" required></label>
                <label>Company <input name="company"></label>
                <label>Message <textarea name="message" rows="4"></textarea></label>
                <div class="form-actions">
                    <button class="btn primary" type="submit">Request Demo</button>
                    <button class="btn outline" type="button" onclick="location.href='<%= request.getContextPath()%>/register.jsp'">Start Free</button>
                </div>
            </form>

            <div class="contact-info">
                <h3>Contact</h3>
                <p>Email: <a href="mailto:sales@minizira.example">sales@minizira.example</a></p>
                <p>Phone: +1 (555) 123-4567</p>

                <h4>Office</h4>
                <p>MiniZira HQ<br>123 Startup Lane, Bangalore, India</p>

                <h4>Resources</h4>
                <ul>
                    <li><a href="#">Documentation</a></li>
                    <li><a href="#">Migration Guide</a></li>
                    <li><a href="#">Status & API</a></li>
                </ul>
            </div>
        </div>
    </section>

</main>

<%-- keep footer include as you have it --%>
<%@include file="/WEB-INF/views/common/footer.jsp"%>

<!--
    CSS for this page (copy to webapp/css/home.css)
    ----------------------------------------------------------------
-->
<!--
Place the following CSS into your file: webapp/css/home.css

(START CSS)
-->


<!--
(END CSS)
-->

</body>
</html>
