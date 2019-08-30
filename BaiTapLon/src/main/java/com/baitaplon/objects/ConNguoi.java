package com.baitaplon.objects;

public class ConNguoi {
    private String id;
    private String username;
    private String password;
    private String name;
    private String birthday;
    private String gender;
    private String phone;
    private String address;
    private String email;

    public ConNguoi ( ) {

    }

    public ConNguoi ( String id, String username, String password, String name, String birthday,
                      String gender, String phone, String address, String email ) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public String getId () {
        return id;
    }

    public void setId ( String id ) {
        this.id = id;
    }

    public String getUsername () {
        return username;
    }

    public void setUsername ( String username ) {
        this.username = username;
    }

    public String getPassword () {
        return password;
    }

    public void setPassword ( String password ) {
        this.password = password;
    }

    public String getName () {
        return name;
    }

    public void setName ( String name ) {
        this.name = name;
    }

    public String getBirthday () {
        return birthday;
    }

    public void setBirthday ( String birthday ) {
        this.birthday = birthday;
    }

    public String getGender () {
        return gender;
    }

    public void setGender ( String gender ) {
        this.gender = gender;
    }

    public String getPhone () {
        return phone;
    }

    public void setPhone ( String phone ) {
        this.phone = phone;
    }

    public String getAddress () {
        return address;
    }

    public void setAddress ( String address ) {
        this.address = address;
    }

    public String getEmail () {
        return email;
    }

    public void setEmail ( String email ) {
        this.email = email;
    }

    @Override
    public String toString() {
        String temp;
        temp = String.format("%8s | %25s | %15s |\n%8s | %25s | %15s |\n%30s ", id, name, birthday, gender, phone, address, email);
        return "dfk";
    }
}
