package eventcj;

import java.util.Iterator;

public class NullLayerManager extends LayerManager {

	@Override
	public LayerManager activate(String l) {
		return this;
	}

	@Override
	public LayerManager activate(String l, Contextual o) {
		return this;
	}

	@Override
	public LayerManager deactivate(String l) {
		return this;
	}

	@Override
	public LayerManager deactivate(String l, Contextual o) {
		return this;
	}

	@Override
	public boolean isActive(String l) {
		return false;
	}

	@Override
	public boolean isActive(String l, Contextual o) {
		return false;
	}

	@Override
	public LayerManager or(LayerManager lm) {
		return lm;
	}

	@Override
	public LayerManager deactivateAll(Contextual o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator<Layer> getLayersActiveOrder(Contextual o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator<Layer> getLayersReverseActiveOrder(Contextual o) {
		// TODO Auto-generated method stub
		return null;
	}
}
