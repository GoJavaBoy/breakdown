package lt.pigustralas.breakdown.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Table(name = "orders")
@Entity
public class Order extends AbstractBaseEntity{

    @Column(name = "point_a", nullable = false)
    @NotBlank
    private String pointA;

    @Column(name = "point_b", nullable = true)
    private String pointB;

    @Column(name = "price")
    private int price;

    @Column(name = "phone_number", nullable = false)
    @NotBlank
    private String phoneNumber;

    @Column(name = "registered", nullable = false, columnDefinition = "timestamp default now()")
    @NotNull
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date registered = new Date();

    @OneToOne(mappedBy = "order")
    @JsonIgnore
    private User user;

    @Enumerated(EnumType.STRING)
    @Column(name = "order_status", nullable = false)
    private OrderStatus status;

    @Column(name = "comment")
    private String comment;

    @Column(name = "distance")
    private int distance;

    public Order() {
    }

    public Order(Integer id, String pointA, String pointB, String phoneNumber, int price, int distance, String comment) {
        super(id);
        this.pointA = pointA;
        this.pointB = pointB;
        this.phoneNumber = phoneNumber;
        this.price = price;
        this.distance = distance;
        this.comment = comment;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getPointA() {
        return pointA;
    }

    public void setPointA(String pointA) {
        this.pointA = pointA;
    }

    public String getPointB() {
        return pointB;
    }

    public void setPointB(String pointB) {
        this.pointB = pointB;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getRegistered() {
        return registered;
    }

    public void setRegistered(Date registered) {
        this.registered = registered;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", pointA='" + pointA + '\'' +
                ", pointB='" + pointB + '\'' +
                ", price=" + price +
                ", phoneNumber=" + phoneNumber +
                ", registered=" + registered +
                ", user=" + user +
                '}';
    }
}
