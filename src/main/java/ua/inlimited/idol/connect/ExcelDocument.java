package ua.inlimited.idol.connect;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractExcelView;
import ua.inlimited.idol.connect.RecordItem;
import ua.inlimited.idol.connect.ResultList;

public class ExcelDocument extends AbstractExcelView {
    @Autowired
    ResultList resultList;

    public ExcelDocument() {
    }

    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HSSFSheet excelSheet = workbook.createSheet("Download data");
        response.setHeader("Content-Disposition", "attachment; filename=excelDocument.xls");
        HSSFFont font = workbook.createFont();
        font.setFontName("Arial");
        font.setBoldweight((short) 700);
        font.setColor((short) 9);
        HSSFCellStyle styleHeader = workbook.createCellStyle();
        styleHeader.setFillForegroundColor((short) 12);
        styleHeader.setFillPattern((short) 1);
        styleHeader.setFont(font);
        this.setExcelHeader(excelSheet, styleHeader);
        int rowCount = 1;
        Iterator var9 = ((List)model.get("modelObject")).iterator();

        while(var9.hasNext()) {
            RecordItem item = (RecordItem)var9.next();
            HSSFRow row = excelSheet.createRow(rowCount++);
            row.createCell(0).setCellValue(item.getUserName());
            row.createCell(1).setCellValue(item.getDate());
            row.createCell(2).setCellValue(item.getContent());
        }

    }

    public void setExcelHeader(HSSFSheet excelSheet, CellStyle styleHeader) {
        HSSFRow header = excelSheet.createRow(0);
        header.createCell(0).setCellValue("User name");
        header.getCell(0).setCellStyle(styleHeader);
        header.createCell(1).setCellValue("Date");
        header.getCell(1).setCellStyle(styleHeader);
        header.createCell(2).setCellValue("Content");
        header.getCell(2).setCellStyle(styleHeader);
    }
}

