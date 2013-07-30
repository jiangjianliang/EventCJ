package main;

import java.util.Iterator;
import eventcj.*;
aspect SwitchPositionDevice{
	
	pointcut GPSEvent_A(Navigation n, int s): target(n) && call(void Navigation.onStatusChanged(s));pointcut WifiEvent_B(Navigation n, int s): target(n) && call(void Navigation.onStatusChanged(s));
	
	pointcut Boarding_A(): call(void *.cabinModeEntered());
	pointcut Arriving_A(): call(void *.cabinModeExit());
	
	after(Navigation n, int s): GPSEvent_A(n, s){
		InstanceLayerManager lm=n.getLayerManager();
		if(lm.isActive("WifiNavi"))lm.deactivate("WifiNavi").activate(n.createLayerForName("GPSNavi"));
		else if(!lm.isActive("onBoard"))lm.activate(n.createLayerForName("GPSNavi"));
		else lm.deactivateAll().activate(n.createLayerForName("GPSNavi"));
	}
	before(Navigation n, int s): WifiEvent_B(n, s){
		InstanceLayerManager lm=n.getLayerManager();
		if(lm.isActive("GPSNavi"))lm.deactivate("GPSNavi").activate(n.createLayerForName("WifiNavi"));
		else if(!lm.isActive("onBoard"))lm.activate(n.createLayerForName("WifiNavi"));
	}
	
	
	after(): Boarding_A(){
		LayerManager lm=LayerManager.getInstance();
		lm.deactivateAll().activate("OnBoard");
	}
	
	after(): Arriving_A(){
		LayerManager lm=LayerManager.getInstance();
		if(lm.isActive("OnBoard"))lm.deactivate("OnBoard").end();
	}
	
} class Navigation  extends MapActivity implements Contextual, Runnable, LocationListener{
	InstanceLayerManager __ecj_lm_=new DefaultInstanceLayerManager();
	public InstanceLayerManager getLayerManager(){return __ecj_lm_;}
	abstract class LayerForNavigation extends Layer{
		void onStatusChanged()
		{ }void onStatusChangedAfter()
		{ }void onStatusChangedBefore()
		{ }void run()
		{ }void runAfter()
		{ }void runBefore()
		{ }void onCreate(Bundle status)
		{ }void onCreateAfter(Bundle status)
		{ }void onCreateBefore(Bundle status)
		{ }
	}
	public Layer createLayerForName(String lname){
		if(lname.equals("GPSNavi")) return new GPSNavi(); else if(lname.equals("WifiNavi")) return new WifiNavi(); else throw new NoSuchLayerException(lname,this.getClass());
	}
	class GPSNavi extends LayerForNavigation{
		public String getName(){return "GPSNavi";}
		public void activate(){ 
		                        overlay.onProviderEnabled("gps");
		                      }
		public void deactivate(){ 
		                          overlay.onProviderDisabled("gps");
		                        }
		void runAfter()
		{ 
		  Location loc = overlay.getMyLocation();
		  mapView.getController().animateTo(loc);
		}
	}class WifiNavi extends LayerForNavigation{
		public String getName(){return "WifiNavi";}
		public void activate(){ 
		                        overlay.onProviderEnabled("Network");
		                        wifiManager.setWifiEnable(true);
		                      }
		public void deactivate(){ 
		                          overlay.onProviderDisabled("Network");
		                          wifiManager.setWifiEnable(false);
		                        }
		void runAfter()
		{ 
		  Location loc = overlay.getMyLocation();
		  buildingGuide.updateFloorPlan(loc);
		}
	}
	MapView mapView;MyLocationOverlay overlay;WifiManager wifiManager;BuildingGuide buildingGuide;void onStatusChanged()
	{ 
	  onStatusChangedBefore();
	  try
	  { }
	  finally
	  { 
	    onStatusChangedAfter();
	  }
	}void run()
	{ 
	  runBefore();
	  try
	  { }
	  finally
	  { 
	    runAfter();
	  }
	}void onCreate(Bundle status)
	{ 
	  onCreateBefore(status);
	  try
	  { 
	    overlay.runOnFirstFix(this);
	  }
	  finally
	  { 
	    onCreateAfter(status);
	  }
	}
	void onStatusChangedBefore(){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForNavigation l = (LayerForNavigation)it.next();
		l.onStatusChangedBefore();
	}
	}
	void onStatusChangedAfter(){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForNavigation l = (LayerForNavigation)it.next();
			l.onStatusChangedAfter();
		}
	}
	void runBefore(){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForNavigation l = (LayerForNavigation)it.next();
		l.runBefore();
	}
	}
	void runAfter(){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForNavigation l = (LayerForNavigation)it.next();
			l.runAfter();
		}
	}
	void onCreateBefore(Bundle status){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForNavigation l = (LayerForNavigation)it.next();
		l.onCreateBefore(status);
	}
	}
	void onCreateAfter(Bundle status){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForNavigation l = (LayerForNavigation)it.next();
			l.onCreateAfter(status);
		}
	}
	
}
