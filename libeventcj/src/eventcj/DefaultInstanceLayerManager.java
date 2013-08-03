package eventcj;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Iterator;

public class DefaultInstanceLayerManager extends InstanceLayerManager {
	Deque<Layer> activeLayers;
	public DefaultInstanceLayerManager(){
		init();
	}
	protected void init(){
		activeLayers=new ArrayDeque<Layer>();
	}
	@Override
	public InstanceLayerManager activate(Layer l) {
		l.activate();
		removeLayer(l.getName(), activeLayers, false);
		activeLayers.add(l);
		return this;
	}
	
	private void removeLayer(String lname, Deque<Layer> ld, boolean deactivate){
		Iterator<Layer> it = ld.iterator();
		while(it.hasNext()){
			Layer l = it.next();
			if(l.getName().equals(lname)){
				if(deactivate) l.deactivate();
				it.remove();
				return;
			}
		}
	}
	
	@Override
	public InstanceLayerManager deactivate(String lname) {
		removeLayer(lname,activeLayers,true);
		return this;
	}

	@Override
	public boolean isActive(String lname) {
		for(Layer l:activeLayers){
			if(l.getName().equals(lname)) return true;
		}
		return false;
	}
	
	@Override
	public DefaultInstanceLayerManager deactivateAll(){
		Iterator<Layer> it = activeLayers.iterator();
		while(it.hasNext()){
			Layer l = it.next();
			l.deactivate();
			it.remove();
		}
		return this;
	}
	@Override
	public Iterator<Layer> iterator() {
		return activeLayers.iterator();
	}
	@Override
	public Iterator<Layer> reverseIterator() {
		return activeLayers.descendingIterator();
	}
}
