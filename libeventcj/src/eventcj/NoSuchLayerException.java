package eventcj;

public class NoSuchLayerException extends RuntimeException {
	String lname;
	Class<?> thisClass;
	public NoSuchLayerException(String lname, Class<?> thisClass){
		this.lname = lname;
		this.thisClass = thisClass;
	}
	@Override
	public String getMessage() {
		return "Layer " + lname + " is not defined in " + thisClass;
	}
}
