package lt.pigustralas.breakdown.web.order;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.model.OrderStatus;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "/profile/orders", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProfileOrderUIController extends AbstractOrderController {

    @Override
    @GetMapping
    public List<Order> getAll() {
        List<Order> activeOrders = super.getAll()
                .stream()
                .filter(order -> order.getStatus().equals(OrderStatus.ACTIVE))
                .collect(Collectors.toList());
        return activeOrders;
    }

    @Override
    @GetMapping("/{id}")
    public Order get(@PathVariable int id) {
        return super.get(id);
    }

    @Override
    @GetMapping("/active")
    public Order getCurrentOrder() {
        return super.getCurrentOrder();
    }

    @Override
    @PostMapping("/accept/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void accept(@PathVariable int id) {
        super.accept(id);
    }

    @Override
    @PostMapping("/complete/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void complete(@PathVariable int id) {
        super.complete(id);
    }
}
