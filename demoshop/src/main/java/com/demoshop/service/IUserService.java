package com.demoshop.service;

import java.util.List;

import com.demoshop.dto.UserDTO;

public interface IUserService {

	List<UserDTO> findByIdNotLike(long id);

	UserDTO update(UserDTO modelUser);

	UserDTO findOne(long idUser);

	UserDTO findByName(String name);

	UserDTO add(UserDTO user);

	int getTotalItem();

}
