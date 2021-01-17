package com.demoshop.converter.admin;

import org.springframework.stereotype.Component;

import com.demoshop.dto.RoleDTO;
import com.demoshop.entities.RoleEntity;

@Component
public class RoleConverter {


	public RoleDTO toDto(RoleEntity entity) {
		RoleDTO roleDTO = new RoleDTO();
		roleDTO.setId(entity.getId());
		roleDTO.setName(entity.getName());
		return roleDTO;
	}

}
