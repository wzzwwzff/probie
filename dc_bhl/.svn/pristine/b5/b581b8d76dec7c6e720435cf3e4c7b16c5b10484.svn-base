package com.app.cq.utils;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Vector;

/**
 * Excel文件内容读取工具 返回List，读取方法
 *
 * <pre>
 * List list = read();
 * for (int i = 0; i &lt; list.size(); i++) {
 * 	List row = (List) list.get(i);
 * 	for (int ii = 0; ii &lt; row.size(); ii++) {
 * 		String value = (String) row.get(ii);
 * 	}
 * }
 * </pre>
 *
 * @author ccj
 */
@SuppressWarnings("unchecked")
public class ReadExcel {

	/**
	 * 读Excel
	 * @param filePath 源文件
	 * @return
	 * @throws Exception
	 */
	public static List read(String filePath) throws Exception {
		FileInputStream fileInputStream = new FileInputStream(filePath);
		return ReadExcel.read(fileInputStream, 0, false);
	}

	/**
	 * 读Excel
	 * @param filePath 源文件
	 * @param sheetIndex 读取单元表(sheet)索引，以0开始
	 * @return
	 * @throws Exception
	 */
	public static List read(String filePath, int sheetIndex) throws Exception {
		FileInputStream fileInputStream = new FileInputStream(filePath);
		return ReadExcel.read(fileInputStream, sheetIndex, false);
	}

	/**
	 * 读Excel
	 * @param filePath 源文件
	 * @param sheetIndex 读取单元表(sheet)索引，以0开始
	 * @param ignoreFirstRow 是否忽略首行不读取
	 * @return
	 * @throws Exception
	 */
	public static List read(String filePath, int sheetIndex,
			boolean ignoreFirstRow) throws Exception {
		FileInputStream fileInputStream = new FileInputStream(filePath);
		return ReadExcel.read(fileInputStream, sheetIndex, ignoreFirstRow);
	}

	/**
	 * 读Excel内容
	 *
	 * @param inputStream  Excel文件流
	 * @param sheetIndex  sheet索引，第一个sheet为0
	 * @param ignoreFirstRow
	 *            是否忽略第一行(考虑到表头问题)
	 * @return
	 * @throws Exception
	 */
	public static List read(InputStream inputStream, int sheetIndex,
			boolean ignoreFirstRow) throws Exception {

		List result = new Vector();

		Workbook workbook = Workbook.getWorkbook(inputStream);
		Sheet sheet = workbook.getSheet(sheetIndex);
		int firstNum = 0;
		int rowNum = sheet.getRows();
		int cellNum = sheet.getColumns();

		if (ignoreFirstRow) {
			firstNum++;
		}

		//循环读取内容
		for (int i = firstNum; i < rowNum; i++) {
			Vector rowList = new Vector();

			for (int ii = 0; ii < cellNum; ii++) {
				Cell cell = sheet.getCell(ii, i); //得到工作表的单元格
				String content = cell.getContents(); //getContents()将Cell中的字符转为字符串
				rowList.add(content);
			}
			result.add(rowList);
		}
		workbook.close();
		inputStream.close();
		return result;
	}

	public static void main(String[] args) throws Exception {
		List list = ReadExcel.read("c:/temp/123.xls",0,true);

		for (int i = 0; i < list.size(); i++) {
			List row = (List) list.get(i);
            System.out.println(row.size());
			for (int ii = 0; ii < row.size(); ii++) {
				String value = (String) row.get(ii);
				System.out.print(value + " ");
			}
			System.out.println("");
		}
	}

}
