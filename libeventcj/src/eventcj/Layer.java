package eventcj;


public abstract class Layer {
	
	public abstract void activate();
	public abstract void deactivate();
	//featured by wander
	public abstract void pause();
	public abstract void restore();
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
