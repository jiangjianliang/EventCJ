package eventcj;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public abstract class InstanceLayerManager {
	public abstract InstanceLayerManager activate(Layer l);
	public abstract InstanceLayerManager deactivate(String l);
	public abstract boolean isActive(String l);
	public abstract InstanceLayerManager deactivateAll();
	public abstract Iterator<Layer> iterator();
	public abstract Iterator<Layer> reverseIterator();
	public final void end(){}
	//featured by wander
	public abstract InstanceLayerManager pause(String l);
	public abstract InstanceLayerManager restore(Layer l);
	private Map<String, Object> map = new HashMap<String, Object>();
	public void put(String name, Object obj){
		map.put(name, obj);
	}
	public Object get(String name){
		Object obj = map.get(name);
		return obj;
	}
	//end
}
