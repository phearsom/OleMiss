import lejos.hardware.sensor.*;
import lejos.hardware.ev3.LocalEV3;
import lejos.hardware.port.*;
import lejos.hardware.Button;
import lejos.hardware.lcd.LCD;
import lejos.hardware.motor.Motor;
import lejos.hardware.motor.NXTRegulatedMotor;
import lejos.hardware.Sound;
import lejos.utility.Delay;


public class Robot {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Port port = LocalEV3.get().getPort("S1");
		EV3UltrasonicSensor sonic = new EV3UltrasonicSensor(port);
		SensorMode soundProvider = (SensorMode) sonic.getDistanceMode();
		float [] sample = new float [sonic.sampleSize()];
		soundProvider.fetchSample(sample, 0);
		System.out.println(Motor.D.getPosition()+"");
		
		while((Button.getButtons() != Button.ID_ESCAPE)){
			
			if(sample[0] > .5)	
				Motor.C.forward();	
			else if(sample[0] < .5)
				Sound.beep();
			
		}
		
		sonic.close();
	}

}
