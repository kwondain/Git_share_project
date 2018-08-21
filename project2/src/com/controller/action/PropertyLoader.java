package com.controller.action;

import java.net.URL;
public class PropertyLoader {
    public static void main(String[] args) {
        final URL resource = PropertyLoader.class.getResource("PropertyLoader.class");
        System.out.println(resource);
    }
}