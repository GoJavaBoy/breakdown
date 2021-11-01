package lt.pigustralas.breakdown.web.order;

import lt.pigustralas.breakdown.model.Order;
import lt.pigustralas.breakdown.util.exception.IllegalRequestDataException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/consumer/newOrder", produces = MediaType.APPLICATION_JSON_VALUE)
public class ConsumerSideOrderController extends AbstractOrderController {

    @PostMapping
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void createOrUpdate(Order order) {
        if (order.isNew()) {
            super.create(order);
        } else {
            throw new IllegalRequestDataException("Order should be new!");
        }
    }
}
