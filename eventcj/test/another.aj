package main;

import java.util.Iterator;
import eventcj.*;
 class Navigation  extends MapActivity implements Contextual, Runnable, LocationListener{
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
		throw new NoSuchLayerException(lname,this.getClass());
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
