package com.solvd.market.factory;

import com.solvd.market.builder.orders.Order;
import com.solvd.market.builder.payments.Payment;
import com.solvd.market.builder.shipments.Shipment;

public class Factory implements AbstractFactory {
    @Override
    public Order createOrder() {
        return new Order();
    }

    @Override
    public Payment createPayment() {
        return new Payment();
    }

    @Override
    public Shipment createShipment() {
        return new Shipment();
    }
}