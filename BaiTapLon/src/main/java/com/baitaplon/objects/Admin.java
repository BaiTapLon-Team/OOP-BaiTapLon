package com.baitaplon.objects;

public class Admin extends ConNguoi{
    private String typead;

    public Admin() {
        super();
    }

    public Admin(String id, String username, String password, String name, String birthday,
                 String gender, String phone, String address, String email, String typead) {
        super(id, username, password, name, birthday, gender, phone, address, email);
        this.typead = typead;
    }

    public String getTypead () {
        return typead;
    }

    public void setTypead ( String typead ) {
        this.typead = typead;
    }

    public String toString() {
        String father = super.toString();
        return father + "\nChức danh: " + typead;
    }
}
