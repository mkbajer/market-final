package com.solvd.market.listener;

public interface OrderListener {
    void update(String eventType, String message);
}