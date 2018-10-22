


import lejos.hardware.sensor.*;
import lejos.hardware.ev3.LocalEV3;
import lejos.hardware.port.*;
import lejos.hardware.Button;
import lejos.hardware.lcd.LCD;
import lejos.hardware.Sound;
import lejos.utility.Delay;



public class Touch {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
	//	boolean exit = true;
		Port port = LocalEV3.get().getPort("S1");
//		EV3TouchSensor touch = new EV3TouchSensor(port);
//		SensorMode touchProvider = (SensorMode) touch.getTouchMode();
//		float [] sample = new float [touch.sampleSize()];
//		touchProvider.fetchSample(sample,0);
		EV3UltrasonicSensor sonic = new EV3UltrasonicSensor(port);
		SensorMode soundProvider = (SensorMode) sonic.getDistanceMode();
		float [] sample = new float [sonic.sampleSize()];
		soundProvider.fetchSample(sample, 0);
		
		
		
		
		while (Button.getButtons() != Button.ID_ESCAPE){
//			touchProvider.fetchSample(sample, 0);
//			LCD.drawString("touch: " + sample[0], 0, 0);
			soundProvider.fetchSample(sample, 0);
			if(sample[0] < 1){
				Sound.beep();
			}
			LCD.drawString(sample[0] + " Sound/Distance = " , 0, 0);
		/*	for(float samples: sample){
//				LCD.drawString(samples +"",0,0);
				//System.out.println(sample);
			}
			*/
			//System.out.println(sample[0]);
			
			
			
			Delay.msDelay(200);
		}
		
		/*while(exit){
				
			if(true)
			System.out.println("The touch sensor has been pressed.");
			
			if (Button.ESCAPE.isDown())
				exit = false;
		}
		*/
		sonic.close();
	}
	
	public void toDisplay(){
		
	}

}
