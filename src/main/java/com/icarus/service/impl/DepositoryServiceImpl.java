package com.icarus.service.impl;

import com.icarus.entity.Depository;
import com.icarus.mapper.DepositoryMapper;
import com.icarus.service.DepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepositoryServiceImpl implements DepositoryService {
    @Autowired
    private DepositoryMapper depositoryMapper;
    @Override
    public List<Depository> findDepositoryAll() {
        return depositoryMapper.findDepositoryAll();
    }
}
