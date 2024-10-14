package com.infosys.carRentalSystem.dao;

import com.infosys.carRentalSystem.bean.CarUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Repository
public class CarUserDaoImpl implements CarUserDao{

    @Autowired
    private CarUserRepository repository;
    @Override
    public void save(CarUser carUser) {

    }

    @Override
    public List<CarUser> displayAll() {
        return null;
    }

    @Override
    public CarUser findById(String email) {
        return null;
    }
}
