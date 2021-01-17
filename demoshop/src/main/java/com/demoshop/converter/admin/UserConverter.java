package com.demoshop.converter.admin;

import org.springframework.stereotype.Component;

import com.demoshop.dto.MyUserLogin;
import com.demoshop.dto.UserDTO;
import com.demoshop.entities.UserEntity;
@Component
public class UserConverter {

	public UserDTO toDto(UserEntity entity) {
		UserDTO user = new UserDTO();
		user.setId(entity.getId());
		user.setUsername(entity.getUsername());
		user.setPassword(entity.getPassword());
		user.setFullname(entity.getFullname());
		user.setAddress(entity.getAddress());
		user.setTelephoneNumber(entity.getTelephoneNumber());
		
		return user;
	}

	public UserDTO toDto(MyUserLogin myUser) {
		UserDTO user = new UserDTO();
		user.setId(myUser.getId());
		user.setUsername(myUser.getUsername());
		user.setPassword(myUser.getPassword());
		user.setFullname(myUser.getFullname());
		user.setAddress(myUser.getAddress());
		user.setTelephoneNumber(myUser.getTelephoneNumber());
		return user;
	}

	public UserEntity toEntity(UserEntity result, UserDTO dto) {
		result.setId(dto.getId());
		result.setFullname(dto.getFullname());
		result.setAddress(dto.getAddress());
		result.setTelephoneNumber(dto.getTelephoneNumber());
		return result;
	}

	public UserEntity toEntity(UserDTO dto) {
		UserEntity user = new UserEntity();
		user.setId(dto.getId());
		user.setUsername(dto.getUsername());
		user.setPassword(dto.getPassword());
		user.setFullname(dto.getFullname());
		user.setAddress(dto.getAddress());
		user.setTelephoneNumber(dto.getTelephoneNumber());
		
		return user;
	}

}
