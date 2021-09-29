package lt.pigustralas.breakdown.service;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.model.OrderStatus;
import lt.pigustralas.breakdown.model.User;
import lt.pigustralas.breakdown.repository.OrderRepository;
import lt.pigustralas.breakdown.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;

import static lt.pigustralas.breakdown.util.validation.ValidationUtil.*;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    public OrderService(OrderRepository orderRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
    }

    public Order get(int id) {
        return checkNotFoundWithId(orderRepository.get(id), id);
    }

    public void delete(int id) {
        checkNotFoundWithId(orderRepository.delete(id), id);
    }

    public List<Order> getAll() {
        return orderRepository.getAll();
    }

    public void update(Order order) {
        Assert.notNull(order, "meal must not be null");
        checkNotFoundWithId(orderRepository.save(order), order.id());
    }

    public Order create(Order order) {
        Assert.notNull(order, "meal must not be null");
        return orderRepository.save(order);
    }

    @Transactional
    public void enable(int id, boolean enabled) {
        Order order = get(id);
        order.setActive(enabled);
        orderRepository.save(order);  // !! need only for JDBC implementation
    }

    @Transactional
    public void accept(int orderId, int userId) {
        User user = userRepository.get(userId);
        Order order = get(orderId);
        assuredOrderStatusOnAccept(user, order);
        order.setStatus(OrderStatus.IN_PROGRESS);
        user.setOrder(order);
        orderRepository.save(order);
    }

    @Transactional
    public void complete(int orderId, int userId) {
        User user = userRepository.get(userId);
        Order order = get(orderId);
        assuredOrderStatusOnComplete(user, order);
        order.setStatus(OrderStatus.COMPLETED);
        user.setOrder(null);
        orderRepository.save(order);
    }
}
