package main;

import java.util.Iterator;
import eventcj.*;
aspect Help{
	
	pointcut Er_A((Navigation n, Object o)): this(String [ ]) && target(o) && call(String [ ] Cc*.m(String [ ]));
	
	after(Navigation nObject o): Er_A(n, o){
		LayerManager lm=LayerManager.getInstance();
		if(lm.isActive("Layer1"))lm.deactivate("Layer1").activate("Layer2");
	}
	
}public class Test <T1, T2> extends String implements Contextual, I1, I2, I3{
	InstanceLayerManager __ecj_lm_=new DefaultInstanceLayerManager();
	public InstanceLayerManager getLayerManager(){return __ecj_lm_;}
	abstract class LayerForTest extends Layer{
		void m1(Object o)
		{ }void m1After(Object o)
		{ }void m1Before(Object o)
		{ }boolean m2()
		{ 
		  return false;
		}boolean m2After()
		{ 
		  return false;
		}boolean m2Before()
		{ 
		  return false;
		}
	}
	public Layer createLayerForName(String lname){
		if(lname.equals("L1")) return new L1(); else throw new NoSuchLayerException(lname,this.getClass());
	}
	class L1 extends LayerForTest{
		public String getName(){return "L1";}
		
		public void restore(){ 
		                       foo();
		                     }
		
		public void pause(){ 
		                     bar();
		                   }
		void m1After(Object o)
		{ }
	}
	void m1(Object o)
	{ 
	  m1Before(o);
	  try
	  { }
	  finally
	  { 
	    m1After(o);
	  }
	}boolean m2()
	{ 
	  m2Before();
	  try
	  { 
	    return false;
	  }
	  finally
	  { 
	    m2After();
	  }
	}
	void m1Before(Object o){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForTest l = (LayerForTest)it.next();
		l.m1Before(o);
	}
	}
	void m1After(Object o){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForTest l = (LayerForTest)it.next();
			l.m1After(o);
		}
	}
	void m2Before(){
		Iterator<Layer> it = getLayerManager().iterator();
	while(it.hasNext()){
		LayerForTest l = (LayerForTest)it.next();
		l.m2Before();
	}
	}
	void m2After(){
			Iterator<Layer> it = getLayerManager().reverseIterator();
		while(it.hasNext()){
			LayerForTest l = (LayerForTest)it.next();
			l.m2After();
		}
	}
	
} class Test   implements Contextual{
	InstanceLayerManager __ecj_lm_=new DefaultInstanceLayerManager();
	public InstanceLayerManager getLayerManager(){return __ecj_lm_;}
	abstract class LayerForTest extends Layer{
		
	}
	public Layer createLayerForName(String lname){
		throw new NoSuchLayerException(lname,this.getClass());
	}
	
	static void m()
	{ }abstract void m();
	
}
