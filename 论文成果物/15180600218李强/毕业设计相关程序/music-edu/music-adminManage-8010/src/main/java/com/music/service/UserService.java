package com.music.service;

import com.music.dao.UserMapper;
import com.music.entities.User;
import com.music.entities.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public List<User> getAllUser() {
        return userMapper.selectByExample(new UserExample());
    }

    public boolean enableUser(String[] users) {
        for(String username:users){
            User user = userMapper.selectByPrimaryKey(username);
            if(user.getState()==2){
                user.setState(1);
            }else if(user.getState()==4){
                user.setState(3);
            }
            int i = userMapper.updateByPrimaryKeySelective(user);
            if(i==0){
                return false;
            }
        }
        return true;
    }
    public boolean disableUser(String[] users) {
        for(String username:users){
            User user = userMapper.selectByPrimaryKey(username);
            if(user.getState()==1){
                user.setState(2);
            }else if(user.getState()==3){
                user.setState(4);
            }
            int i = userMapper.updateByPrimaryKeySelective(user);
            if(i==0){
                return false;
            }
        }
        return true;
    }
}
