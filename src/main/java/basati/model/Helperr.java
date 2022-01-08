package basati.model;

import java.util.List;

public class Helperr {
	
private Resultst rst;

private List<Department> dps;

public Resultst getRst() {
	return rst;
}

public void setRst(Resultst rst) {
	this.rst = rst;
}

public List<Department> getDps() {
	return dps;
}

public void setDps(List<Department> dps) {
	this.dps = dps;
}

public Helperr(Resultst rst, List<Department> dps) {
	super();
	this.rst = rst;
	this.dps = dps;
}

public Helperr() {
	super();
	// TODO Auto-generated constructor stub
}
	

}
