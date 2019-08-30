package com.baitaplon.objects;

public class SinhVien extends ConNguoi {
    private String magv;

    public SinhVien () {
        super();
    }

    public SinhVien ( String id, String username, String password, String name, String birthday,
                      String gender, String phone, String address, String email, String magv ) {
        super(id, username, password, name, birthday, gender, phone, address, email);
        this.magv = magv;
    }

    public String getMagv () {
        return magv;
    }

    public void setMagv ( String magv ) {
        this.magv = magv;
    }

    public String toString () {
        String father = super.toString();
        return father + "\nMã GV quản lí: " + magv;
    }
}
