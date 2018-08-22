package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

/* 디비와 직접적으로 연동하는 클래스 */
public class BoardDAO {
	// 디비 연동과 쿼리문 수행을 위한 클래스의 참조변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet re = null;
	private String sql = null;

	public BoardDAO() { // 생성자
		/* 커넥션 풀 설정 */
		try {
			DBConnection db = new DBConnection();
			con = db.con;
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/* db 작업에 필요한 내용을 메소드 단위로 작성 */
	/* 게시물 목록 보기 */
	public List<BoardBean> getBoardList() {
		// java.util 패키지의 List 컬렉션 임포트
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		// List 컬렉션에 제네릭(BoardBean 타입)을 적용하여 객체 생성
		try {
			sql = "select * from board order by board_no desc";
			pstmt = con.prepareStatement(sql);
			re = pstmt.executeQuery(); // select문 실행
			while (re.next()) { // 레코드가 존재하면 반복수행
				BoardBean board = new BoardBean();
				// 실제 db를 대상으로 게시물 번호를 가져와서
				// 자바빈의 Setter()메소드로 값을 지정한다.
				board.setBoard_no(re.getInt("board_no"));
				board.setBoard_name(re.getString("board_name"));
				board.setBoard_title(re.getString("board_title"));
				board.setBoard_cont(re.getString("board_cont"));
				board.setBoard_pwd(re.getString("board_pwd"));
				board.setBoard_hit(re.getInt("board_hit"));
				board.setBoard_regdate(re.getString("board_regdate"));
				// 7개의 필드를 db에서 가져온 후 java bean으로 레코드를 구성했음
				// DTO가 완성됨

				// 컬렉션에 요소로 레코드를 추가한다.
				boardList.add(board); // 첫번째 레코드 추가했음
			}
			re.close();	pstmt.close();	con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	public int insertBoard(BoardBean bean) {
		int re = 0;
		try {
			sql = "insert into board "
					+ " values(board_seq.nextval,?,?,?,?,default, sysdate)";
			pstmt = con.prepareStatement(sql); // sql문 선행 처리
			pstmt.setString(1, bean.getBoard_name()); // 첫번째 물음표에 글쓴이 배정
			pstmt.setString(2, bean.getBoard_title()); // 두번째 물음표에 글제목 배정
			pstmt.setString(3, bean.getBoard_cont()); // 세번째 물음표에 글내용 배정
			pstmt.setString(4, bean.getBoard_pwd()); // 네번째 물음표에 비밀번호 배정

			re = pstmt.executeUpdate();
			// 열린 객체를 닫는다.
			pstmt.close();	con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	// 조회수 증가 메서드
	public void boardHit(int no) {
		try{
			sql="update board set "
		 + " board_hit=board_hit+1 where board_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();// update문 실행
			pstmt.close(); //con.close(); 
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	/* 게시물 내용보기 */
	public BoardBean getCont(int no) {
		BoardBean bean = new BoardBean(); // DTO객체
		try{
			sql="select * from board where board_no=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, no);
			re = pstmt.executeQuery(); //select문 실행
			if(re.next()){ // 레코드가 있으면
				bean.setBoard_no(re.getInt("board_no"));
				bean.setBoard_name(re.getString("board_name"));
				bean.setBoard_title(re.getString("board_title"));
				bean.setBoard_cont(re.getString("board_cont"));
				bean.setBoard_pwd(re.getString("board_pwd"));
				bean.setBoard_hit(re.getInt("board_hit"));
				bean.setBoard_regdate(re.getString("board_regdate"));
				pstmt.close(); con.close(); re.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bean; // 빈에 저장된 객체를 리턴
	}
	/* 게시물 내용 수정 */
	public void boardEdit(BoardBean bean) {
		try{
			// 게시물에 해당하는 레코드 수정
			sql="update board set board_name=?, " +
		        " board_title=?, board_cont=? " +
				" where board_no=?";	
			pstmt = con.prepareStatement(sql);
			// 각 물음표에 값을 배정한다.
			pstmt.setString(1,bean.getBoard_name());
			pstmt.setString(2,bean.getBoard_title());
			pstmt.setString(3,bean.getBoard_cont());
			pstmt.setInt(4, bean.getBoard_no());
			pstmt.executeUpdate(); //update문 실행
			pstmt.close(); con.close();			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/* 게시물 내용 삭제 */
	public void deleteBoard(int no) {
		// 매개변수 글번호(no)를 받아서 해당하는 레코드를 삭제한다.
		try {			
			sql = "delete from board where board_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();	con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/* 게시물 검색 */
	public List<BoardBean> findBoard(String find_name, String find_field) {
		List<BoardBean> list = new
				   ArrayList<BoardBean>();		
		if(find_field.equals("board_title")){
			try{
				sql="select * from board where board_title like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+find_name+"%");
				re = pstmt.executeQuery();
				while(re.next()){
					BoardBean bean = new BoardBean();
					bean.setBoard_no(re.getInt("board_no"));
					bean.setBoard_name(re.getString("board_name"));
					bean.setBoard_title(re.getString("board_title"));
					bean.setBoard_cont(re.getString("board_cont"));
					bean.setBoard_pwd(re.getString("board_pwd"));
					bean.setBoard_hit(re.getInt("board_hit"));
					bean.setBoard_regdate(re.getString("board_regdate"));
					list.add(bean);				
				}
				con.close(); pstmt.close(); re.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			try{
				sql="select * from board where board_cont like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+find_name+"%");
				re = pstmt.executeQuery();
				while(re.next()){
					BoardBean bean = new BoardBean();
					bean.setBoard_no(re.getInt("board_no"));
					bean.setBoard_name(re.getString("board_name"));
					bean.setBoard_title(re.getString("board_title"));
					bean.setBoard_cont(re.getString("board_cont"));
					bean.setBoard_pwd(re.getString("board_pwd"));
					bean.setBoard_hit(re.getInt("board_hit"));
					bean.setBoard_regdate(re.getString("board_regdate"));
					list.add(bean);
				}	
				con.close(); pstmt.close(); re.close();			
			}catch(Exception e){
				e.printStackTrace();
			}
	   }
		return list;
	}
}	


