package com.solvd.market.listener;

import java.util.ArrayList;
import java.util.List;

public class OrderEventManager {
    private List<OrderListener> listeners = new ArrayList<>();

    public void subscribe(OrderListener listener) {
        listeners.add(listener);
    }

    public void unsubscribe(OrderListener listener) {
        listeners.remove(listener);
    }

    public void notifyListeners(String eventType, String message) {
        for (OrderListener listener : listeners) {
            listener.update(eventType, message);
        }
    }
}