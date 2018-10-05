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
		eyes.close();
		
	}
	public static void Navigate(EV3UltrasonicSensor eyes, twoMotors wheels){
		float [] sample = new float [eyes.sampleSize()];
		float [] lookLeft = new float [1];
		float [] lookRight = new float [1];
		eyes.fetchSample(sample, 0);
		
		while((Button.getButtons() != Button.ID_ESCAPE)) {
			wheels.forward();
			eyes.fetchSample(sample, 0);
			if(sample[0] < .3) {
				
				wheels.stop();
				wheels.leftTurn();
				eyes.fetchSample(lookLeft, 0);
				wheels.turnAround();
				eyes.fetchSample(lookRight, 0);
				if( lookLeft[0] < lookRight[0] ) {
					//wheels.forward();
				} else if(lookRight[0] < lookLeft[0]) {
					wheels.turnAround();
					//wheels.forward();
				} else {
					wheels.rightTurn();
				}
				
			}
			
			
			
		}
		
		
		
	}

}
