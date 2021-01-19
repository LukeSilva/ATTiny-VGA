
#define CHAR_A 0
#define CHAR_B 1
#define CHAR_C 2
int led = 6;
int asdf=1;
void resetbyte()
{  
}
void sendbit(int bittosend)
{
  if (bittosend!=0)
     digitalWrite(2,HIGH);
  else digitalWrite(2,LOW);
  while (digitalRead(5)==LOW)
  {
  }
  //VGA is ready for bit, pulse the data ready lines
  digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)
  digitalWrite(led, LOW);    // turn the LED off by making the voltage LOW
  delayMicroseconds(27);
}

void printchar(int charactero)
{
  // This rotation occurs because the input line on the ATTiny is not the LSB
  //  IE: the ATTiny does not begin by reading the LSB
  // Thus we need to rotate the character to send the correct bit first.
 int character = charactero << 6;
  character = character & 0xFF;
  character += charactero >> 2;
  digitalWrite(3,LOW);
    sendbit(character & 0x80);
    sendbit(character & 0x40);
    sendbit(character & 0x20);
    sendbit(character & 0x10);
    sendbit(character & 0x08);
    sendbit(character & 0x04);
    sendbit(character & 0x02);
    sendbit(character & 0x01);
  digitalWrite(3,HIGH);
}
void clearscreen()
{
   printchar(255);
   printchar(255);
    int i;
    for (i=0;i<=16*18;i++)
    {
       printchar(0);
    }
   printchar(255);
   printchar(255);
}
void printcharacter(char a)
{
   printchar(a-32);
}
void printstring(char a[])
{
    int i=0;
    char b = a[i];
    while (b!=0)
    {
      printcharacter(b);
      b = a[++i];
    }
}// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);     
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(5,INPUT);
  delay(1000);
   clearscreen();
  delay(1000);
}
// the loop routine runs over and over again forever:
void loop() { 
    //Set to top of display
    printchar(255);
    printstring("Hello, World!   ");
    printstring(">");
    if (asdf==1)
     printcharacter('~'+1);    
    else
      printcharacter(' ');
     asdf = asdf ? 0:1;
    delay(1000);
}
