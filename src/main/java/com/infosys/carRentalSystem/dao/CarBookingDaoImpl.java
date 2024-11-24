package com.infosys.carRentalSystem.dao;

import com.infosys.carRentalSystem.bean.CarBooking;
import org.springframework.beans.factory.annotation.Autowired;

public class CarBookingDaoImpl implements CarBookingDao{
    @Autowired
    private CarBookingRepository carBookingRepository;
    @Override
    public CarBooking findById(String id) {
        return carBookingRepository.findById(id).get();
    }

    @Override
    public String generateBookingId() {
        long id;
        String lastId = carBookingRepository.getLastId();
        if(lastId == null) {
            id = 1000001L;
        } else {
            id = Long.parseLong(lastId.substring(2)) + 1;
        }
        return "BK" + id;
    }
}
