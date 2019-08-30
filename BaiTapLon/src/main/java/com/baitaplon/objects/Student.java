package com.baitaplon.objects;

public class Student extends Person {

    private String teacherID;

    public Student() {
        super();
    }

    public Student(String id, String username, String password, String name, String birthday,
                   String gender, String phone, String address, String email, String teacherID ) {
        super(id, username, password, name, birthday, gender, phone, address, email);
        this.teacherID = teacherID;
    }

    public String getMagv () {
        return teacherID;
    }

    public void setMagv ( String teacherID ) {
        this.teacherID = teacherID;
    }

    public String toString () {
        String father = super.toString();
        return father + "\nMã GV quản lí: " + teacherID;
    }
}
