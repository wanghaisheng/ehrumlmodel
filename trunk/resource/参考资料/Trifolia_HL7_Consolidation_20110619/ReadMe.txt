Installation:

1) Download and install MySQL server and the appropriate ODBC MySQL Driver from the MySQL website.
   http://www.mysql.com

2) Create a database in your MySQL instance for Template Database (TDB). 
   EX (SQL): create database templatedb;

3) Create a user account that can access the new database. 
   EX (SQL): grant all privileges on templatedb.* to <username>@'%' identified by '<password>';

4) Restore the tdb MySQL dump file (from the archive) to the new database.
   - Trifolia_TemplateDatabase_Schema_20110614.sql: restoring to create an empty templatedb database with all tables. 
   - Trifolia_HL7_Consolidation_MySQL_Data_20110614.sql: restoring to create a templatedb database populated with HL7 CDA Consolidation templates.
   EX (CMD): mysql -u <username> -D templatedb --password='<password>' < Trifolia_HL7_Consolidation_MySQL_Data_20110614.sql

----------------------------

Use MS Access Template Editor  (Optional, require MS Access 2007 or later)

5) Create a connection to the database using ODBC.
   See "Creating an ODBC datasource connection" below for more details.

6) Open the TDBClient.accde MS Access file. 

7) Click on the "External Data", then "import" --> "more" --> "ODBC Database".

8) Select "Link to the data source by creating a linked table." and press OK.

9) In the "File Data Source" tab, select the dsn file you created in step 5.

10) Select all tables, check the Save Password checkbox, then press OK. Click Save Password on each save password prompt 

11) Click CDA_Template_Editor to open the CDA template editing form for creating and updating template. 
    
12) Force an user to always login into the TDB Access client
    a. click on "Office button", then on "Access Options", on the left pane, select "Current Database", on the right pane, for the "Display Form" field, select Login from the pick up list, click OK.
    b. Close and restart MS Access, now an user will be prompt for login credential. The default user that you can use is:
	user name: defaultUser
        password:  test
    c. To add a new user, directly create the user name/password record in templatedb.tdb_users table. The password should be fixed to 1234; When the user first uses MS Access client, the CDA_Template_Editor will prompt the user for new setting up new password.

--------------------------

Use TDB Utility Tool for Implementation Guide publishing

1. Unzip the Trifolia-Consol-HL7.zip to a temporary folder such as: c:/temp

2. Unzip the tdb_gui_v2_hl7.jar to a temporary sub folder such as c:/temp/tdb

3. In c:/temp/tdb, open hibernate.cfg.xml

4. Open hibernate.cfg.xml, update following section with appropriate MySQL values:
    <!-- MySQL Database Properties: START --> 
    <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/templatedb</property> 
    <property name="hibernate.connection.username">root</property>
    <property name="hibernate.connection.password">rootpwd</property> 
    <property name="hibernate.use_sql_comments">true</property>
    <property name="hibernate.format_sql">true</property>
    <!-- MySQL Database Properties: END -->

 5. Once the MySQL configuration update is completed, save and close hibernate.cfg.xml file.

 6. Using archive tool (such as 7-Zip) to re-archive all the files in c:/temp/tdb to create a single tdb_gui_v2_hl7.jar file in c:/temp/tdb

 7. put tdb_gui.bat to the same directory (c:/temp/tdb) as the tdb_gui_v2_hl7.jar

 8. double click on tdb_gui.bat to execute the implementation guide publishing.



***If you have questions or problems, please email tools@lantanagroup.com***

Creating a Database Source Name (DSN) file using Windows ODBC Data Source Tool:
1) In Windows OS, Open Control Panel, then Open the ODBC Data Source Administrator.

2) Select the "File DSN" tab, select a file directory, and click the "Add..." button.

3) You will need to select the ODBC driver for this DSN, which in this case is "MySQL"

4) You now need to enter a name for the DSN file such as local_tdb.dsn, then fill out the ODBC Date Source Configuration form.

5) In the Data Source Name box, enter the name of the data source (A.K.A database name) you want to access. It can be any valid name that you choose.

6) In the Description box, enter some text to help identify the connection.

7) In the Server field, enter the name of the MySQL server host that you want to access. By default, it is loc

8) In the User field, enter the user name to use for this connection.

9) In the Password field, enter the corresponding password for this connection.

10) The Database pop-up should automatically populate with the list of databases that the user has permissions to access.

11) Click OK to save the DSN.
