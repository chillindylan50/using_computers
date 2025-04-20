/*************************************
arduino_template.ino

This is a template for writing Arduino code.

Style guide:
- Naming: all things should have lowercase snake_case, except capitalized GLOBAL_CONSTANTS
- Spacing
  - Three lines between major sections (numbered, surrounded by ***** five asterisks *****)
  - Two lines between functions and mid-level sections
  - One line between code chunks ("paragraphs")
  - Comments before each chunk and line comments are both with two slashes //

Typical parameters a user wants to edit marked by **USER**

TODO:
1. An Item

Written by Authors. Last edited 2019-10-27 YMD by Editor.
*************************************/



// ***** 1. Import libraries *****
#include <Wire.h>
#include <math.h> // For log base n



// ***** 2. Initialize Variables *****
// 2.1 General varibles

// 2.2 Sensor variables
const int NUM_SENSORS = 1;
int sensorAddresses[NUM_SENSORS] = 0;



// ***** 3. Set up Arduino ***** 
void setup() {
  // 3.1. Set up serial port
  Wire.begin(); // Join i2c bus (address optional for master)
  Serial.begin(2000000); // Start serial for output


  // 3.2. Another major section
  // Some code
}



// ***** 4. Loop Forever and do XYZ ***** 
void loop() {
  // Do nonsense forever

  // 4.1 Iterate over sensors
  for (int sensor = 0; sensor < NUM_SENSORS; sensor++) {
    a_function(sensorAddresses[sensor]); // Line comment
  }
}



// ***** 5. Helper Functions ***** 
void a_function(const int &local_variable_passed_by_reference) {
    // Description of the function (as a "docstring")
    int something = 1; // Local comment
}
