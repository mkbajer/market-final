package com.solvd.market.builder;

import com.solvd.market.builder.orders.Order;

public class OrderBuilder {
    private Order order;

    public OrderBuilder() {
        this.order = new Order();
    }

    public OrderBuilder setId(Long id) {
        order.setId(id);
        return this;
    }

    public OrderBuilder setCustomerName(String customerName) {
        order.setCustomerName(customerName);
        return this;
    }

    public Order build() {
        return order;
    }
}
