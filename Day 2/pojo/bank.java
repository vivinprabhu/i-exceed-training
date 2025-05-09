class bank {
	String bankName, ifsc, balance;
	bank(String bankName, String ifsc, String balance) {
		this.bankName = bankName;
		this.ifsc = ifsc;
		this.balance = balance;
	}
	
	public void displayBankDetails() {
		System.out.println(bankName + " " + ifsc + " " + balance);
	}
}