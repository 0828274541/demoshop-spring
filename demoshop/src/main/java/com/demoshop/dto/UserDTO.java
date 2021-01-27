package com.demoshop.dto;

import java.util.List;

public class UserDTO extends AbstractDTO<UserDTO> {

	private String username;
	private String password;
	private String repassword;
	private String fullname;
	private String address;
	private int telephoneNumber;
	private List<String> roleUserLoginList;
	private List<RoleDTO> roleUserList;

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public List<String> getRoleUserLoginList() {
		return roleUserLoginList;
	}

	public void setRoleUserLoginList(List<String> roleUserLoginList) {
		this.roleUserLoginList = roleUserLoginList;
	}

	public List<RoleDTO> getRoleUserList() {
		return roleUserList;
	}

	public void setRoleUserList(List<RoleDTO> roleUserList) {
		this.roleUserList = roleUserList;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(int telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

}
