package com.demoshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demoshop.entities.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUsernameAndStatus(String username, int status);

	List<UserEntity> findByIdNotLike(long id);
	
	UserEntity findByUsername(String name);

	List<UserEntity> findByStatus(int status);

	int countByStatus(int status);
}
