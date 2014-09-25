package readExcelToXMLVocab;
import java.io.*;
import org.jdom.*;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import jxl.*;
public class ReadXLS {
    public static void main(String[] args) {
       // TODO Auto-generatedmethod stub
       try {
    	   String codesystem = "GB/T 4658-2006 学历代码";
    	   String codesystemOID = "GB/T 4658-2006 学历代码";
           String sourcefile = "C:\\dic.xls";
           InputStream is = new FileInputStream(sourcefile);
           jxl.Workbook rwb = Workbook.getWorkbook(is);
           // 获得Sheet 1
           Sheet sheet = rwb.getSheet(0);
 
           String sheetName = sheet.getName();
           System.out.println(sheetName);
 
           int sheetColumns = sheet.getColumns();
           System.out.println("列数" + sheetColumns);
 
           int sheetRows = sheet.getRows();
           System.out.println("行数" + sheetRows);
           Element root, code;
 
           root = new Element("codesystem"); // 生成根元素：
           root.setAttribute("codeSystemName",codesystem);
           root.setAttribute("root",codesystemOID);           
           Document doc = new Document(root); // 将根元素植入文档doc中
           for (int i = 0; i < sheetRows; i++) {
              code = new Element("code");
              
              for (int j = 0; j < sheetColumns; j++) {
                  Cell cell1 = sheet.getCell(j, i);
                  String result = cell1.getContents();
                  System.out.println(result);
                  if (j == 0) {
                	  code.setAttribute("value",result);
                	  System.out.println();
                  }
                  if (j == 1) {
                	  code.setAttribute("displayname",result);                  }
 
              }

              root.addContent(code);
           }
 
           Format format = Format.getCompactFormat();
 
           format.setEncoding("gb2312"); // 设置xml文件的字符为gb2312
 
           format.setIndent("    "); // 设置xml文件的缩进为4个空格
 
           XMLOutputter XMLOut = new XMLOutputter(format);// 元素后换行一层元素缩四格
 
           XMLOut.output(doc, new FileOutputStream("D://sheetName.xml"));
 
       } catch (Exception e) {
           System.out.println(e);
       }
 
    }
}