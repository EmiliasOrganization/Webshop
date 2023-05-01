package de.webshop.webshopbackend.service;

import de.webshop.webshopbackend.Exceptions.ElementNotFoundException;
import de.webshop.webshopbackend.model.Categorie;
import de.webshop.webshopbackend.model.ProductModel;
import de.webshop.webshopbackend.repo.PurchaseObjectsRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class FindPurchaseObjectService {

    PurchaseObjectsRepository purchaseObjectsRepository;

    @Transactional
    public ProductModel findPurchaseObjectById(UUID id) {
        return purchaseObjectsRepository.findById(id).orElseThrow(() -> new ElementNotFoundException("Product with id: " + id + " not found!"));
    }
    @Transactional
    public ProductModel findPurchaseObjectByCategory(Categorie category) {
        return purchaseObjectsRepository.findByCategory(category).orElseThrow(() -> new ElementNotFoundException("Product with category: " + category + " not found!"));
    }
    @Transactional
    public List<ProductModel> findAllPurchaseObjectModel() {
        return purchaseObjectsRepository.findAll();
    }


}
