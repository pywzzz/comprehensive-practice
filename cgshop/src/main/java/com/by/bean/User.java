package com.by.bean;

import lombok.Data;

@Data
public class User {
    String id;
    String username;
    String password;
    String name;
    int gender;
    String mobile;
    String roleId;
    int status;
}
