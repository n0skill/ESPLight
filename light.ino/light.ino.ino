#include <ArduinoJson.h>
#include <Adafruit_NeoPixel.h>
#include <ESP8266WiFi.h>

#define NUM_PIXELS 7
const char* ssid        = "CHANGETHISTOYOURSSID";
const char* password    = "CHANGETHISTOYOURPASSWORD";
const char* host        = "CHANGETHISTOYOURHOST";
const char* fingerprint = "CHANGETHISTOYOURCERTFINGERPRINT";
const int httpsPort     = 443; // For HTTPS
Adafruit_NeoPixel pixels(NUM_PIXELS, D6, NEO_GRB | NEO_KHZ800);
WiFiClientSecure client;

void setup() {  
  pixels.begin();
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(100);
    Serial.print(".");
  }
  Serial.println("WiFi connected");  
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.print("connecting to ");
  Serial.println(host);
  if (!client.connect(host, httpsPort)) {
    Serial.println("connection failed initially");
    return;
  }

  if (client.verify(fingerprint, host)) {
    Serial.println("certificate matches");
  } else {
    Serial.println("certificate doesn't match");
  }

  String url = "/light?id=M";
  Serial.print("requesting URL: ");
  Serial.println(url);
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "User-Agent: Noskills lights\r\n" +
               "Connection: close\r\n\r\n");
  Serial.println("request sent");
  while (client.connected()) {
    while(client.available())
      {
        char c = client.read();
        Serial.write(c);
      }
  }
}
void clear() {
  for(int i = 0; i < NUM_PIXELS; i ++) {
    pixels.setPixelColor(i, 0, 0, 0);
  }
}

void fade(int rs, int gs, int bs, int re, int ge, int be) {
  clear(); 
}


void quickp(int r, int g, int b, int nb) {
   clear();
   int amnt = 4;
   int inten = 0;
   for(int i = 0; i < 125; i++) {
     for(int j = 0; j <= nb; j++) {
      pixels.setPixelColor(j, inten*r/255, inten*g/255, inten*b/255);
     }
     pixels.show();
     inten = inten + amnt;
     if(inten <= 0 || inten >= 255) {
      amnt = -amnt;
     }
     delay(5);
   }  
}

void pulse(int r, int g, int b, int nb) {
   clear();
   int amnt = 2;
   int inten = 0;
   for(int i = 0; i < 254; i++)
   {
     inten = inten + amnt;
     if(inten <= 0 || inten >= 254)
     {
      amnt = -amnt;
     }
     
     for(int j = 0; j <= nb; j++)
     {
      pixels.setPixelColor(j, inten*r/255, inten*g/255, inten*b/255);
     }
     pixels.show();
     
     delay(5);
   }  
}


void solid_color(int r, int g, int b, int nb)
{
  clear();
  for(int i = 0; i <= nb; i++)
  {
    pixels.setPixelColor(i, r, g, b);
  }
  pixels.show();
  delay(1500);
}


/* Sets all the leds at once */
void setColor(uint32_t color) {
  for (int i = 0; i < NUM_PIXELS; i++) {
    pixels.setPixelColor(i, color);
  }
  pixels.show();
}

void hex_to_255(char* hex){
  
  }

String get_light_status()
{
  String r;
  String val;
  if (!client.connect(host, httpsPort)) {
    Serial.println("connection failed");
    return "";
  }
  if (client.verify(fingerprint, host)) {
    Serial.println("certificate matches");
  } else {
    Serial.println("certificate doesn't match");
  }

  String url = "/light?id=M";
  Serial.print("requesting URL: ");
  Serial.println(url);
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "User-Agent: ESPLight\r\n" +
               "Connection: close\r\n\r\n");
  Serial.println("request sent");
  while (client.connected()) {
    while(client.available())
      {
        char c=client.read();
        r = r+c;
      }
  } 
  Serial.println("Finished reading");
  val = r.substring(157,163);
  Serial.println(val);
  return val;
}
int get_red_from_hex(String hex)
{
  int number = (int) strtol( &hex[0], NULL, 16);
  // Split them up into r, g, b values
  int red = number >> 16;
  return red;
}
int get_green_from_hex(String hex)
{
  int number = (int) strtol( &hex[0], NULL, 16);
  int g = number >> 8 & 0xFF;
  return g;
}
int get_blue_from_hex(String hex)
{
  int number = (int) strtol( &hex[0], NULL, 16);
  int b = number & 0xFF;
  return b;
}

String hex = "";
void loop() {
    String r = get_light_status();
    if(r.length() == 0) {
      hex = hex;
    } else {
      hex = r;
    }
   
    int red = get_red_from_hex(hex);
    int green = get_green_from_hex(hex);
    int blue = get_blue_from_hex(hex);
    pulse(red, green, blue, 1);
    delay(2000);
}
