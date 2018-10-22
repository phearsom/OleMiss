import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import lejos.hardware.Bluetooth;
import lejos.remote.nxt.NXTCommConnector;
import lejos.remote.nxt.NXTConnection;

import lejos.hardware.sensor.*;
import lejos.hardware.ev3.LocalEV3;
import lejos.hardware.port.*;
import lejos.hardware.Bluetooth;
import lejos.hardware.Button;
import lejos.hardware.lcd.LCD;
import lejos.hardware.motor.Motor;
import lejos.hardware.motor.NXTRegulatedMotor;
import lejos.hardware.Sound;
import lejos.utility.Delay;
import lejos.robotics.*;
import lejos.robotics.chassis.WheeledChassis;
import lejos.robotics.navigation.DifferentialPilot;

public class EV3Connect {

	private static final String EV3 = "00:16:53:4A:7F:04";

	// ALTERNATE ADDRESS 00:16:53:4A:7F:04
	// 00:16:53:44:29:C1

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		NXTCommConnector connector = Bluetooth.getNXTCommConnector();
		System.out.println("Connecting to " + EV3);
		NXTConnection connection = connector.connect(EV3, NXTConnection.RAW);
		System.out.println("Connected");

		DataInputStream input = connection.openDataInputStream();
		DataOutputStream output = connection.openDataOutputStream();

		System.out.println("Sending data");

		int cnt = 0;
		byte[] o = new byte[8];
		byte[] r = new byte[8];
		while (Button.getButtons() != Button.ID_ESCAPE) {
			Button.waitForAnyPress();
			for (int i = 0; i < 8; i++) 
				o[i] = (byte) cnt++;
				output.write(o);
				output.flush();
				input.read(r);

				System.out.println("Read: " + r[0] + r[1] + r[2] + r[3] + r[4]
						+ r[5] + r[6] + r[7]);
			}
			System.out.println("All data sent");
			// Delay.msDelay(1000);

			output.close();
			input.close();
			connection.close();

			System.out.println("Connection closed");
		}

	}


