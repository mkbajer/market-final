package com.solvd.market.factory;

import com.solvd.market.builder.shipments.Shipment;

public class ShipmentFactory {
    public Shipment createShipment() {
        return new Shipment();
    }
}