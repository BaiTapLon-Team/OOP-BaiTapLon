package com.baitaplon.objects;

public class Admin extends Person {
    private String typeAdmin;

    public Admin() {
        super();
    }

    public Admin(String id, String username, String password, String name, String birthday,
                 String gender, String phone, String address, String email, String typeAdmin) {
        super(id, username, password, name, birthday, gender, phone, address, email);
        this.typeAdmin = typeAdmin;
    }

    public String getTypeAdmin() {
        return typeAdmin;
    }

    public void setTypeAdmin(String typeAdmin) {
        this.typeAdmin = typeAdmin;
    }

    public String toString() {
        String father = super.toString();
        return father + "\nChức danh: " + typeAdmin;
    }
}
