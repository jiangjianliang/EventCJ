package eventcj;

import java.util.Collections;
import java.util.Deque;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.LinkedBlockingDeque;

public final class DefaultLayerManager extends LayerManager {
	private static final DefaultLayerManager S = new DefaultLayerManager();

	public static DefaultLayerManager getInstance() {
		return S;
	}

	private static Map<Contextual, Deque<Layer>> createMap() {
		return new WeakHashMap<Contextual, Deque<Layer>>();
	}

	private static <T> Deque<T> createSet() {
		return new LinkedBlockingDeque<T>();
	}

	private Map<Contextual, Deque<Layer>> iActiveLayers = Collections.synchronizedMap(createMap());
	private Deque<String> gActiveLayers = createSet();

	@Override
	public LayerManager activate(String l) {
		gActiveLayers.add(l);
		for (Contextual key : iActiveLayers.keySet()) {
			iActiveLayers.get(key).add(key.createLayerForName(l));
		}
		return this;
	}

	@Override
	public LayerManager activate(String lname, Contextual o) {
		if (!iActiveLayers.containsKey(o)) {
			Deque<Layer> ls = createSet();
			for (String layername : gActiveLayers) {
				ls.add(o.createLayerForName(layername));
			}
			iActiveLayers.put(o, ls);
		}
		Layer l = o.createLayerForName(lname);
		Deque<Layer> ls = iActiveLayers.get(o);
		removeLayer(lname,ls);
		ls.add(l);
		l.activate();
		return this;
	}
	
	private void removeLayer(String lname, Deque<Layer> ld){
		Iterator<Layer> it = ld.iterator();
		while(it.hasNext()){
			Layer l = it.next();
			if(l.getName().equals(lname)){
				l.deactivate();
				it.remove();
				return;
			}
		}
	}

	@Override
	public LayerManager deactivate(String lname) {
		gActiveLayers.remove(lname);
		for (Deque<Layer> ls : iActiveLayers.values()){
			removeLayer(lname, ls);
		}
		return this;
	}

	@Override
	public LayerManager deactivateAll(Contextual o) {
		iActiveLayers.remove(o);
		return this;
	}

	@Override
	public LayerManager deactivate(String lname, Contextual o) {
		if(iActiveLayers.containsKey(o))
			removeLayer(lname, iActiveLayers.get(o));
		assert(!isActive(lname,o));
		return this;
	}

	@Override
	public boolean isActive(String lname) {
		return gActiveLayers.contains(lname);
	}

	@Override
	public Iterator<Layer> getLayersActiveOrder(Contextual o) {
		if(iActiveLayers.containsKey(o)) return iActiveLayers.get(o).iterator();
		else return Collections.EMPTY_LIST.iterator();
	}

	@Override
	public Iterator<Layer> getLayersReverseActiveOrder(Contextual o) {
		if(iActiveLayers.containsKey(o)) return iActiveLayers.get(o).descendingIterator();
		else return Collections.EMPTY_LIST.iterator();
	}

	@Override
	public boolean isActive(String lname, Contextual o) {
		if(iActiveLayers.containsKey(o)){
			for(Layer l:iActiveLayers.get(o)){
				if(l.getName().equals(lname)) return true;
			}
		}
		return false;
	}
}
