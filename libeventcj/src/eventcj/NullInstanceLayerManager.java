package eventcj;

import java.util.Iterator;

public class NullInstanceLayerManager extends InstanceLayerManager {

	@Override
	public InstanceLayerManager activate(Layer l) {
		return this;
	}

	@Override
	public InstanceLayerManager deactivate(String l) {
		return this;
	}

	@Override
	public InstanceLayerManager deactivateAll() {
		return this;
	}

	@Override
	public boolean isActive(String l) {
		return false;
	}

	@Override
	public Iterator<Layer> iterator() {
		return null;
	}

	@Override
	public Iterator<Layer> reverseIterator() {
		return null;
	}
	

}
