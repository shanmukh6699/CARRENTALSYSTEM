package com.infosys.carRentalSystem.dao;

import com.infosys.carRentalSystem.bean.CarBooking;

public interface CarBookingDao {
    public CarBooking findById(String id);
    public String generateBookingId();

}
