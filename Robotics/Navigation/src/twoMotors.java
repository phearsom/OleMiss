import lejos.hardware.motor.Motor;
import lejos.hardware.motor.NXTRegulatedMotor;


@SuppressWarnings("unused")
public class twoMotors {
	
	
	private NXTRegulatedMotor Left;
	private NXTRegulatedMotor Right;
	public twoMotors(NXTRegulatedMotor Left, NXTRegulatedMotor Right){
		this.Left = Left;
		this.Right = Right;
	}
	public void leftTurn(){
		stop();
		Right.rotate(180,true);
	}
	public void rightTurn(){
		stop();
		Left.rotate(180,true);
	}
	public void backUp(){
		Left.backward();
		Right.backward();
	}
	public void forward(){
		Left.forward();
		Right.forward();
	}
	public void stop(){
		Left.stop();
		Right.stop();
	}
	public void turnAround(){
		stop();
		Left.rotate(-180,true);
		Right.rotate(180,true);
	}
	

}
