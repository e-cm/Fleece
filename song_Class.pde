
public class Song {

  private String name;
  private visualPackage[] vps;
  private int packageSelection;
  
  Song(String _name, visualPackage[] _vps) {
    name = _name;
    vps = _vps;
    packageSelection = 0;
  }
  
  void start() {
    packageSelection = 0;
    loadPackage(vps[packageSelection]);
  }
  
  void display() {
    vps[packageSelection].display();
  }
  
  void next() {
    do {
      packageSelection = ((packageSelection + 1) % vps.length);
    } while (vps[packageSelection] == null);     
    loadPackage(vps[packageSelection]);
  }

}
