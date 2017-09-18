package com.logistic.tool;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;



public class ExportExcelUtils<T> {
	public void export(
            String sheetName, 
            String[] headers, String[] columns, 
            List<T> lists, 
            HttpServletRequest request,
            HttpServletResponse response) throws Exception 
        {
            HSSFWorkbook wb = new HSSFWorkbook();
            HSSFSheet sheet = wb.createSheet(sheetName);
            sheet.setDefaultColumnWidth(15);
            HSSFCellStyle style = wb.createCellStyle();

            HSSFRow row = sheet.createRow(0);
            style.setAlignment(HSSFCellStyle.ALIGN_LEFT);

            for (int i = 0; i < headers.length; i++) {
                HSSFCell headerCell = row.createCell(i);
                headerCell.setCellValue(headers[i]);
                headerCell.setCellStyle(style);
            }

            Iterator<T> it = lists.iterator();
            int rowIndex = 0;
            while (it.hasNext()) {
                rowIndex++;
                row = sheet.createRow(rowIndex);
                T t = it.next();
                Field[] fields = t.getClass()
                            .getDeclaredFields();
                for (int i = 0; i < fields.length; i++) {
                    Field field = fields[i];
                    String fieldName = field.getName();

                    for (int j = 0; j < columns.length; j++) {
                        if (fieldName.equals(columns[j])) {
                        String getMethodName = "get" + 
                            fieldName.substring(0, 1).
                            toUpperCase() + fieldName.
                            substring(1);
                        Class cls = t.getClass();

                        Method getMethod = cls.getMethod(
                            getMethodName, new Class[] {});
                        Object val = getMethod.invoke(
                            t, new Object[] {});
                        String textVal = null;
                        if (null != val) {
                            textVal = val.toString();
                        } else {
                            textVal = null;
                        }
                            row.createCell(j).
                                setCellValue(textVal);
                    }
                }
            }
        }
        try {
            FileOutputStream out = new FileOutputStream("D://"+sheetName+".xls");
            wb.write(out);
            out.close();
            //JOptionPane.showMessageDialog(null, "导出成功!");
        } catch (Exception e) {
           JOptionPane.showMessageDialog(null, "导出失败!");
        e.printStackTrace();
        }
//        String filename = sheetName + ".xls";
//        String filepath = request.getRealPath("/") + filename;
//        FileOutputStream out = new FileOutputStream(filepath);
//        wb.write(out);
//        out.close();
        
    }
    /**
     * 下载
     */
    public static void downloadExcel(String filepath, HttpServletResponse response)
            throws IOException {
        File file = new File(filepath);
        String fileName = file.getName();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("GBK"), "ISO8859-1"));
        response.setCharacterEncoding("utf-8");
        InputStream fis = new BufferedInputStream(new FileInputStream(file));
        byte[] b = new byte[fis.available()];
        fis.read(b);
        response.getOutputStream().write(b);
        fis.close();
    }

}
