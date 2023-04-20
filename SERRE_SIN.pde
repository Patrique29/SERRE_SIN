int Ihumiditer = 100;
boolean favori = false;
boolean buttonPressedL = false;
int sliderValue;
int dernValue;
boolean buttonStateT;
int couleurtheme = 50,couleurtexte = 200;



int drawSlider(float minValue, float maxValue, float currentValue, float x, float y, float width, float height) {
    
    
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
    //Draw the slider track
    
    fill(couleurtheme);
    rect(x-10, y, width+20, height);
    fill(200);
    rect(x, y, width, height);
    
    //Draw the slider thumb
    float thumbX = map(currentValue, minValue, maxValue, x, x + width);
    fill(0);
    ellipse(thumbX, y + height / 2, height, height);
    
    //Check for mouse interaction
    if(mousePressed && mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
        // Update the slider value while dragging the thumb
        currentValue = map(mouseX, x, x + width, minValue, maxValue);
        
        // Constrain the slider value within the valid range
        currentValue = constrain(currentValue, minValue, maxValue);
}
    
    return int(currentValue);
    
}


void Humiditer(int a) {  //Afficheur Humiditer
    String b = str(a);
    
    fill(couleurtheme+25);
    rect(width / 2,(height / 10) + 2, height / 6, -width / 8);
    
    fill(couleurtexte);
    textSize(height / 16);
    text(b + "%", width / 2, height / 10);
}
void Pression(int a) { //Afficheur Pression
    String b = str(a * 10);
    
    fill(couleurtheme+25);
    rect(width / 2,(height * 2 / 10) + 2, height / 4, -width / 8);
    
    fill(couleurtexte);
    textSize(height / 16);
    text(b + "hPa", width / 2, height * 2 / 10);
}
void Temperature(int a) {//Afficheur Température
    if (a >= 100) { a = 99;}
    String b = str(a);
    
    fill(couleurtheme+25);
    rect(width / 2,(height * 3 / 10) + 2, height / 8, -width / 8);
    
    fill(couleurtexte);
    textSize(height / 16);
    text(b + "°C", width / 2, height * 3 / 10);
}

void boutonL() { // Bouton Lumière
}

void ThemeDark(){ // Bouton Thème Light/dark
    
      // Draw the button
      fill(255); // debug
      rect(width-50, 0, height/5, width/10,  0,0,0,25);
    
      // Check if the mouse is over the button
      if (mouseX >= (width-50) && mouseX <= width && mouseY >= 0 && mouseY <= width/10 && mousePressed) {
        fill(255,0,0); // debug
        rect(width-50, 0, height/5, width/10,  0,0,0,25); // debug

        

        buttonStateT = !buttonStateT; 
        if(buttonStateT == true){
            couleurtheme = 50;
            couleurtexte = 200;
        }else {
            couleurtheme = 230;
            couleurtexte = 0;
        }
        delay(400); //https://u6.satisfactorytools.com/production?share=ZOrQPrcxk52f5L6Ervag
      }
}


void setup() {
    size(480,854); // 480 x 854 pour Jerry; 720 x 1440 pour nokia 3.1
    noStroke();
}
void mouseClicked() {

}


void draw() {


    background(couleurtheme);
    fill(couleurtheme+25);
    rect(0+10,0+20,width-20,(height/3)-10,25);
    ThemeDark();
    println(couleurtheme);
    sliderValue = drawSlider(0, 100, sliderValue, width / 8, 3 * height / 5, width - width / 5, 20);
    if (sliderValue != dernValue) {
        println(sliderValue);
    }
    dernValue = sliderValue;
    Humiditer(sliderValue);
    Temperature(sliderValue);
    Pression(sliderValue);
}
