import lejos.hardware.sensor.*;
import lejos.hardware.ev3.LocalEV3;
import lejos.hardware.port.*;
import lejos.hardware.Button;
import lejos.hardware.lcd.LCD;
import lejos.hardware.motor.Motor;
import lejos.hardware.motor.NXTRegulatedMotor;
import lejos.hardware.Sound;
import lejos.utility.Delay;


public class Project1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Initialization of sensors and motors
		NXTRegulatedMotor leftWheel = Motor.A;
		NXTRegulatedMotor rightWheel = Motor.D;
		Port port = LocalEV3.get().getPort("S1");
		EV3UltrasonicSensor eyes = new EV3UltrasonicSensor(port);
		twoMotors wheels = new twoMotors(leftWheel,rightWheel);
		
		// Thread or process handling Navigation
		Navigate(eyes,wheels);
		
	}
	public static void Navigate(EV3UltrasonicSensor eyes, twoMotors wheels){
		float [] sample = new float [eyes.sampleSize()];
		
		
		wheels.forward();
		Delay.msDelay(3000);
		wheels.leftTurn();
		Delay.msDelay(2000);
		wheels.forward();
		Delay.msDelay(3000);
		wheels.rightTurn();
		Delay.msDelay(2000);
		wheels.forward();
		Delay.msDelay(3000);
		wheels.backUp();
		Delay.msDelay(3000);
		wheels.stop();
		Delay.msDelay(3000);
		wheels.turnAround();
		Delay.msDelay(2000);
		wheels.forward();
		Delay.msDelay(3000);
		
	}

}
