package com.mini_zira.entities;



import jakarta.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "sprints")
public class Sprints {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String goal;

    // 🔥 Sprint creator
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by")
    private Users createdBy;

    // 🔥 Sprint assigned to which user
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assigned_to", nullable = false)
    private Users assignedTo;

    // 🔥 Sprint dates
    @Column(name = "start_date")
    private Date startDate;
    @Column(name = "end_date")
    private Date endDate;
    @Column(name = "max_deadline")
    private Date maxDeadline;

    // 🔥 Auto timestamps managed by entity methods
    @Column(name = "created_at", updatable = false)
    private Timestamp createdAt;

    @Column(name = "updated_at")
    private Timestamp updatedAt;

    // --------------------- LIFECYCLE HOOKS ------------------------

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Timestamp(System.currentTimeMillis());
        this.updatedAt = this.createdAt;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Timestamp(System.currentTimeMillis());
    }

    // --------------------- GETTERS & SETTERS ------------------------

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title){
        this.title = title;
    }

    public String getGoal() {
        return goal;
    }
    public void setGoal(String goal){
        this.goal = goal;
    }

    public Users getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(Users createdBy) {
        this.createdBy = createdBy;
    }

    public Users getAssignedTo() {
        return assignedTo;
    }
    public void setAssignedTo(Users assignedTo) {
        this.assignedTo = assignedTo;
    }

    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate){
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate){
        this.endDate = endDate;
    }

    public Date getMaxDeadline() {
        return maxDeadline;
    }
    public void setMaxDeadline(Date maxDeadline){
        this.maxDeadline = maxDeadline;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public Timestamp getUpdatedAt() {
        return updatedAt;
    }
}

