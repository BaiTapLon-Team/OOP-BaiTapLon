package com.baitaplon.objects;

public class GiaoVien extends ConNguoi{
    private String qualifications;
    private float n_salyry;

    public GiaoVien ( ) {
        super();
    }

    public GiaoVien ( String id, String username, String password, String name, String birthday,
                      String gender, String phone, String address, String email, String qualifications, float n_salyry ) {
        super(id, username, password, name, birthday, gender, phone, address, email);
        this.qualifications = qualifications;
        this.n_salyry = n_salyry;
    }

    public String getQualifications () {
        return qualifications;
    }

    public void setQualifications ( String qualifications ) {
        this.qualifications = qualifications;
    }

    public float getN_salyry () {
        return n_salyry;
    }

    public void setN_salyry ( float n_salyry ) {
        this.n_salyry = n_salyry;
    }

    @Override
    public String toString() {
        String father = super.toString();
        return father + "\nTrình Độ: " + qualifications + "| Hệ số lương: " + n_salyry;
    }
}
