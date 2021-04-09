/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.listeners;

import java.io.BufferedReader;
import java.io.FileReader;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Admin
 */
public class InitFilterListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        try {
            FileReader fr = new FileReader(sce.getServletContext().getRealPath("/") + "/WEB-INF/resource.txt");
            BufferedReader br = new BufferedReader(fr);
            String resoucre;
            while ((resoucre = br.readLine()) != null) {
                String []data=resoucre.split("=");
                context.setAttribute(data[0], data[1]);
                System.out.println(data[1]);
            }
            br.close();
            fr.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
