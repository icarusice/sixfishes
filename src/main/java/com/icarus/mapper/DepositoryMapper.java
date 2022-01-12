package com.icarus.mapper;

import com.icarus.entity.Depository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
@Repository
public interface DepositoryMapper {

    /**
     * 查询所有仓库
     * @return 仓库集合
     */
    List<Depository> findDepositoryAll();
    /**
     * 根据仓库id查询仓库名称
     * @param id 仓库id
     * @return 仓库名称
     */
    String findDepositoryNameById(int id);
}
