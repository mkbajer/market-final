package com.solvd.market.factory;

import com.solvd.market.builder.orders.Order;

public class OrderFactory {
    public Order createOrder() {
        return new Order();
    }
}