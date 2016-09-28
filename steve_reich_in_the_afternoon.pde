
Message message;

PFont mono;
PGraphics display;

void setup() {
  size(550,700);
  mono = loadFont("Monospaced-48.vlw");
  textFont(mono);
  message = new Message("steve reich in the", "afternoon");
  display = createGraphics(width-20, height-20);
  display.textAlign(LEFT, TOP);
  background(30);
  frameRate(10);
}

void draw() {
  message.update();
  display.beginDraw();
  display.textFont(mono);
  display.background(30);
  display.fill(255, 30, 30, 204);
  display.text(message.toString(), 0, 0);
  display.endDraw();
  image(display,10,10);
}