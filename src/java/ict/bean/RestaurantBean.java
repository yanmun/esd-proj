/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

/**
 *
 * @author a1
 */
public class RestaurantBean {
    private String id;
    private String name;
    private String tel;
    private int age;
    
    public RestaurantBean() {}
    
    public String getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    
    public String getTel() {
        return tel;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
}
