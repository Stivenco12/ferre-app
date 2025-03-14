package com.ferreapp;

import java.sql.Connection;
import java.util.Map;

import com.ferreapp.domain.entities.Eps;
import com.ferreapp.infrastructure.adapter.ui.EpsUI;
import com.ferreapp.infrastructure.database.ConnectMysqlFactory;
import com.ferreapp.infrastructure.persistence.EpsRepositoryImpl;


public class Main {
    public static void main(String[] args) {

        //epsUI.FindAllEps();
        //Map<Integer,Eps> myEps  = epsUI.FindAllEps();
        //myEps.forEach((k,v) -> System.out.println("id: "+ k + " nombre: " + v.getName()));
        EpsUI epsUI = new EpsUI();
        Map<Integer,Eps> myEps = epsUI.FindAllEps();
        Map<Integer,Eps> nose =  epsUI.findFirstByName("Nueva", myEps);
        nose.forEach((k,v) -> System.out.println("id: "+ k + " nombre: " + v.getName()));
    }
}