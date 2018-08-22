package top.wintp.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.wintp.crud.entity.RoleFunctionExample;
import top.wintp.crud.entity.RoleFunctionKey;

public interface RoleFunctionMapper {
    long countByExample(RoleFunctionExample example);

    int deleteByExample(RoleFunctionExample example);

    int deleteByPrimaryKey(RoleFunctionKey key);

    int insert(RoleFunctionKey record);

    int insertSelective(RoleFunctionKey record);

    List<RoleFunctionKey> selectByExample(RoleFunctionExample example);

    int updateByExampleSelective(@Param("record") RoleFunctionKey record, @Param("example") RoleFunctionExample example);

    int updateByExample(@Param("record") RoleFunctionKey record, @Param("example") RoleFunctionExample example);
}