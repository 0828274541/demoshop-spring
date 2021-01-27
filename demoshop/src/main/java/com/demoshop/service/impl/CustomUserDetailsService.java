package com.demoshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.demoshop.constant.SystemConstant;
import com.demoshop.converter.RoleConverter;
import com.demoshop.converter.UserConverter;
import com.demoshop.dto.MyUserLogin;
import com.demoshop.dto.RoleDTO;
import com.demoshop.dto.UserDTO;
import com.demoshop.entities.RoleEntity;
import com.demoshop.entities.UserEntity;
import com.demoshop.repository.UserRepository;
import com.demoshop.service.IUserService;

@Service
public class CustomUserDetailsService implements UserDetailsService, IUserService {
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserConverter userConverter;
	@Autowired
	private RoleConverter roleConverter;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUsernameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RoleEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		
		MyUserLogin myUser = new MyUserLogin(userEntity.getUsername(), userEntity.getPassword(), 
				enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		myUser.setId(userEntity.getId());
		myUser.setFullname(userEntity.getFullname());
		myUser.setAddress(userEntity.getAddress());
		myUser.setTelephoneNumber(userEntity.getTelephoneNumber());
		return myUser;
	}

	@Override
	public List<UserDTO> findByIdNotLike(long id) {
		List<UserDTO> userList= new ArrayList<>();
		List<UserEntity> entities = userRepository.findByIdNotLike(id);

		for (UserEntity item : entities) {
			UserDTO userDTO = userConverter.toDto(item);
			List<RoleDTO> roleList= new ArrayList<>();
			for(RoleEntity role : item.getRoles()) {
				RoleDTO roleDTO = roleConverter.toDto(role);
				roleList.add(roleDTO);
				userDTO.setRoleUserList(roleList);
			}
			userList.add(userDTO);
		}
		return userList;
	}

	@Override
	public UserDTO update(UserDTO dto) {
		UserDTO model = new UserDTO();
		UserEntity editUser = userRepository.findOne(dto.getId());
		editUser = userConverter.toEntity(editUser, dto);
		model = userConverter.toDto(userRepository.save(editUser));
		return model;
	}

	@Override
	public UserDTO findOne(long idUser) {
		UserDTO model = new UserDTO();
		UserEntity entity = userRepository.findOne(idUser);
		model = userConverter.toDto(entity);
		return model;
	}

	@Override
	public UserDTO findByName(String name) {
		UserEntity entity = userRepository.findByUsername(name);
		return userConverter.toDto(entity);
	}

	@Override
	public UserDTO add(UserDTO dto) {
		UserDTO model = new UserDTO();
	

		List<UserDTO> list = findByStatus(SystemConstant.ACTIVE_STATUS);
		for (UserDTO userDTO : list) {
			if (dto.getUsername().equals(userDTO.getUsername())) {
				dto.setMessage("Tên tài khoản đã tồn tại");
				return dto;
			}

		}
		if(!dto.getPassword().equals(dto.getRepassword())) {
			dto.setMessage("Mật khẩu xác nhận chưa đúng");
			return dto;
		}
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		dto.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
		UserEntity newUser = userConverter.toEntity(dto);
		newUser.setStatus(SystemConstant.ACTIVE_STATUS);
		List<RoleEntity> roleList = new ArrayList<>();
		RoleEntity roleEntity = new RoleEntity();
		roleEntity.setName(SystemConstant.ROLE_USER);
		roleList.add(roleEntity);
		newUser.setRoles(roleList);
		model = userConverter.toDto(userRepository.save(newUser));
	
		model.setBooReturn(true);
		return model; 
	}


	private List<UserDTO> findByStatus(int status) {
		List<UserDTO> models = new ArrayList<>();
		List<UserEntity> entities = userRepository.findByStatus(status);
		for (UserEntity item : entities) {
			UserDTO userDTO = userConverter.toDto(item);
			models.add(userDTO);
		}

		return models;
	}

	@Override
	public int getTotalItem() {
		
		return (int)userRepository.countByStatus(1);
	}

}
