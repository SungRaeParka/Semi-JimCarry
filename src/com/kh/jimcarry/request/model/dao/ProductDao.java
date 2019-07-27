package com.kh.jimcarry.request.model.dao;

import static com.kh.jimcarry.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;

import com.kh.jimcarry.request.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();

	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/request/product-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertRequest(Connection con, Product r) {
		int result = 0;
		PreparedStatement pstmt = null;	

		String[] namerr = r.getProName().split(", ");
		String[] kindrr = r.getProKind().split(", ");

		String box = "";
		String books = "";
		String etc = "";

		for(int i = 0; i < namerr.length; i++) {
			System.out.println("namerr[i] ::::" + namerr[i]);
			System.out.println("kindrr[i] ::::" + kindrr[i]);
		}	

		for(int i = 0; i < namerr.length; i++) {
			if(!kindrr[i].equals("기타")) {
				if(i == 0) {
					String query = prop.getProperty("insertProduct");

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, kindrr[i]);
						pstmt.setString(2, namerr[i]);

						result = pstmt.executeUpdate();	

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}else if(i > 0) {
					String query = prop.getProperty("insertProduct2");

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, kindrr[i]);
						pstmt.setString(2, namerr[i]);

						result = pstmt.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}
			}else if(kindrr[i].equals("기타")) {
				if(namerr[i].equals("상자")) {
					String query = prop.getProperty("insertBox");

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, "기타");
						pstmt.setString(2, "상자");
						pstmt.setInt(3, r.getBoxCount());

						result = pstmt.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}else if(namerr[i].equals("책")) {
					String query = prop.getProperty("insertBook");

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, "기타");
						pstmt.setString(2, "책");
						pstmt.setInt(3, r.getBookCount());

						result = pstmt.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}
			}
		}			

		return result;
	}	

	public int insertBoxCount(Connection con, Product r) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertBox");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "기타");
			pstmt.setString(2, "상자");
			pstmt.setInt(3, r.getBoxCount());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}

	public int insertBookCount(Connection con, Product r) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertBook");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "기타");
			pstmt.setString(2, "책");
			pstmt.setInt(3, r.getBookCount());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}

	public String selectReqNo(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String reqNo = "";
		int reqNo2 = 0;
		Product p = new Product();


		String query = prop.getProperty("selectReqNo");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			if(rset.next()) {				
				reqNo = rset.getString("LAST_NUMBER");

				reqNo2 = Integer.parseInt(reqNo);

				reqNo = String.valueOf(reqNo2 - 1);

				p.setReqNo(reqNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return reqNo;
	}

	public String selectProNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		String proNo = "";

		String query = prop.getProperty("selectProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				proNo += rset.getString("PRODUCT_NO") + ",";
			}

			p = new Product();
			p.setProNo(proNo);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return proNo;
	}

	public String selectRefNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String refNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "냉장고");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				refNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return refNo;
	}

	public String selectWashNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String washNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "세탁기");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				washNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return washNo;
	}

	public String selectTvNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String tvNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "TV/모니터");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				tvNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return tvNo;
	}

	public String selectAirNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String airNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "에어컨");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				airNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return airNo;
	}

	public String selectWaterNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String waterNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "정수기");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				waterNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return waterNo;
	}

	public String selectPcNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String pcNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "PC/노트북");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				pcNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return pcNo;
	}

	public String selectOvenNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String ovenNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "전자레인지");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				ovenNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return ovenNo;
	}

	public String selectBedNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String bedNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "침대");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				bedNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return bedNo;
	}

	public String selectChairNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String chairNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "의자");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				chairNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return chairNo;
	}

	public String selectTableNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String tableNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "책상/테이블");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				tableNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return tableNo;
	}

	public String selectBcNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String bcNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "책장");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				bcNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return bcNo;
	}

	public String selectCloNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String cloNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "옷장");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				cloNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return cloNo;
	}

	public String selectScNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String scNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "진열장");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				scNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return scNo;
	}

	public String selectSofaNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sofaNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "쇼파");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				sofaNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return sofaNo;
	}

	public String selectHangNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String hangNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "행거");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				hangNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return hangNo;
	}

	public String selectMirNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String mirNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "거울");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				mirNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return mirNo;
	}

	public String selectMakeNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String makeNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "화장대");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				makeNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return makeNo;
	}

	public String selectPianoNo(Connection con, String reqNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String pianoNo = "";

		String query = prop.getProperty("selectDetailProNo");	

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "R"+reqNo);
			pstmt.setString(2, "피아노");

			rset = pstmt.executeQuery();

			while(rset.next()) {
				pianoNo += rset.getString("PRODUCT_NO") + ",";
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return pianoNo;
	}

	public int updateAll(Connection con, String reqNo, String[] proNamerr, String[] refTyperr, String[] refSizerr, String[] washTyperr,
			String[] washSizerr, String[] tvSizerr, String[] airTyperr, String[] airUnirr, String[] waterSizerr,
			String[] waterUnirr, String[] pcTyperr, String[] ovenTyperr, String[] bedTyperr, String[] bedSizerr,
			String[] chairTyperr, String[] tableTyperr, String[] tableSizerr, String[] tableMatrr,
			String[] tableWidthrr, String[] bcWidthrr, String[] bcHeightrr, String[] cloTyperr, String[] cloUnirr,
			String[] cloWidthrr, String[] scGckrr, String[] scWidthrr, String[] scHeightrr, String[] sofaSizerr,
			String[] hangTyperr, String[] hangWidthrr, String[] mirTyperr, String[] mirSizerr, String[] makeTyperr,
			String[] makeMatrr, String[] pianoTyperr, String refNo, String washNo, String tvNo, String airNo,
			String waterNo, String pcNo, String ovenNo, String bedNo, String chairNo, String tableNo, String bcNo,
			String cloNo, String scNo, String sofaNo, String hangNo, String mirNo, String makeNo, String pianoNo, String memo) {

		PreparedStatement pstmt = null;
		int result = 0;

		String[] refNorr = refNo.split(",");
		String[] washNorr = washNo.split(",");
		String[] tvNorr = tvNo.split(",");
		String[] airNorr = airNo.split(",");
		String[] waterNorr = waterNo.split(",");
		String[] pcNorr = pcNo.split(",");
		String[] ovenNorr = ovenNo.split(",");
		String[] bedNorr = bedNo.split(",");
		String[] chairNorr = chairNo.split(",");
		String[] tableNorr = tableNo.split(",");
		String[] bcNorr = bcNo.split(",");
		String[] cloNorr = cloNo.split(",");
		String[] scNorr = scNo.split(",");
		String[] sofaNorr = sofaNo.split(",");
		String[] hangNorr = hangNo.split(",");
		String[] mirNorr = mirNo.split(",");
		String[] makeNorr = makeNo.split(",");
		String[] pianoNorr = pianoNo.split(",");

		for(int j = 0; j < proNamerr.length; j++) {
			if(proNamerr[j].equals("냉장고")) {
				String query = prop.getProperty("updateRef");

				for(int i = 0; i < refNorr.length; i++) {
					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, refTyperr[i]);
						pstmt.setString(3, refSizerr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, "냉장고");
						pstmt.setString(6, refNorr[i]);

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}	
			}else if(proNamerr[j].equals("세탁기")) {
				String query = prop.getProperty("updateWash");

				for(int i = 0; i < washNorr.length; i++) {
					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, washTyperr[i]);
						pstmt.setString(3, washSizerr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, "세탁기");
						pstmt.setString(6, washNorr[i]);

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}
			}else if(proNamerr[j].equals("TV/모니터")) {
				String query = prop.getProperty("updateTv");

				for(int i = 0; i < tvNorr.length; i++) {
					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, tvSizerr[i]);
						pstmt.setString(3, "R"+reqNo);
						pstmt.setString(4, tvNorr[i]);
						pstmt.setString(5, "TV/모니터");					

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}
				}
			}else if(proNamerr[j].equals("에어컨")) {
				String query = prop.getProperty("updateAir");

				for(int i = 0; i < airNorr.length; i++) {				
					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, airTyperr[i]);
						pstmt.setString(3, airUnirr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, airNorr[i]);
						pstmt.setString(6, "에어컨");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("정수기")) {
				String query = prop.getProperty("updateWater");

				for(int i = 0; i < waterNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, waterSizerr[i]);
						pstmt.setString(3, waterUnirr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, waterNorr[i]);
						pstmt.setString(6, "정수기");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("PC/노트북")) {
				String query = prop.getProperty("updatePc");

				for(int i = 0; i < pcNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, pcTyperr[i]);
						pstmt.setString(3, "R"+reqNo);
						pstmt.setString(4, pcNorr[i]);
						pstmt.setString(5, "PC/노트북");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("전자레인지")) {
				String query = prop.getProperty("updateOven");

				for(int i = 0; i < ovenNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, ovenTyperr[i]);
						pstmt.setString(3, "R"+reqNo);
						pstmt.setString(4, ovenNorr[i]);
						pstmt.setString(5, "전자레인지");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("침대")) {
				String query = prop.getProperty("updateBed");

				for(int i = 0; i < bedNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, bedTyperr[i]);
						pstmt.setString(3, bedSizerr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, bedNorr[i]);
						pstmt.setString(6, "침대");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("의자")) {
				String query = prop.getProperty("updateChair");

				for(int i = 0; i < chairNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, chairTyperr[i]);
						pstmt.setString(3, "R"+reqNo);
						pstmt.setString(4, chairNorr[i]);
						pstmt.setString(5, "의자");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("책상/테이블")) {
				String query = prop.getProperty("updateTable");

				for(int i = 0; i < tableNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, tableTyperr[i]);
						pstmt.setString(3, tableSizerr[i]);
						pstmt.setString(4, tableMatrr[i]);
						pstmt.setString(5, tableWidthrr[i]);
						pstmt.setString(6, "R"+reqNo);
						pstmt.setString(7, tableNorr[i]);
						pstmt.setString(8, "책상/테이블");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("책장")) {
				String query = prop.getProperty("updateBc");

				for(int i = 0; i < bcNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, bcWidthrr[i]);
						pstmt.setString(3, bcHeightrr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, bcNorr[i]);
						pstmt.setString(6, "책장");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("옷장")) {
				String query = prop.getProperty("updateClo");

				for(int i = 0; i < cloNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, cloTyperr[i]);
						pstmt.setString(3, cloUnirr[i]);
						pstmt.setString(4, cloWidthrr[i]);
						pstmt.setString(5, "R"+reqNo);
						pstmt.setString(6, cloNorr[i]);
						pstmt.setString(7, "옷장");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("진열장")) {
				String query = prop.getProperty("updateSc");

				for(int i = 0; i < scNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, scWidthrr[i]);
						pstmt.setString(3, scHeightrr[i]);
						pstmt.setString(4, scGckrr[i]);
						pstmt.setString(5, "R"+reqNo);
						pstmt.setString(6, scNorr[i]);
						pstmt.setString(7, "진열장");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("쇼파")) {
				String query = prop.getProperty("updateSofa");

				for(int i = 0; i < sofaNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, sofaSizerr[i]);
						pstmt.setString(3, "R"+reqNo);
						pstmt.setString(4, sofaNorr[i]);
						pstmt.setString(5, "쇼파");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("행거")) {
				String query = prop.getProperty("updateHang");

				for(int i = 0; i < hangNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, hangTyperr[i]);
						pstmt.setString(3, hangWidthrr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, hangNorr[i]);
						pstmt.setString(6, "행거");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("거울")) {
				String query = prop.getProperty("updateMir");

				for(int i = 0; i < mirNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, mirTyperr[i]);
						pstmt.setString(3, mirSizerr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, mirNorr[i]);
						pstmt.setString(6, "거울");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("화장대")) {
				String query = prop.getProperty("updateMake");

				for(int i = 0; i < makeNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, makeTyperr[i]);
						pstmt.setString(3, makeMatrr[i]);
						pstmt.setString(4, "R"+reqNo);
						pstmt.setString(5, makeNorr[i]);
						pstmt.setString(6, "화장대");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}

				}
			}else if(proNamerr[j].equals("피아노")) {
				String query = prop.getProperty("updatePiano");

				for(int i = 0; i < pianoNorr.length; i++) {

					try {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, memo);
						pstmt.setString(2, pianoTyperr[i]);
						pstmt.setString(3, "R"+reqNo);
						pstmt.setString(4, pianoNorr[i]);
						pstmt.setString(5, "피아노");

						result = pstmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						close(pstmt);
					}				
				}
			}
		}



		return result;
	}
}	









































