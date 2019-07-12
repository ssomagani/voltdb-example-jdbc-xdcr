package com.example;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

public class Application {

    public static void main(String[] args) {
        
        String server = args[0];
        String exchange = args[1];
        
        String driver = "org.voltdb.jdbc.Driver";
        String url = "jdbc:voltdb://" + server + ":21212";
        
        try {
                // Load driver. Create connection.
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url);
            
               // call a stored procedure
            CallableStatement proc = conn.prepareCall("{call NEW_ORDER(?, ?, ?, ?)}");
            
            int startId = 0;
            if(exchange.equals("LONDON"))
                startId = 10000000;
            
            for(int i=startId; i<startId+1000000; i++) {
                proc.setInt(1, i);
                proc.setInt(2, i%1000);
                proc.setString(3, exchange);
                proc.setInt(4, 0);
                proc.execute();
            }
            proc.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
