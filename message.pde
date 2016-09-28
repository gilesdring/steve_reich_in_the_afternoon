class Message {
  String header;
  String repeater;
  String origRepeater;
  int maxRepeats = 20;
  String message;

  Message(String header, String repeater) {
    this.header = header;
    this.repeater = repeater;
    this.origRepeater = repeater;
    this.message = "";
  }
  private String wrapMessage(int lineLength) {
    String output = "";
    
    int lines = ceil(this.message.length() / lineLength ); 
    for ( int i = 0; i <= lines; i++) {
      output += this.message.substring(i*lineLength, min(this.message.length(), ((i+1)*lineLength))) + "\n";
    }
    return output;
  }
  private void rotate() {
    String or = this.repeater;
    this.repeater = or.substring(1) + or.substring(0, 1);
  }
  public String toString() {
    return header + "\n" + wrapMessage(this.header.length());
  }
  int whereAmI() {
    return this.message.length() % repeater.length();    
  }
  private void update() { //<>//
    this.message += this.repeater.substring(this.whereAmI(), this.whereAmI()+1);
    if ( this.whereAmI() == 0 ) this.rotate(); 
    if ( this.message.length() > maxRepeats*repeater.length() ) {
      this.message = "";
      this.repeater = this.origRepeater;
    }
  }
}