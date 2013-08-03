package eventcj;

import java.util.Iterator;

public abstract class LayerManager{
	public abstract LayerManager activate(String l);
	public abstract LayerManager deactivate(String l);
	public abstract LayerManager activate(String l, Contextual o);
	public abstract LayerManager deactivate(String l, Contextual o);
	public abstract boolean isActive(String l);
	public abstract boolean isActive(String l, Contextual o);
	public abstract Iterator<Layer> getLayersActiveOrder(Contextual o);
	public abstract Iterator<Layer> getLayersReverseActiveOrder(Contextual o);
	public abstract LayerManager deactivateAll(Contextual o);
	public LayerManager ifActive(String l){
		if(isActive(l))
			return this;
		else
			return new NullLayerManager();
	}
	public LayerManager ifNotActive(String l){
		if(!isActive(l))
			return this;
		else
			return new NullLayerManager();
	}
	public LayerManager ifActive(String l, Contextual o){
		if(isActive(l,o))
			return this;
		else
			return new NullLayerManager();
	}
	public LayerManager ifNotActive(String l, Contextual o){
		if(!isActive(l,o))
			return this;
		else
			return new NullLayerManager();
	}
	public LayerManager or(LayerManager lm){
		return new NullLayerManager();
	}
	public final void end(){}
}
