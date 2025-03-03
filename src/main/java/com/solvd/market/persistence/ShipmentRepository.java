package com.solvd.market.persistence;

import com.solvd.market.builder.shipments.Shipment;

import java.util.List;

public interface ShipmentRepository {

    void create(Shipment shipment, Long orderId);

    List<Shipment> findAll();

    Shipment findById(Long id);

    void update(Shipment shipment);

    void delete(Long id);
}