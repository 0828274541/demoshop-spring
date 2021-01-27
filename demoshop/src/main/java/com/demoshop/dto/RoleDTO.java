package com.demoshop.dto;

import java.util.List;

public class RoleDTO extends AbstractDTO<RoleDTO> {

	private String name;

	private List<UserDTO> userList;
	private List<RoleDTO> roleList;

	public List<RoleDTO> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<RoleDTO> roleList) {
		this.roleList = roleList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<UserDTO> getUserList() {
		return userList;
	}

	public void setUserList(List<UserDTO> userList) {
		this.userList = userList;
	}

}
