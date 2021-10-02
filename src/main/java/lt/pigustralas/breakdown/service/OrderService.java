package lt.pigustralas.breakdown.service;

import com.pusher.rest.Pusher;
import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.model.OrderStatus;
import lt.pigustralas.breakdown.model.User;
import lt.pigustralas.breakdown.repository.OrderRepository;
import lt.pigustralas.breakdown.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.Collections;
import java.util.List;

import static lt.pigustralas.breakdown.util.validation.ValidationUtil.*;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final Pusher pusher;

    public OrderService(OrderRepository orderRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        pusher = new Pusher("1275926", "6d6694b0ce7831c82174", "407d1b182e3208720120");
        pusher.setCluster("eu");
        pusher.setEncrypted(true);
    }

    public Order get(int id) {
        return checkNotFoundWithId(orderRepository.get(id), id);
    }

    public Order getCurrentOrder(int userId) {
        User user = userRepository.get(userId);
        Order order = user.getOrder();
        assuredOrderStatusInProgress(order);
        return order;
    }

    public void delete(int id) {
        pusher.trigger("my-channel", "refreshTable", Collections.singletonMap("message", "hello world"));
        checkNotFoundWithId(orderRepository.delete(id), id);
    }

    public List<Order> getAll() {
        return orderRepository.getAll();
    }

    public void update(Order order) {
        Assert.notNull(order, "meal must not be null");
        pusher.trigger("my-channel", "refreshTable", Collections.singletonMap("message", "hello world"));
        checkNotFoundWithId(orderRepository.save(order), order.id());
    }

    public Order create(Order order) {
        Assert.notNull(order, "meal must not be null");
        pusher.trigger("my-channel", "refreshTable", Collections.singletonMap("message", "hello world"));
        return orderRepository.save(order);
    }

    @Transactional
    public void accept(int orderId, int userId) {
        User user = userRepository.get(userId);
        Order order = get(orderId);
        assuredOrderStatusOnAccept(user, order);
        order.setStatus(OrderStatus.IN_PROGRESS);
        user.setOrder(order);
        userRepository.save(user);
        orderRepository.save(order);
        pusher.trigger("my-channel", "refreshTable", Collections.singletonMap("message", "hello world"));
    }

    @Transactional
    public void complete(int orderId, int userId) {
        User user = userRepository.get(userId);
        Order order = get(orderId);
        assuredOrderStatusOnComplete(user, order);
        order.setStatus(OrderStatus.COMPLETED);
        user.setOrder(null);
        pusher.trigger("my-channel", "refreshTable", Collections.singletonMap("message", "hello world"));
        orderRepository.save(order);
    }
}
