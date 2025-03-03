package com.solvd.market.builder;

import com.solvd.market.builder.shipments.Shipment;

public class ShipmentBuilder {
    private Shipment shipment;

    public ShipmentBuilder() {
        this.shipment = new Shipment();
    }

    public ShipmentBuilder setId(Long id) {
        shipment.setId(id);
        return this;
    }

    public ShipmentBuilder setCourier(String courier) {
        shipment.setCourier(courier);
        return this;
    }

    public Shipment build() {
        return shipment;
    }
}