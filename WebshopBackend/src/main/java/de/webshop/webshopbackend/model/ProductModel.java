package de.webshop.webshopbackend.model;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Entity
@Data
public class ProductModel {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator",
            parameters = {
                    @Parameter(
                            name = "uuid_gen_strategy_class",
                            value = "org.hibernate.id.uuid.CustomVersionOneStrategy"
                    )
            }
    )
    @Column(updatable = false, nullable = false)
    private UUID id;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<PictureModel> pictureModels;

    @Column(nullable = false)
    private String name;

    @Column()
    private String description;

    @Column(nullable = false)
    private BigDecimal price;

    @Column()
    @Enumerated(EnumType.STRING)
    private Category category;

    @Column()
    @Enumerated(EnumType.STRING)
    private SubCategory subCategory;

}
