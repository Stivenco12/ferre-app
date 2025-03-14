package com.ferreapp.domain.entities;

public class Eps {
    private int id;
    private String name;

    public Eps(String name) {
        this.name = name;
    }

    
    public Eps(int id, String nombre) {
        this.id = id;
        this.name = nombre;
    }


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    
}
