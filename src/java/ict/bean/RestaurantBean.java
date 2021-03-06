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

    private String restID;
    private String restName;
    private String restTypeID;
    private String restTel;
    private String restEmail;
    private String district;
    private String address;
    private String ownerID;
    private String status;
    private String rest_pic;
    private String rest_desc;
    private String open_hrs;
    private String start_hour;
    private String end_hour;
    private String start_day;
    private String end_day;
    private String num_view;
    private String num_like;

    public RestaurantBean() {

    }

    public String getRestID() {
        return restID;
    }

    public void setRestID(String restID) {
        this.restID = restID;
    }

    public String getRestName() {
        return restName;
    }

    public void setRestName(String restName) {
        this.restName = restName;
    }

    public String getRestTypeID() {
        return restTypeID;
    }

    public void setRestTypeID(String restTypeID) {
        this.restTypeID = restTypeID;
    }

    public String getRestTel() {
        return restTel;
    }

    public void setRestTel(String restTel) {
        this.restTel = restTel;
    }

    public String getRestEmail() {
        return restEmail;
    }

    public void setRestEmail(String restEmail) {
        this.restEmail = restEmail;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(String ownerID) {
        this.ownerID = ownerID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRest_pic() {
        return rest_pic;
    }

    public void setRest_pic(String rest_pic) {
        this.rest_pic = rest_pic;
    }

    public String getRest_desc() {
        return rest_desc;
    }

    public void setRest_desc(String rest_desc) {
        this.rest_desc = rest_desc;
    }

    public String getOpen_hrs() {
        return start_hour + " - " + end_hour + " (" + start_day + " to " + end_day + ")";
    }

    public void setOpen_hrs(String open_hrs) {
        this.open_hrs = open_hrs;
    }

    public String getNum_view() {
        return num_view;
    }

    public void setNum_view(String num_view) {
        this.num_view = num_view;
    }

    public String getNum_like() {
        return num_like;
    }

    public void setNum_like(String num_like) {
        this.num_like = num_like;
    }

    public String getStart_hour() {
        return start_hour;
    }

    public void setStart_hour(String start_hour) {
        this.start_hour = start_hour;
    }

    public void setEnd_hour(String eh) {
        this.end_hour = eh;
    }

    public String getEnd_hour() {
        return end_hour;

    }

    public void setStart_day(String s) {
        this.start_day = s;
    }

    public String getStart_day() {
        return start_day;
    }
    
    public void setEnd_day(String end_day){
        this.end_day = end_day;
        
    } 
    
    public String getEnd_day(){
        return end_day;  
    }
    
}
