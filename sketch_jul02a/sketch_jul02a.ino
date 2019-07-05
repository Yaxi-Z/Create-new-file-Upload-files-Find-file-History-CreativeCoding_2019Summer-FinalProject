int outputPin=2;
int inputPin=3;

void setup() {
  Serial.begin(9600);
  pinMode(inputPin,INPUT);
  pinMode(outputPin,OUTPUT);
  pinMode(8,OUTPUT);
}

void loop() {
  digitalWrite(outputPin,LOW);
  delayMicroseconds(2);
  digitalWrite(outputPin,HIGH);
  delayMicroseconds(10);
  digitalWrite(outputPin,LOW);
  int distance=pulseIn(inputPin,HIGH);
  distance=distance/58;
  Serial.write(distance);
  delay(50);
  if(distance<5){
    digitalWrite(8,HIGH);
    delay(500);
    digitalWrite(8,LOW);
  }
  }

  
