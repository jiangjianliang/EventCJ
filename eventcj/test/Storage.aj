package main;

import java.util.Iterator;
import eventcj.*;
aspect StorageDir{
	
	pointcut Activate_A((Storage s)): target(s) && call(void Storage.doSomething());
	
	after(Storage s): Activate_A(s){
		InstanceLayerManager lm=s.getLayerManager();
		lm.activate(s.createLayerForName("cacheLayer"));
	}
	
}public class Storage   implements Contextual{
	InstanceLayerManager __ecj_lm_=new DefaultInstanceLayerManager();
	public InstanceLayerManager getLayerManager(){return __ecj_lm_;}
	abstract class LayerForStorage extends Layer{
		void getItem(int key)
		{ }void getItemAfter(int key)
		{ }void getItemBefore(int key)
		{ }void doSomething()
		{ }void doSomethingAfter()
		{ }void doSomethingBefore()
		{ }
	}
	public Layer createLayerForName(String lname){
		if(lname.equals("cacheLayer")) return new cacheLayer(); else throw new NoSuchLayerException(lname,this.getClass());
	}
	class cacheLayer extends LayerForStorage{
		public String getName(){return "cacheLayer";}
		void getItemAround(int key)
		{ 
		  System.out.println("Cache Lookup");
		}
	}
	void getItem(int key)
	{ 
	  getItemBefore(key);
	  try
	  { 
	    System.out.println("Disk Lookup");
	  }
	  finally
	  { 
	    getItemAfter(key);
	  }
	}void doSomething()
	{ 
	  doSomethingBefore();
	  try
	  { }
	  finally
	  { 
	    doSomethingAfter();
	  }
	}public static void main(String[] args)
	{ 
	  Storage s = new Storage();
	  s.getItem(10);
	  s.doSomething();
	  s.getItem(10);
	}
	void getItemBefore(int key){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForStorage l = (LayerForStorage)it.next();
		l.getItemBefore(key);
	}
	}
	void getItemAfter(int key){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForStorage l = (LayerForStorage)it.next();
			l.getItemAfter(key);
		}
	}
	void doSomethingBefore(){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForStorage l = (LayerForStorage)it.next();
		l.doSomethingBefore();
	}
	}
	void doSomethingAfter(){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForStorage l = (LayerForStorage)it.next();
			l.doSomethingAfter();
		}
	}
	
}
