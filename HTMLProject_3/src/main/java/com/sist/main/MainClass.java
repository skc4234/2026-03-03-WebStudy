package com.sist.main;

import java.sql.*;
import java.util.*;
import java.util.List;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("jdbc:oracle.drive.OracleDriver");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
