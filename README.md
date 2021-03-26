# raspi-gps-logger is a raspberrypi based GPS logs collection unit. It uses SimpleRTK2B GNSS antenna and stores collected GPS data on an attached USB.

***********************************Setting up your device*****************************************
			
	1) Configure simple RTK2B using UBX: Enable the receiver to receive RAW logs
		a. Connect RTK2B to windows PC (via USB) which has u-center installed.
		b. Open u-center and choose appropriate COM port so that the connection with RTK is established.
	
	
	ucentre.png![image](https://user-images.githubusercontent.com/39088910/112604978-cccb7580-8e3c-11eb-89b3-de76506c131f.png)

		
		a. Enable UBX-RXM-RAWX and UBX-RXM-SFRBX from Ucentre

	

	2) Setup Raspi to create a mount point and map USB to it. Open the file and replace "RTKLOGGER' with the name of your USB stick.(Needs improvement)

	Copy mountusb.py module in /home/pi/Desktop/source_code


	3)  Install rtklib and setup log collection script.

		a. Download rtklib_2.4.2 software and copy to "/home/pi/Desktop/rtklib"
		b. Copy collectLogStr2str.sh "/home/pi/Desktop/source_code"


	4) Enable  myscript.service which invokes collectLogStr2str.sh at boot time.
	
		    sudo cp  myscript.service /etc/systemd/system/myscript.service
		    sudo systemctl enable  myscript.service
		    sudo systemctl start  myscript.service  //should complete without errors.
		


	5) Attach the button as shown below. (to be added)
		a.  The pins used on Raspberry pi is GPIO 27 and any of  the nearest ground pin. 
	
	6) Setup  shutdown_button  to gracefully stop log collection and reboot /shutdown the system.
		a. Copy the folder shutdown_button_master on desktop and move shutdown_button.py  to "/usr/local/bin"
			
			    sudo apt install python3-gpiozero
			    sudo mkdir -p /usr/local/bin
			    cd  /home/pi/Desktop/shutdown_button_master
			    chmod +x shutdown_button.py
			   
		b. Enable Shutdown_button_service
			    sudo cp shutdown_button.py /usr/local/bin
			# enable shutdown button service
			    sudo cp shutdown_button.service /etc/systemd/system/shutdown_button.service
			    sudo systemctl enable shutdown_button.service
			    sudo systemctl start shutdown_button.service.


***********************************Using the device*****************************************


Now the RASPI should have a USB, a button to shutdown/restart and SimpleRTK2B connected to it via a serial port.
Every boot automatically triggers log collection and the RASPI must either be restarted to collect logs in a new file.

ucentre.png![image](https://user-images.githubusercontent.com/39088910/112604978-cccb7580-8e3c-11eb-89b3-de76506c131f.png)

1) Power on the RASPI > Log collection begins a few seconds later after powering up.
2) Once collection is done: Press shutdown/restart button to stop log collection. 
		* The raspi will reboot if button held between 2-5 seconds.
		* The raspi will shutdown if button held for more than 10 seconds.
3) Once the Raspi is shutdown, the logs will be stored with .ubx extension and named with date + timestamp.
