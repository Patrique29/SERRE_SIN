int Ihumiditer = 100;
boolean favori = false;
int larg = 480, loung = 854;
int buttonX = 100;
int buttonY = 100;
int buttonWidth = 80;
int buttonHeight = 40;
boolean buttonPressed = false;
float sliderValue;

/* This function takes six parameters:

minValue: the minimum value of the slider
maxValue: the maximum value of the slider
currentValue: the current value of the slider
x: the x position of the slider track
y: the y position of the slider track
width: the width of the slider track
height: the height of the slider track
The function draws the slider track and thumb using the parameters, and updates the currentValue parameter when the user interacts with the slider.
Finally, the function returns the updated currentValue.*/



float drawSlider(float minValue, float maxValue, float currentValue, float x, float y, float width, float height) {
  // Draw the slider track
  fill(200);
  rect(x, y, width, height);
  
  // Draw the slider thumb
  float thumbX = map(currentValue, minValue, maxValue, x, x + width);
  fill(0);
  ellipse(thumbX, y + height / 2, height, height);
  
  // Check for mouse interaction
  if (mousePressed && mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    // Update the slider value while dragging the thumb
    currentValue = map(mouseX, x, x + width, minValue, maxValue);
    
    // Constrain the slider value within the valid range
    currentValue = constrain(currentValue, minValue, maxValue);
  }
  
  // Return the current slider value
  return int(currentValue);
}


void Humiditer(int a) {  //Afficheur Humiditer
    String b = str(a);
    fill(200);
    textSize(width/10);
    text(b + "%", width / 2, height / 10);
}
void Pression(int a) { //Afficheur Pression
    String b = str(a);
    fill(200);
    textSize(width/10);
    text(b + "MPa", width / 2, height*2 / 10);
}
void Temperature(int a) {//Afficheur Température
    String b = str(a);
    fill(200);
    textSize(width/10);
    text(b + "°C", width / 2, height*3 / 10);
}

void boutonL(){
      // Draw the button
    fill(200);
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    
    //Check if the button is pressed
    if (mousePressed && mouseX >= buttonX && mouseX <= buttonX + buttonWidth && 
        mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
        buttonPressed = true;
    } else {
        buttonPressed = false;
    }
  
}

void setup() {
    size(480,854);
    background(50,50,50);
}
void mouseClicked() {
    if (buttonPressed) {
        println("Button clicked");
    }
}


void draw() {
    sliderValue = drawSlider(0, 100, sliderValue, width/8, 3*height/5, width-width/5, 20);
    println(sliderValue);
    Humiditer(Ihumiditer);
    Temperature(Ihumiditer);
    Pression(Ihumiditer);
    // if ((mouseX <= 125) && (mouseX >= 75) && (mouseY <= 125) && (mouseY >= 75) && mousePressed == true && favori == false) {
    //     favori = true;
// }
    // if ((mouseX <= 125) && (mouseX >= 75) && (mouseY <= 125) && (mouseY >= 75) && mousePressed == true && favori == true) {
    //     favori = false;
// }
    // if (favori == false) {
    //     fill(200);
// } 
    // if (favori == true) {
    //     fill(255,255,0);
// }
    // rect(75, 75, 50,50);
    // delay(200);
    
    

}
