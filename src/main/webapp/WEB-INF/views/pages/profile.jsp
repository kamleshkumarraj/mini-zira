<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<body>

<h1 class="fullname">
    <%= (request.getAttribute("fullName") != null)
            ? (String) request.getAttribute("fullName")
            : "Unknown User" %>
</h1>

<p class="role">
    <%= (request.getAttribute("role") != null)
            ? (String) request.getAttribute("role")
            : "Member" %>
</p>

</div>
</div>

<dl class="profile-details">

    <div class="detail">
        <dt>Username</dt>
        <dd>
            <%= (request.getAttribute("username") != null)
                    ? (String) request.getAttribute("username")
                    : "-" %>
        </dd>
    </div>

    <div class="detail">
        <dt>Email</dt>
        <dd>
            <%= (request.getAttribute("email") != null)
                    ? (String) request.getAttribute("email")
                    : "-" %>
        </dd>
    </div>

    <!-- Only show 4 fields (fullName, email, username, role) as requested -->

</dl>

<div class="profile-actions">
    <a class="btn-edit"
       href="${pageContext.request.contextPath}/account/edit">
        Edit Profile
    </a>
</div>

</section>
</main>
</div>

<!-- small inline script to improve contrast on very long names (optional) -->
<script>
    (function () {
        var nameEl = document.querySelector('.fullname');
        if (!nameEl) return;

        if (nameEl.textContent.length > 28) {
            nameEl.style.fontSize = '1.25rem';
        }
    })();
</script>

</body>
</html>
