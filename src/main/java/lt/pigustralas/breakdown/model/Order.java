package lt.pigustralas.breakdown.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Table(name = "orders")
@Entity
public class Order extends AbstractBaseEntity{

    @Column(name = "point_a", nullable = false)
    @NotBlank
    private String pointA;

    @Column(name = "point_b", nullable = false)
    @NotBlank
    private String pointB;

    @Column(name = "price")
    @NotBlank
    private int price;

    @Column(name = "phone_number", nullable = false)
    @NotBlank
    private String phoneNumber;

    @Column(name = "registered", nullable = false, columnDefinition = "timestamp default now()")
    @NotNull
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Date registered = new Date();

    @Column(name = "active", nullable = false, columnDefinition = "bool default true")
    private boolean active = true;

    @OneToOne(mappedBy = "order")
    private User user;

    public Order() {
    }

    public Order(Integer id, String pointA, String pointB, String phoneNumber, int price) {
        super(id);
        this.pointA = pointA;
        this.pointB = pointB;
        this.phoneNumber = phoneNumber;
        this.price = price;
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

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
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
                ", active=" + active +
                ", user=" + user +
                '}';
    }
}
