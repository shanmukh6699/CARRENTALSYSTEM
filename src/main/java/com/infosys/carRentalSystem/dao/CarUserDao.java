package com.infosys.carRentalSystem.dao;

import com.infosys.carRentalSystem.bean.CarUser;

import java.util.List;

public interface CarUserDao {
    public void save(CarUser carUser);
    public List<CarUser> displayAll();
    public CarUser findById(String email);


}
