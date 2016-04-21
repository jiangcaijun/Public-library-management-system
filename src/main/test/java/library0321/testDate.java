package library0321;

import java.util.Calendar;
import java.util.Date;

public class testDate {
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println("date====="+date);
		
		Date willReturnTime = new Date(date.getTime()+(1000*3600*24*20));
		System.out.println("willReturnTime====="+willReturnTime);
	}
}
