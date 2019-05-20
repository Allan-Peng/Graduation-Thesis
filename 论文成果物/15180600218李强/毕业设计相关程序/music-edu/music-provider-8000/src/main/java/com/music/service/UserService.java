package com.music.service;

import com.music.dao.UserMapper;
import com.music.entities.User;
import com.music.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public boolean register(User user) {
        //设置用户状态为可登陆状态
        user.setState(1);
        //设置用户的密码加密MD5一层加密
        String password=user.getPassword();
        String passswordMD5=MD5.GetMD5Code(password);
        user.setPassword(passswordMD5);
        //将用户信息插入数据库
        int n=userMapper.insertSelective(user);
        if(n!=0){
            return true;
        }else{
            return false;
        }
    }

    public int login(User user) {
        //用户传过来的密码
        String password=user.getPassword();
        String passswordMD5=MD5.GetMD5Code(password);
        //从数据库中拿到密码
        String username=user.getUsername();
        User userdb=userMapper.selectByPrimaryKey(username);
        if(passswordMD5.equals(userdb.getPassword())){
            if(userdb.getState()==1){
                //登陆成功
                return 1;
            }else if(userdb.getState()==2){
                //用户被禁用
                return 2;
            }
        }
        //用户名和密码错误
        return 0;

    }
}
