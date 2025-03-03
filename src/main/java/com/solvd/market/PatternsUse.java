package com.solvd.market;

import com.solvd.market.builder.OrderBuilder;
import com.solvd.market.builder.PaymentBuilder;
import com.solvd.market.builder.ShipmentBuilder;
import com.solvd.market.builder.orders.Order;
import com.solvd.market.builder.payments.Payment;
import com.solvd.market.builder.shipments.Shipment;
import com.solvd.market.factory.AbstractFactory;
import com.solvd.market.factory.Factory;
import com.solvd.market.listener.OrderEventManager;
import com.solvd.market.listener.OrderListener;

public class PatternsUse {
    public static void main(String[] args) {
        // Builder Pattern
        Order order = new OrderBuilder()
                .setId(1L)
                .setCustomerName("John Doe")
                .build();

        Payment payment = new PaymentBuilder()
                .setId(1L)
                .setType("Credit Card")
                .build();

        Shipment shipment = new ShipmentBuilder()
                .setId(1L)
                .setCourier("DHL")
                .build();

        System.out.println("Order created: " + order);
        System.out.println("Payment created: " + payment);
        System.out.println("Shipment created: " + shipment);

        // Factory Pattern
        AbstractFactory factory = new Factory();
        Order factoryOrder = factory.createOrder();
        Payment factoryPayment = factory.createPayment();
        Shipment factoryShipment = factory.createShipment();

        System.out.println("Factory Order created: " + factoryOrder);
        System.out.println("Factory Payment created: " + factoryPayment);
        System.out.println("Factory Shipment created: " + factoryShipment);

        // Listener Pattern
        OrderEventManager eventManager = new OrderEventManager();
        OrderListener listener = new OrderListener() {
            @Override
            public void update(String eventType, String message) {
                System.out.println("Event received: " + eventType + " - " + message);
            }
        };

        eventManager.subscribe(listener);
        eventManager.notifyListeners("OrderCreated", "Order with ID 1 has been created.");
        eventManager.unsubscribe(listener);
    }
}