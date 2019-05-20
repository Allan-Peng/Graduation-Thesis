package com.music.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

@NoArgsConstructor //无参构造器
@AllArgsConstructor //全参构造器
@Data //get set 方法
@Accessors(chain=true) //链式调用
@ToString
public class Type implements Serializable {
    private Integer typeId;

    private String typeName;

    public Integer getTypeId() {
        return typeId;
    }


}