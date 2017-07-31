package com.bitschool.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.CompanyDTO;

@Repository
public class CompanyDAO implements ICompanyDAO {

	//----------------------------------------------- 설 정 -----------------------------------------------//
	
		// [맵핑]
		private static final String namespace = "com.bitschool.basic.MemberMapper";
			
		// [주입] Sqlsession > Mybatis 실행 객체
		@Inject
		private SqlSession session;
		
		// ----------------------------------------- [기업회원] 회 원 가 입 -----------------------------------------//
		
		// [기업회원] 회원가입 - 1+2단계 입력 	
		
		@Override
			public boolean companyRegist(CompanyDTO cdto) {
				boolean flag = false;
				
			
				int aCnt = session.insert(namespace+".insertCompanyRegist",cdto);
				
				if(aCnt>0){
					flag = true;
				}
				
				return flag;
			}

		// ----------------------------------------- [기업회원] 로그인 -----------------------------------------//	
			
		@Override
			public CompanyDTO selectCompanyLogin(String comId) throws SQLException {
			
				CompanyDTO cdto = null;
				
				cdto = session.selectOne(namespace+".selectCompanyLogin", comId);
				
				return cdto;
			}
		
		//기업회원아이디찾기
		@Override
		public CompanyDTO findComId(String comEmail) throws SQLException {
			
			CompanyDTO cdto = null;
			
			cdto=(CompanyDTO) session.selectOne(namespace+".findComId", comEmail);
			
			
			return cdto;
		}

		@Override
		public CompanyDTO comfindPW(String comId) {

			CompanyDTO cdto = null;
					
			cdto = (CompanyDTO)session.selectOne(namespace+".comfindPW", comId);
			
			return cdto;
		}

}
