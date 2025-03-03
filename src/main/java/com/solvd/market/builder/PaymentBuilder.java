package com.solvd.market.builder;

import com.solvd.market.builder.payments.Payment;

public class PaymentBuilder {
    private Payment payment;

    public PaymentBuilder() {
        this.payment = new Payment();
    }

    public PaymentBuilder setId(Long id) {
        payment.setId(id);
        return this;
    }

    public PaymentBuilder setType(String type) {
        payment.setType(type);
        return this;
    }

    public Payment build() {
        return payment;
    }
}