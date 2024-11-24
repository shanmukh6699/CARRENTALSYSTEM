package com.infosys.carRentalSystem.dao;

import com.infosys.carRentalSystem.bean.CarBooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CarBookingRepository extends JpaRepository<CarBooking, String> {
    @Query("SELECT max(variantId) from CarBooking")
    public String getLastId();
}
