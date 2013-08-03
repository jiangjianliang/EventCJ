package eventcj;

import java.util.Iterator;

public abstract class InstanceLayerManager {
	public abstract InstanceLayerManager activate(Layer l);
	public abstract InstanceLayerManager deactivate(String l);
	public abstract boolean isActive(String l);
	public abstract InstanceLayerManager deactivateAll();
	public abstract Iterator<Layer> iterator();
	public abstract Iterator<Layer> reverseIterator();
	public final void end(){}
}
