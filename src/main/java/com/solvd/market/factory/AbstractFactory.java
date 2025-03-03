package com.solvd.market.factory;

import com.solvd.market.builder.orders.Order;
import com.solvd.market.builder.payments.Payment;
import com.solvd.market.builder.shipments.Shipment;

public interface AbstractFactory {
    Order createOrder();

    Payment createPayment();

    Shipment createShipment();
}
