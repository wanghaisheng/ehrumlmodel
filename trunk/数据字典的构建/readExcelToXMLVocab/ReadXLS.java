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
    	   String codesystem = "GB/T 4658-2006 ѧ������";
    	   String codesystemOID = "GB/T 4658-2006 ѧ������";
           String sourcefile = "C:\\dic.xls";
           InputStream is = new FileInputStream(sourcefile);
           jxl.Workbook rwb = Workbook.getWorkbook(is);
           // ���Sheet 1
           Sheet sheet = rwb.getSheet(0);
 
           String sheetName = sheet.getName();
           System.out.println(sheetName);
 
           int sheetColumns = sheet.getColumns();
           System.out.println("����" + sheetColumns);
 
           int sheetRows = sheet.getRows();
           System.out.println("����" + sheetRows);
           Element root, code;
 
           root = new Element("codesystem"); // ���ɸ�Ԫ�أ�
           root.setAttribute("codeSystemName",codesystem);
           root.setAttribute("root",codesystemOID);           
           Document doc = new Document(root); // ����Ԫ��ֲ���ĵ�doc��
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
 
           format.setEncoding("gb2312"); // ����xml�ļ����ַ�Ϊgb2312
 
           format.setIndent("    "); // ����xml�ļ�������Ϊ4���ո�
 
           XMLOutputter XMLOut = new XMLOutputter(format);// Ԫ�غ���һ��Ԫ�����ĸ�
 
           XMLOut.output(doc, new FileOutputStream("D://sheetName.xml"));
 
       } catch (Exception e) {
           System.out.println(e);
       }
 
    }
}