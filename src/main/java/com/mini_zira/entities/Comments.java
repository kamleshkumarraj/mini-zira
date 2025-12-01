package com.mini_zira.entities;

import com.mini_zira.entities.Tickets;
import com.mini_zira.entities.Users;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "comments")
public class Comments {

    // =============================
    // PRIMARY KEY
    // =============================
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "_id")
    private Long id;

    // =============================
    // TICKET RELATION (ON DELETE CASCADE)
    // =============================
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
            name = "ticket_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "fk_comment_ticket")
    )
    private Tickets ticket;

    // =============================
    // USER RELATION (ON DELETE SET NULL)
    // =============================
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
            name = "user_id",
            foreignKey = @ForeignKey(name = "fk_comment_user")
    )
    private Users user;

    // =============================
    // MESSAGE
    // =============================
    @Column(columnDefinition = "TEXT", nullable = false)
    private String message;

    // Optional status update (DONE, IN_PROGRESS, HOLD, etc.)
    @Column(name = "status_change")
    private String statusChange;

    // =============================
    // TIMESTAMP
    // =============================
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    // AUTO-SET TIMESTAMP BEFORE INSERT
    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    // =============================
    // GETTERS & SETTERS
    // =============================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tickets getTicket() {
        return ticket;
    }

    public void setTicket(Tickets ticket) {
        this.ticket = ticket;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatusChange() {
        return statusChange;
    }

    public void setStatusChange(String statusChange) {
        this.statusChange = statusChange;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    // createdAt has no setter — handled by @PrePersist
}
