package com.baitaplon.objects;

public class Teacher extends Person {
    private String qualifications;  // Trình độ chuyên môn.
    private float coefficientsSalary; // Hệ số lương

    public Teacher() {
        super();
    }

    public Teacher(String id, String username, String password, String name, String birthday,
                   String gender, String phone, String address, String email, String qualifications, float coefficientsSalary ) {
        super(id, username, password, name, birthday, gender, phone, address, email);
        this.qualifications = qualifications;
        this.coefficientsSalary = coefficientsSalary;
    }

    public String getQualifications() {
        return qualifications;
    }

    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    public float getCoefficientsSalary() {
        return coefficientsSalary;
    }

    public void setCoefficientsSalary(float coefficientsSalary) {
        this.coefficientsSalary = coefficientsSalary;
    }

    public int payroll() {
        return (int)(coefficientsSalary*1200000);
    }

    @Override
    public String toString() {
        String father = super.toString();
        return father + "\nTrình Độ: " + qualifications + "| Hệ số lương: " + coefficientsSalary;
    }
}
