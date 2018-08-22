package top.wintp.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import top.wintp.crud.entity.AuthFunction;
import top.wintp.crud.entity.AuthFunctionExample;

public interface AuthFunctionMapper {
    long countByExample(AuthFunctionExample example);

    int deleteByExample(AuthFunctionExample example);

    int deleteByPrimaryKey(String id);

    int insert(AuthFunction record);

    int insertSelective(AuthFunction record);

    List<AuthFunction> selectByExample(AuthFunctionExample example);

    AuthFunction selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") AuthFunction record, @Param("example") AuthFunctionExample example);

    int updateByExample(@Param("record") AuthFunction record, @Param("example") AuthFunctionExample example);

    int updateByPrimaryKeySelective(AuthFunction record);

    int updateByPrimaryKey(AuthFunction record);
}