package com.solvd.market.factory;

import com.solvd.market.builder.payments.Payment;

public class PaymentFactory {
    public Payment createPayment() {
        return new Payment();
    }
}