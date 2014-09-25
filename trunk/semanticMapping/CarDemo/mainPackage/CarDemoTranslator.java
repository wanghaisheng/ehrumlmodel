package mainPackage;
 
import org.w3c.dom.Element;
 
import com.charteris.mapper.reader.ReaderFactory;
 
import com.charteris.mapper.writer.WriterFactory;
import com.charteris.mapper.writer.objectGetter;
import com.charteris.mapper.writer.XMLWriter;
 
import com.charteris.mapper.core.MapperException;
import com.charteris.mapper.util.XMLUtil;
 
 
public class CarDemoTranslator {
               
                static String inputMappingFileLocation = "CarDemo/MappingSets/FlatCar.mapper";
                static String inputInstanceFileLocation = "CarDemo/Instances/FlatCar.xml";
 
                static String classModelFileLocation = "CarDemo/ClassModel/car.ecore";
 
                static String outputMappingFileLocation = "CarDemo/MappingSets/NestedCar.mapper";
                static String outputProcFileLocation = "CarDemo/Translators/NestedCar.wproc";
                static String resultFileLocation = "CarDemo/Instances/NestedCarResult.xml";
 
                /** the main program uses no arguments  */
                public static void main(String[] args) {
                                try
                                {
                                                // make an objectGetter for the input XML instance, using its mappings
objectGetter oGetter = ReaderFactory.makeObjectGetter(
inputMappingFileLocation, classModelFileLocation,
inputInstanceFileLocation);
                                               
                                                // make an XMLWriter for the output XML
                                                XMLWriter xmlWriter = WriterFactory.makeWriter(outputProcFileLocation,
                                                                                oGetter, outputMappingFileLocation, classModelFileLocation,
                                                                                null, false);
                                               
                                                // get the root Element of the result XML
                                                Element topOut = xmlWriter.makeXMLDOM();
                                               
                                                // write out the result XML
                                                XMLUtil.writeOutput(topOut.getOwnerDocument(), resultFileLocation, true);
                                }
                                catch (MapperException ex) {System.out.println(ex.getMessage());}
                }
}