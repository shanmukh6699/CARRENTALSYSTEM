package com.infosys.carRentalSystem.dao;

import com.infosys.carRentalSystem.bean.CarVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CarVariantRepository extends JpaRepository<CarVariant, String> {
    @Query("SELECT max(variantId) from CarVariant")
    public String getLastId();
}
