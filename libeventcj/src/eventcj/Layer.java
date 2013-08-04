package eventcj;

import java.util.HashMap;
import java.util.Map;

public abstract class Layer {
	private Map<String, Object> map = new HashMap<String, Object>();
	public abstract void activate();
	public abstract void deactivate();
	//featured by wander
	public abstract void pause();
	public abstract void restore();
	public void put(String name, Object obj){
		map.put(name, obj);
	}
	public Object get(String name){
		Object obj = map.get(name);
		return obj;
	}
	//end
	public abstract String getName();
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Layer) {
			Layer l = (Layer) obj;
			return getName().equals(l.getName());
		}else
			return false;
	}
	@Override
	public int hashCode() {
		return getName().hashCode();
	}
	
}
