package com.aia.dona.dao;

import java.util.List;

import com.aia.dona.domain.Post;
import com.aia.dona.domain.PostOnly;

public interface PostDao {
     // 게시물을 저장하는 메서드
	int insertPost(Post post);
     // 게시물 리스트를 가져오는 메서드
	List<Post> selectPostList();
	// 저장된 게시물의 idx를 반환하는 메서드
	int getDonaIdx();
	// 게시물 하나를 반환하는 메서드
	PostOnly selectPostDetail(int idx);
  
}
