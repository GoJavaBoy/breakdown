package lt.pigustralas.breakdown.web.order;

import lt.pigustralas.breakdown.model.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/profile/orders", produces = MediaType.APPLICATION_JSON_VALUE)
public class OrderUIController extends AbstractOrderController {

    @Override
    @GetMapping
    public List<Order> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping("/{id}")
    public Order get(@PathVariable int id) {
        return super.get(id);
    }

    @Override
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable int id) {
        super.delete(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void createOrUpdate(Order order) {
        if (order.isNew()) {
            super.create(order);
        } else {
            super.update(order, order.getId());
        }
    }

    @Override
    @PostMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void enable(@PathVariable int id, @RequestParam boolean enabled) {
        super.enable(id, enabled);
    }
}
