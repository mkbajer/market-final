package com.solvd.market.persistence;

import com.solvd.market.builder.products.Product;

import java.util.List;

public interface ProductRepository {
    void create(Product product, Long categoryId);

    List<Product> findAll();

    Product findById(Long id);

    void update(Product product);

    void delete(Long id);
}
