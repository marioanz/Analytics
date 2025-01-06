USE [DataFreedom_Client]
/****** Object:  View [dbo].[df_Construction_Budget_And_Actuals_Detail]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[df_Construction_Budget_And_Actuals_Detail]
AS
SELECT   [Job Id] AS Job_Id, [Job Code] AS Job_Code, [Parent Job Id] AS Parent_Job_Id, [Parent Job Code] AS Parent_Job_Code, [Property Id] AS Property_Id, [Property Code] AS Property_Code, 
                         [Property Name] AS Property_Name, [Contract Id] AS Contract_Id, [Contract Code] AS Contract_Code, [Cost Id] AS Cost_Id, [Cost Code] AS Cost_Code, [Category Id] AS Category_Id, 
                         [Category Code] AS Category_Code, [Category Description] AS Category_Description, [Transaction Id] AS Transaction_Id, [Transaction Date] AS Transaction_Date, 
                         [Transaction Month] AS Transaction_Month, [Transaction Type] AS Transaction_Type, [Transaction Code] AS Transaction_Code, [Voyager URL] AS Voyager_URL, 
                         [Job Original Budget] AS Job_Original_Budget, [Job Budget Revisions] AS Job_Budget_Revisions, [Job Revised Budget] AS Job_Revised_Budget, 
                         [Contract Amount] AS Contract_Amount, [Contract Change Orders] AS Contract_Change_Orders, [Contract And Change Order Total] AS Contract_And_Change_Order_Total, 
                         [Contract Actuals] AS Contract_Actuals, [Contract Remaining Balance] AS Contract_Remaining_Balance, [Pending Contract Amount] AS Pending_Contract_Amount, 
                         [Purchase Order Amount] AS Purchase_Order_Amount, [Purchase Order Actuals] AS Purchase_Order_Actuals, 
                         [Purchase Order Remaining Balance] AS Purchase_Order_Remaining_Balance, [Pending Purchase Order Amount] AS Pending_Purchase_Order_Amount, 
                         [Non-PO or Contract Actuals (AP JE & JCA)] AS [Non-PO_or_Contract_Actuals_AP_JE_+_JCA], [Job Actuals] AS Job_Actuals, [Pending IRs] AS Pending_IRs, 
                         [Job Cost To Complete] AS Job_Cost_To_Complete, [Total Committed] AS Total_Committed, [Undisbursed Budget Balance] AS Undisbursed_Budget_Balance, 
                         [Undisbursed Committed Balance] AS Undisbursed_Committed_Balance, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Budget_And_Actuals_Detail
GO

/****** Object:  View [dbo].[df_Construction_Category_Tree_Xref]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Construction_Category_Tree_Xref]
AS
SELECT   [Category Tree Id] AS Category_Tree_Id, [Category Tree Code] AS Category_Tree_Code, [Category Tree Description] AS Category_Tree_Description, 
                         [Category Tree Node Id] AS Category_Tree_Node_Id, [Category Tree Node Type] AS Category_Tree_Node_Type, [Category Tree Node Code] AS Category_Tree_Node_Code, 
                         [Category Tree Node Code Formatted] AS Category_Tree_Node_Code_Formatted, [Category Tree Node Description] AS Category_Tree_Node_Description, 
                         [Category Tree Node Indent] AS Category_Tree_Node_Indent, [Category Tree Node Code and Description] AS Category_Tree_Node_Code_and_Description, 
                         [Category Tree Node Custom 1] AS Category_Tree_Node_Custom_1, [Category Tree Node Custom 2] AS Category_Tree_Node_Custom_2, 
                         [Category Tree Node Custom 3] AS Category_Tree_Node_Custom_3, [Category Tree Node Custom 4] AS Category_Tree_Node_Custom_4, 
                         [Category Tree Node Negate] AS Category_Tree_Node_Negate, [Category Tree Node Sign] AS Category_Tree_Node_Sign, 
                         [Category Tree Node Total Into Id] AS Category_Tree_Node_Total_Into_Id, [Is Hidden] AS Is_Hidden, [Category Id] AS Category_Id, [Database Id] AS Database_Id, 
                         [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Category_Tree_Xref
GO
/****** Object:  View [dbo].[df_Construction_Category_Trees]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Construction_Category_Trees]
AS
SELECT   [Category Tree Id] AS Category_Tree_Id, [Category Tree Code] AS Category_Tree_Code, [Category Tree Description] AS Category_Tree_Description, 
                         [Category Tree Node Id] AS Category_Tree_Node_Id, [Category Tree Node Type] AS Category_Tree_Node_Type, [Category Tree Node Code] AS Category_Tree_Node_Code, 
                         [Category Tree Node Code Formatted] AS Category_Tree_Node_Code_Formatted, [Category Tree Node Description] AS Category_Tree_Node_Description, 
                         [Category Tree Node Description Indented] AS Category_Tree_Node_Description_Indented, [Category Tree Node Code and Description] AS Category_Tree_Node_Code_and_Description,
                          [Category Tree Node Custom 1] AS Category_Tree_Node_Custom_1, [Category Tree Node Custom 2] AS Category_Tree_Node_Custom_2, 
                         [Category Tree Node Custom 3] AS Category_Tree_Node_Custom_3, [Category Tree Node Custom 4] AS Category_Tree_Node_Custom_4, 
                         [Category Tree Node Sign] AS Category_Tree_Node_Sign, [Category Tree Node Total Into Id] AS Category_Tree_Node_Total_Into_Id, [Is Hidden] AS Is_Hidden, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Category_Trees
GO


/****** Object:  View [dbo].[df_Construction_Report_Project_Status]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Construction_Report_Project_Status]
AS
SELECT   [As Of Month] AS As_Of_Month, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Property Id] AS Property_Id, [Category Tree Code] AS Category_Tree_Code, 
                         [Category Tree Name] AS Category_Tree_Name, [Category Tree Id] AS Category_Tree_Id, [Category Tree Detail Id] AS Category_Tree_Detail_Id, 
                         [Category Tree Detail Code] AS Category_Tree_Detail_Code, [Category Tree Detail Name] AS Category_Tree_Detail_Name, [Job Code] AS Job_Code, [Job Name] AS Job_Name, 
                         [Job Id] AS Job_Id, [Estimated Cost Budget Original] AS Estimated_Cost_Budget_Original, [Estimated Cost Budget Change] AS Estimated_Cost_Budget_Change, 
                         [Estimated Cost Budget Revised] AS Estimated_Cost_Budget_Revised, [Committed Contracts] AS Committed_Contracts, [Committed Spent] AS Committed_Spent, 
                         [Committed To Complete] AS Committed_To_Complete, [Non-Committed Budget] AS [Non-Committed_Budget], [Not-Committed Spent] AS [Not-Committed_Spent], 
                         [Non-Committed To Complete] AS [Non-Committed_To_Complete], [Total Spent To Date] AS Total_Spent_To_Date, [Total Spent This Month] AS Total_Spent_This_Month, 
                         [Estimated Cost At Completion] AS Estimated_Cost_At_Completion, [Estimated Cost to Complete] AS Estimated_Cost_to_Complete, [Over Budget Amount] AS Over_Budget_Amount, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Report_Project_Status
GO

/****** Object:  View [dbo].[df_Financial_Account_Tree]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Financial_Account_Tree]
AS
SELECT [Account Tree Id] AS Account_Tree_Id, [Account Tree Code] AS Account_Tree_Code, [Account Tree Description] AS Account_Tree_Description, [Account Tree Node Id] AS Account_Tree_Node_Id, [Account Tree Node Type] AS Account_Tree_Node_Type, [Account Tree Node Code] AS Account_Tree_Node_Code, 
         [Account Tree Node Code Formatted] AS Account_Tree_Node_Code_Formatted, [Account Tree Node Description] AS Account_Tree_Node_Description, [Account Tree Node Description Indented] AS Account_Tree_Node_Description_Indented, [Account Tree Node Code and Description] AS Account_Tree_Node_Code_and_Description, 
         [Account Tree Node Custom 1] AS Account_Tree_Node_Custom_1, [Account Tree Node Custom 2] AS Account_Tree_Node_Custom_2, [Account Tree Node Custom 3] AS Account_Tree_Node_Custom_3, [Account Tree Node Custom 4] AS Account_Tree_Node_Custom_4, [Account Tree Node Reverse] AS Account_Tree_Node_Reverse, 
         [Account Tree Node Negate] AS Account_Tree_Node_Negate, [Account Tree Node Sign] AS Account_Tree_Node_Sign, [Account Tree Node Total Into Id] AS Account_Tree_Node_Total_Into_Id, [Is Hidden] AS Is_Hidden, [Parent Header Node Id] AS Parent_Header_Node_Id, [Account Tree Node Nest Level] AS Account_Tree_Node_Nest_Level, 
         [Parent Level 1 - Id] AS [Parent_Level_1_-_Id], [Parent Level 1 - Code] AS [Parent_Level_1_-_Code], [Parent Level 1 - Code Formatted] AS [Parent_Level_1_-_Code_Formatted], [Parent Level 1 - Description] AS [Parent_Level_1_-_Description], [Parent Level 2 - Id] AS [Parent_Level_2_-_Id], [Parent Level 2 - Code] AS [Parent_Level_2_-_Code], 
         [Parent Level 2 - Code Formatted] AS [Parent_Level_2_-_Code_Formatted], [Parent Level 2 - Description] AS [Parent_Level_2_-_Description], [Parent Level 3 - Id] AS [Parent_Level_3_-_Id], [Parent Level 3 - Code] AS [Parent_Level_3_-_Code], [Parent Level 3 - Code Formatted] AS [Parent_Level_3_-_Code_Formatted], [Parent Level 3 - Description] AS [Parent_Level_3_-_Description], 
         [Parent Level 4 - Id] AS [Parent_Level_4_-_Id], [Parent Level 4 - Code] AS [Parent_Level_4_-_Code], [Parent Level 4 - Code Formatted] AS [Parent_Level_4_-_Code_Formatted], [Parent Level 4 - Description] AS [Parent_Level_4_-_Description], [Parent Level 5 - Id] AS [Parent_Level_5_-_Id], [Parent Level 5 - Code] AS [Parent_Level_5_-_Code], 
         [Parent Level 5 - Code Formatted] AS [Parent_Level_5_-_Code_Formatted], [Parent Level 5 - Description] AS [Parent_Level_5_-_Description], [Parent Level 6 - Id] AS [Parent_Level_6_-_Id], [Parent Level 6 - Code] AS [Parent_Level_6_-_Code], [Parent Level 6 - Code Formatted] AS [Parent_Level_6_-_Code_Formatted], [Parent Level 6 - Description] AS [Parent_Level_6_-_Description], 
         [Breadcrumb - Codes] AS [Breadcrumb_-_Codes], [Breadcrumb - Descriptions] AS [Breadcrumb_-_Descriptions], [Breadcrumb - Code and Descriptions] AS [Breadcrumb_-_Code_and_Descriptions], [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Financial_Account_Tree
GO
/****** Object:  View [dbo].[df_Financial_Account_Tree_Xref]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Financial_Account_Tree_Xref]
AS
SELECT [Account Tree Id] AS Account_Tree_Id, [Account Tree Code] AS Account_Tree_Code, [Account Tree Description] AS Account_Tree_Description, [Account Tree Node Id] AS Account_Tree_Node_Id, [Account Tree Node Type] AS Account_Tree_Node_Type, [Account Tree Node Code] AS Account_Tree_Node_Code, 
         [Account Tree Node Code Formatted] AS Account_Tree_Node_Code_Formatted, [Account Tree Node Description] AS Account_Tree_Node_Description, [Account Tree Node Indent] AS Account_Tree_Node_Indent, [Account Tree Node Code and Description] AS Account_Tree_Node_Code_and_Description, [Account Tree Node Custom 1] AS Account_Tree_Node_Custom_1, 
         [Account Tree Node Custom 2] AS Account_Tree_Node_Custom_2, [Account Tree Node Custom 3] AS Account_Tree_Node_Custom_3, [Account Tree Node Custom 4] AS Account_Tree_Node_Custom_4, [Account Tree Node Reverse] AS Account_Tree_Node_Reverse, [Account Tree Node Negate] AS Account_Tree_Node_Negate, 
         [Account Tree Node Sign] AS Account_Tree_Node_Sign, [Account Tree Node Total Into Id] AS Account_Tree_Node_Total_Into_Id, [Is Hidden] AS Is_Hidden, [Account Tree Node Nest Level] AS Account_Tree_Node_Nest_Level, [GL Account Id] AS GL_Account_Id, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Financial_Account_Tree_Xref
GO

/****** Object:  View [dbo].[df_Financial_AR_Aging_By_Month]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Financial_AR_Aging_By_Month]
AS
SELECT [As Of Month] AS As_Of_Month, [Person Id] AS Person_Id, [Person Type] AS Person_Type, [Person Code] AS Person_Code, [Person Name] AS Person_Name, [Person State] AS Person_State, [Person City] AS Person_City, [Person Zip] AS Person_Zip, [Person Country] AS Person_Country, [Person Status] AS Person_Status, [Person Lease From] AS Person_Lease_From, 
         [Person Lease To] AS Person_Lease_To, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Unit Id] AS Unit_Id, [Unit Code] AS Unit_Code, [Unit Name] AS Unit_Name, [Customer Id] AS Customer_Id, [Customer Code] AS Customer_Code, [Customer Name] AS Customer_Name, [Transaction Id] AS Transaction_Id, 
         [Transaction Ctrl] AS Transaction_Ctrl, [Transaction Type] AS Transaction_Type, [Voyager URL] AS Voyager_URL, [Transaction Period] AS Transaction_Period, [Transaction Due Date] AS Transaction_Due_Date, [Transaction From Date] AS Transaction_From_Date, [Transaction To Date] AS Transaction_To_Date, [Invoice Number] AS Invoice_Number, [Invoice Date] AS Invoice_Date, 
         [Amount Charged Net] AS Amount_Charged_Net, [Amount Charged Tax 1] AS Amount_Charged_Tax_1, [Amount Charged Tax 2] AS Amount_Charged_Tax_2, [Amount Charged Gross] AS Amount_Charged_Gross, [Open Balance Net] AS Open_Balance_Net, [Open Balance Tax 1] AS Open_Balance_Tax_1, [Open Balance Tax 2] AS Open_Balance_Tax_2, 
         [Open Balance Gross] AS Open_Balance_Gross, Prepay, [Open Balance Net Excluding Prepay] AS Open_Balance_Net_Excluding_Prepay, [Open Balance Tax 1 Excluding Prepay] AS Open_Balance_Tax_1_Excluding_Prepay, [Open Balance Tax 2 Excluding Prepay] AS Open_Balance_Tax_2_Excluding_Prepay, 
         [Open Balance Gross Excluding Prepay] AS Open_Balance_Gross_Excluding_Prepay, [Charge Code] AS Charge_Code, [Charge Code Name] AS Charge_Code_Name, [Charge Code Type] AS Charge_Code_Type, [Account Code] AS Account_Code, [Account Name] AS Account_Name, [AR Account Code] AS AR_Account_Code, [AR Account Name] AS AR_Account_Name, 
         [Segment - Due to/from] AS [Segment_-_Due_to-from], [Segment - Utility Month] AS [Segment_-_Utility_Month], [Segment - Budget Key] AS [Segment_-_Budget_Key], [Segment - Budget Flag] AS [Segment_-_Budget_Flag], [Transaction Currency Base] AS Transaction_Currency_Base, [Transaction Currency] AS Transaction_Currency, 
         [Last AR Memo Tenant] AS Last_AR_Memo_Tenant, [Last AR Memo Transaction] AS Last_AR_Memo_Transaction, [Days Past Due] AS Days_Past_Due, [Open Balance Gross 0 to 30 Days] AS Open_Balance_Gross_0_to_30_Days, [Open Balance Gross 31 to 60 Days] AS Open_Balance_Gross_31_to_60_Days, 
         [Open Balance Gross 61 to 90 Days] AS Open_Balance_Gross_61_to_90_Days, [Open Balance Gross 90+ Days] AS [Open_Balance_Gross_90+_Days], [Open Balance Gross Excluding Prepay 0 to 30 Days] AS Open_Balance_Gross_Excluding_Prepay_0_to_30_Days, [Open Balance Gross Excluding Prepay 31 to 60 Days] AS Open_Balance_Gross_Excluding_Prepay_31_to_60_Days, 
         [Open Balance Gross Excluding Prepay 61 to 90 Days] AS Open_Balance_Gross_Excluding_Prepay_61_to_90_Days, [Open Balance Gross Excluding Prepay 90+ Days] AS [Open_Balance_Gross_Excluding_Prepay_90+_Days], [Aging Bracket] AS Aging_Bracket, [Is Current Month] AS Is_Current_Month, [Database Id] AS Database_Id, 
         [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Financial_AR_Aging_By_Month
GO
/****** Object:  View [dbo].[df_Financial_Balance_Sheet]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Financial_Balance_Sheet]
AS
SELECT [Account Tree Id] AS Account_Tree_Id, [Account Tree Code] AS Account_Tree_Code, [Account Tree Description] AS Account_Tree_Description, [Account Tree Node Id] AS Account_Tree_Node_Id, [Account Tree Node Type] AS Account_Tree_Node_Type, [Account Tree Node Code] AS Account_Tree_Node_Code, 
         [Account Tree Node Code Formatted] AS Account_Tree_Node_Code_Formatted, [Account Tree Node Description] AS Account_Tree_Node_Description, [Account Tree Node Description Indented] AS Account_Tree_Node_Description_Indented, [Account Tree Node Code and Description] AS Account_Tree_Node_Code_and_Description, [Property Id] AS Property_Id, 
         [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Book Name] AS Book_Name, [Post Month] AS Post_Month, [Is Last Closed GL Period] AS Is_Last_Closed_GL_Period, [Is Current GL Period] AS Is_Current_GL_Period, [Is Not Zero] AS Is_Not_Zero, Balance, [Beginning Balance] AS Beginning_Balance, [Net Change] AS Net_Change, Currency, 
         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Financial_Balance_Sheet
GO
/****** Object:  View [dbo].[df_Financial_Entire]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Financial_Entire]
AS
SELECT [Account Tree Id] AS Account_Tree_Id, [Account Tree Code] AS Account_Tree_Code, [Account Tree Description] AS Account_Tree_Description, [Account Tree Node Id] AS Account_Tree_Node_Id, [Account Tree Node Type] AS Account_Tree_Node_Type, [Account Tree Node Sign] AS Account_Tree_Node_Sign, [Account Tree Node Code] AS Account_Tree_Node_Code, [Account Tree Node Code Formatted] AS Account_Tree_Node_Code_Formatted, 
         [Account Tree Node Description] AS Account_Tree_Node_Description, [Account Tree Node Description Indented] AS Account_Tree_Node_Description_Indented, [Account Tree Node Code and Description] AS Account_Tree_Node_Code_and_Description, [Is Hidden] AS Is_Hidden, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Book Name] AS Book_Name, [Post Month] AS Post_Month, 
         [Actual Beginning Balance] AS Actual_Beginning_Balance, Actual, [Budget Beginning Balance] AS Budget_Beginning_Balance, Budget, Currency, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through, [GL Account Id] AS GL_Account_Id, [GL Account Code] AS GL_Account_Code, [GL Account Description] AS GL_Account_Description, [Normal Balance] AS Normal_Balance
FROM   DataFreedom.DataFreedom.df_Financial_Entire
WHERE [Post Month] >= '2019-01-01'
GO

/****** Object:  View [dbo].[df_Global_Amendment_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Amendment_Commercial]
AS
SELECT [Amendment Id] AS Amendment_Id, [Amendment Type] AS Amendment_Type, [Proposal Type] AS Proposal_Type, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, Status, Sequence, [Contracted Area] AS Contracted_Area, 
         [Term in Months] AS Term_in_Months, [Amendment Units] AS Amendment_Units, [Start Date] AS Start_Date, [End Date] AS End_Date, [Sign Date] AS Sign_Date, [Move In Date] AS Move_In_Date, [Move Out Date] AS Move_Out_Date, [Contract End Date] AS Contract_End_Date, [Activated Date] AS Activated_Date, [Occupancy Cert Date] AS Occupancy_Cert_Date, 
         [Possession Date] AS Possession_Date, [Holdover Percentage] AS Holdover_Percentage, [Is Month To Month] AS Is_Month_To_Month, Description, Notes, [Is Seperate Amendment Terms] AS Is_Seperate_Amendment_Terms, [Parent Amendment Id] AS Parent_Amendment_Id, [Parent Amendment Type] AS Parent_Amendment_Type, 
         [Monthly Starting Rent] AS Monthly_Starting_Rent, [Monthly Ending Rent] AS Monthly_Ending_Rent, [Total Rent Over Term Of Amendment] AS Total_Rent_Over_Term_Of_Amendment, [Created By] AS Created_By, [Created Date] AS Created_Date, [Last Modified By] AS Last_Modified_By, [Last Modified Date] AS Last_Modified_Date, [Activated By] AS Activated_By, 
         [Activation Date] AS Activation_Date, [Linked Proposal Id] AS Linked_Proposal_Id, [Linked Option Id] AS Linked_Option_Id, [Voyager URL] AS Voyager_URL, Workflow, [Workflow Status] AS Workflow_Status, [Workflow Start Date] AS Workflow_Start_Date, [Workflow Final Approval Date] AS Workflow_Final_Approval_Date, [Workflow Current Step] AS Workflow_Current_Step, 
         [Workflow Current Preferred Approver] AS Workflow_Current_Preferred_Approver, [Workflow Current Approvers] AS Workflow_Current_Approvers, [Workflow Current Step Start Date] AS Workflow_Current_Step_Start_Date, [Workflow Prior Step Comments] AS Workflow_Prior_Step_Comments, [Workflow Current Step Id] AS Workflow_Current_Step_Id, 
         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Amendment_Commercial
GO
/****** Object:  View [dbo].[df_Global_Attachment]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Attachment]
AS
SELECT [Attachment Id] AS Attachment_Id, [Record Type] AS Record_Type, [Record Id] AS Record_Id, [Record Code] AS Record_Code, [Record Description] AS Record_Description, [Date Attached] AS Date_Attached, [Attachment Type] AS Attachment_Type, Description, [File Name] AS File_Name, [File UNC Path] AS File_UNC_Path, [Is Secured Document] AS Is_Secured_Document, 
         [Created By] AS Created_By, [Created Date] AS Created_Date, [Last Modified By] AS Last_Modified_By, [Last Modified Date] AS Last_Modified_Date, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Attachment
GO
/****** Object:  View [dbo].[df_Global_Bank_Book_Balance]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Bank_Book_Balance]
AS
SELECT [Bank Id] AS Bank_Id, [Bank Code] AS Bank_Code, [Bank Description] AS Bank_Description, Period, [Current GL Balance] AS Current_GL_Balance, Currency, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Bank_Book_Balance
GO
/****** Object:  View [dbo].[df_Global_Contact]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Contact]
AS
SELECT [Contact Id] AS Contact_Id, Code, [First Name] AS First_Name, Salutation, [Company Name] AS Company_Name, Description, Title, [Contact URL] AS Contact_URL, [Address 1] AS Address_1, [Address 2] AS Address_2, [Address 3] AS Address_3, [Address 4] AS Address_4, City, State, [Postal Code] AS Postal_Code, Country, sPhoneNum0, sPhoneNum1, sPhoneNum2, sPhoneNum3, 
         sPhoneNum4, sPhoneNum5, sPhoneNum6, sPhoneNum7, sPhoneNum8, Email, [Email Alternate] AS Email_Alternate, Notes, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Contact
GO
/****** Object:  View [dbo].[df_Global_Contact_Xref]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Contact_Xref]
AS
SELECT Object, [Object Id] AS Object_Id, [Object Code] AS Object_Code, [Object Description] AS Object_Description, [Contact Id] AS Contact_Id, [Employee Id] AS Employee_Id, [Contact Is An Employee] AS Contact_Is_An_Employee, [Contact First Name] AS Contact_First_Name, [Contact Last Name] AS Contact_Last_Name, [Contact Email] AS Contact_Email, 
         [Contact Email Alt] AS Contact_Email_Alt, [Is Primary] AS Is_Primary, [Role Id] AS Role_Id, [Role Description] AS Role_Description, [Role Is Used In Workflow Approvals] AS Role_Is_Used_In_Workflow_Approvals, [Is A Billing Role] AS Is_A_Billing_Role, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Contact_Xref
GO
/****** Object:  View [dbo].[df_Global_Critical_Dates]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Critical_Dates]
AS
SELECT [Property Id] AS Property_Id, [Property Code] AS Property_Code, Date, [Event Type] AS Event_Type, [Event Description] AS Event_Description, [Event Calculated] AS Event_Calculated, [Record Object] AS Record_Object, [Record Id] AS Record_Id, [Record Code] AS Record_Code, [Record Description] AS Record_Description, [Voyager URL] AS Voyager_URL, 
         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Critical_Dates
GO
/****** Object:  View [dbo].[df_Global_Customer]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Customer]
AS
SELECT [Customer Id] AS Customer_Id, Code, Name, Type, Status, [Parent Customer] AS Parent_Customer, Country, [Sales Category Code] AS Sales_Category_Code, [Sales Category Description] AS Sales_Category_Description, [Tax Registration Number] AS Tax_Registration_Number, [Tax Authority Code] AS Tax_Authority_Code, [Tax Authority Description] AS Tax_Authority_Description, 
         Notes, [Primary Contact Name] AS Primary_Contact_Name, [Primary Contact Company] AS Primary_Contact_Company, [Primary Contact Address] AS Primary_Contact_Address, [Primary Contact City] AS Primary_Contact_City, [Primary Contact State] AS Primary_Contact_State, [Primary Contact Postal Code] AS Primary_Contact_Postal_Code, 
         [Primary Contact Country] AS Primary_Contact_Country, [Primary Contact Email] AS Primary_Contact_Email, [Primary Contact Phone 0] AS Primary_Contact_Phone_0, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Customer
GO
/****** Object:  View [dbo].[df_Global_Memo]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Memo]
AS
SELECT [Memo Id] AS Memo_Id, Object, [Object Id] AS Object_Id, [Object Code] AS Object_Code, [Object Description] AS Object_Description, Date, Time, Type, Status, Result, Agents, [Show on Calendar] AS Show_on_Calendar, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Unit Id] AS Unit_Id, [Unit Code] AS Unit_Code, [Unit Type] AS Unit_Type, Employee, 
         [User Name] AS User_Name, Notes, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Memo
GO
/****** Object:  View [dbo].[df_Global_Property_List_Xref]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Property_List_Xref]
AS
SELECT [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Property List Id] AS Property_List_Id, [Property List Code] AS Property_List_Code, [Property List Name] AS Property_List_Name, [Property List Percent] AS Property_List_Percent, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM   DataFreedom.DataFreedom.df_Global_Property_List_Xref
GO
/****** Object:  View [dbo].[df_Global_Property_Ownership]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Property_Ownership]
AS
SELECT [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Contract Exp Date] AS Contract_Exp_Date, [Contract Reserve] AS Contract_Reserve, [Commission Percent] AS Commission_Percent, [Commission Min] AS Commission_Min, [Legal Entity Id] AS Legal_Entity_Id, [Legal Entity Code] AS Legal_Entity_Code, [Amount Invested] AS Amount_Invested, 
         [Investment Date] AS Investment_Date, Remarks, [Ownership Percent] AS Ownership_Percent, Shares, Income, Depreciation, [Tax Credit] AS Tax_Credit, [State Credit] AS State_Credit, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Property_Ownership
GO


/****** Object:  View [dbo].[df_Global_Tenant_Deposit_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Deposit_Commercial]
AS
SELECT        [Tenant Id] AS Tenant_Id, [Deposit Received Amount] AS Deposit_Received_Amount, [Deposit Required Amount] AS Deposit_Required_Amount, [Database Id] AS Database_Id, 
                         [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Deposit_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Next_Review_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Next_Review_Commercial]
AS
SELECT        Row, [Tenant Id] AS Tenant_Id, [Camrule Id] AS Camrule_Id, [From Date] AS From_Date, [Increase Type] AS Increase_Type, [Review Amount] AS Review_Amount, [Review Type] AS Review_Type, [Database Id] AS Database_Id, 
                         [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Next_Review_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Option_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Option_Commercial]
AS
SELECT        [Commercial Option Id] AS Commercial_Option_Id, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, 
                         [Tenant Name] AS Tenant_Name, [Amendment Type] AS Amendment_Type, [Amendment Status] AS Amendment_Status, [Amendment Start Date] AS Amendment_Start_Date, [Amendment End Date] AS Amendment_End_Date, 
                         [Amendment Sequence] AS Amendment_Sequence, [Amendment Description] AS Amendment_Description, [Amendment Id] AS Amendment_Id, [Commercial Clause Id] AS Commercial_Clause_Id, Area, 
                         [Contiguous Space] AS Contiguous_Space, [Option Type] AS Option_Type, [Option Status] AS Option_Status, [Expiration Date] AS Expiration_Date, [Option Term In Months] AS Option_Term_In_Months, 
                         [Option Term In Years] AS Option_Term_In_Years, [Minimum Notice Days] AS Minimum_Notice_Days, [Minimum Notice Date] AS Minimum_Notice_Date, [Maximum Notice Days] AS Maximum_Notice_Days, 
                         [Maximum Notice Date] AS Maximum_Notice_Date, [Notice Received Date] AS Notice_Received_Date, [Percentage FMR] AS Percentage_FMR, [Fixed Rent] AS Fixed_Rent, [Rent Period] AS Rent_Period, 
                         [Rent Other] AS Rent_Other, [Has Overage Rent] AS Has_Overage_Rent, [Percentage Sales] AS Percentage_Sales, [Percentage Sales Less Rent] AS Percentage_Sales_Less_Rent, 
                         [Percentage Sales Less Fixed Break Point] AS Percentage_Sales_Less_Fixed_Break_Point, [Break Point] AS Break_Point, [Maximum Response Days] AS Maximum_Response_Days, 
                         [Maximum Response Date] AS Maximum_Response_Date, [Notice Sent Date] AS Notice_Sent_Date, [Who Initiates] AS Who_Initiates, [Earliest Handover Date] AS Earliest_Handover_Date, 
                         [Latest Handover Date] AS Latest_Handover_Date, Penalty, [Declined Date] AS Declined_Date, [Expired Date] AS Expired_Date, [Canceled Date] AS Canceled_Date, [Exercised Date] AS Exercised_Date, 
                         [Brief Description] AS Brief_Description, Notes, [Is Ongoing Option] AS Is_Ongoing_Option, Response, [Custom Option Type] AS Custom_Option_Type, [Break Option Type] AS Break_Option_Type, [Is Modified] AS Is_Modified, 
                         [Break Date] AS Break_Date, [Termination Type] AS Termination_Type, [Is Amendment Activated] AS Is_Amendment_Activated, [Is Amendment Only] AS Is_Amendment_Only, [Created By User] AS Created_By_User, 
                         [Created Date] AS Created_Date, [Modified By User] AS Modified_By_User, [Last Modified Date] AS Last_Modified_Date, [Is Time Of The Essence] AS Is_Time_Of_The_Essence, 
                         [Option Valid Until Date] AS Option_Valid_Until_Date, [Contract End Date] AS Contract_End_Date, [Penalty Currency] AS Penalty_Currency, [Start Date] AS Start_Date, 
                         [Latest Response Days Type] AS Latest_Response_Days_Type, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Option_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Scheduled_Charge_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Scheduled_Charge_Commercial]
AS
SELECT        [Camrule Id] AS Camrule_Id, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, 
                         [Amendment Id] AS Amendment_Id, [Amendment Status] AS Amendment_Status, [Amendment Type] AS Amendment_Type, [Amendment Start Date] AS Amendment_Start_Date, [Amendment End Date] AS Amendment_End_Date, 
                         [Amendment Sequence] AS Amendment_Sequence, [Amendment Description] AS Amendment_Description, [Charge Code] AS Charge_Code, [Charge Code Description] AS Charge_Code_Description, 
                         [Charge Code Type] AS Charge_Code_Type, [Rent Schedule From Date] AS Rent_Schedule_From_Date, [Rent Schedule To Date] AS Rent_Schedule_To_Date, Currency, Frequency, [Bill Day] AS Bill_Day, 
                         [Days Due] AS Days_Due, [Due Day After Method] AS Due_Day_After_Method, [Unit Code] AS Unit_Code, [Unit Id] AS Unit_Id, [Amount Type] AS Amount_Type, [Amount Period] AS Amount_Period, 
                         [Area Column Override] AS Area_Column_Override, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, [Last Day Of Period] AS Last_Day_Of_Period, Amount, Notes, Prorated, [Sales Tran Type] AS Sales_Tran_Type, 
                         [Method Of Payment] AS Method_Of_Payment, [Taxpoint Day] AS Taxpoint_Day, [Payment Schedule] AS Payment_Schedule, [Rate Provider] AS Rate_Provider, [Rate Type] AS Rate_Type, [Bill In Arrears] AS Bill_In_Arrears, 
                         [Set Invoice Date To Due Date] AS Set_Invoice_Date_To_Due_Date, [Suppress Paper Invoice] AS Suppress_Paper_Invoice, [Print Invoice On Change] AS Print_Invoice_On_Change, 
                         [Lease Currency Is Invoice Currency] AS Lease_Currency_Is_Invoice_Currency, [Do Not Bill Before Date] AS Do_Not_Bill_Before_Date, [Indexation Method] AS Indexation_Method, 
                         [Indexation Fixed Percent] AS Indexation_Fixed_Percent, [Indexation Minimum Percent] AS Indexation_Minimum_Percent, [Indexation Maximum Percent] AS Indexation_Maximum_Percent, 
                         [Indexation Decrease Possible] AS Indexation_Decrease_Possible, [Indexation CPI Index] AS Indexation_CPI_Index, [Indexation CPI Month] AS Indexation_CPI_Month, [Indexation Base Month] AS Indexation_Base_Month, 
                         [Indexation Base Amount] AS Indexation_Base_Amount, [Indexation CPI Increase Factor] AS Indexation_CPI_Increase_Factor, [Indexation CPI Increase Type] AS Indexation_CPI_Increase_Type, 
                         [Indexation Index Interval] AS Indexation_Index_Interval, [Indexation Index Date] AS Indexation_Index_Date, [Indexation Next Increase Date After Months] AS Indexation_Next_Increase_Date_After_Months, 
                         [Indexation Increase As Points] AS Indexation_Increase_As_Points, [Indexation Increase Charge Code] AS Indexation_Increase_Charge_Code, [LI Correction Percentage] AS LI_Correction_Percentage, 
                         [LI Charge Code] AS LI_Charge_Code, [New Charge Offset Forward] AS New_Charge_Offset_Forward, [Step Indexation] AS Step_Indexation, [Late Fee Calculation Type] AS Late_Fee_Calculation_Type, 
                         [Late Fee Percent] AS Late_Fee_Percent, [Late Fee Grace Period Days] AS Late_Fee_Grace_Period_Days, [Late Fee Interest Free Days] AS Late_Fee_Interest_Free_Days, 
                         [Late Fee Minimum Threshold] AS Late_Fee_Minimum_Threshold, [Late Fee Maximum Threshold] AS Late_Fee_Maximum_Threshold, [Late Fee Additional Fee] AS Late_Fee_Additional_Fee, 
                         [Late Fee Calc Basis Gross] AS Late_Fee_Calc_Basis_Gross, [Late Fee Charge on Unpaid] AS Late_Fee_Charge_on_Unpaid, [Late Fee Days In Year] AS Late_Fee_Days_In_Year, 
                         [Late Fee Interest Index] AS Late_Fee_Interest_Index, [Late Fee Minimum Percentage] AS Late_Fee_Minimum_Percentage, [Late Fee Maximum Percentage] AS Late_Fee_Maximum_Percentage, 
                         [Late Fee Factor] AS Late_Fee_Factor, [Late Fee Adjustment] AS Late_Fee_Adjustment, [Indexation Step Breakpoint 1] AS Indexation_Step_Breakpoint_1, [Indexation Step Breakpoint 2] AS Indexation_Step_Breakpoint_2, 
                         [Indexation Step Breakpoint 3] AS Indexation_Step_Breakpoint_3, [Indexation Step Breakpoint 4] AS Indexation_Step_Breakpoint_4, [Indexation Step Breakpoint 5] AS Indexation_Step_Breakpoint_5, 
                         [Indexation Step Percent 1] AS Indexation_Step_Percent_1, [Indexation Step Percent 2] AS Indexation_Step_Percent_2, [Indexation Step Percent 3] AS Indexation_Step_Percent_3, 
                         [Indexation Step Percent 4] AS Indexation_Step_Percent_4, [Indexation Step Percent 5] AS Indexation_Step_Percent_5, [Segment - Due to/from] AS [Segment_-_Due_to-from], 
                         [Segment - Utility Month] AS [Segment_-_Utility_Month], [Segment - Budget Key] AS [Segment_-_Budget_Key], [Segment - Budget Flag] AS [Segment_-_Budget_Flag], [Voyager URL] AS Voyager_URL, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Scheduled_Charge_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Scheduled_Charge_Monthly_Pivot_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Scheduled_Charge_Monthly_Pivot_Commercial]
AS
SELECT        [Tenant Id] AS Tenant_Id, Currency, carrier, definc, enterpri, other, rent, rentdm91, rentds2, rentnvv5, rentnvv6, tenserv, xconnect, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Scheduled_Charge_Monthly_Pivot_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Scheduled_Charge_Monthly_Pivot_Type_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Scheduled_Charge_Monthly_Pivot_Type_Commercial]
AS
SELECT        [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, Currency, CAM, Ovg, Rent, Misc, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Scheduled_Charge_Monthly_Pivot_Type_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Scheduled_Charges_Split_By_Unit_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Scheduled_Charges_Split_By_Unit_Commercial]
AS
SELECT        [Camrule Id] AS Camrule_Id, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, 
                         [Unit Code] AS Unit_Code, [Unit Id] AS Unit_Id, [Monthly Amount] AS Monthly_Amount, [Amendment Id] AS Amendment_Id, [Amendment Status] AS Amendment_Status, [Amendment Type] AS Amendment_Type, 
                         [Amendment Start Date] AS Amendment_Start_Date, [Amendment End Date] AS Amendment_End_Date, [Amendment Sequence] AS Amendment_Sequence, [Amendment Description] AS Amendment_Description, 
                         [Charge Code] AS Charge_Code, [Charge Code Description] AS Charge_Code_Description, [Charge Code Type] AS Charge_Code_Type, [Rent Schedule From Date] AS Rent_Schedule_From_Date, 
                         [Rent Schedule To Date] AS Rent_Schedule_To_Date, Currency, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Scheduled_Charges_Split_By_Unit_Commercial
GO

/****** Object:  View [dbo].[df_Global_Vendor_Audit]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Vendor_Audit]
AS
SELECT        [Vendor Id] AS Vendor_Id, [Vendor Code] AS Vendor_Code, [Vendor Name] AS Vendor_Name, [Voyager Page] AS Voyager_Page, [Table Name] AS Table_Name, [Table Description] AS Table_Description, 
                         [Table Field] AS Table_Field, [Table Field Description] AS Table_Field_Description, [Old Value] AS Old_Value, [Old Value Friendly] AS Old_Value_Friendly, [New Value] AS New_Value, [New Value Friendly] AS New_Value_Friendly, 
                         [Modified Date] AS Modified_Date, [Modified By] AS Modified_By, [Modified Action] AS Modified_Action, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Vendor_Audit
GO
/****** Object:  View [dbo].[df_Maintenance_Asset_Depreciation]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Maintenance_Asset_Depreciation]
AS
SELECT        [Asset Id] AS Asset_Id, [Asset Code] AS Asset_Code, Name, [GL Book] AS GL_Book, Method, [Recovery Period] AS Recovery_Period, [Recovery Period Type] AS Recovery_Period_Type, Convention, Basis, 
                         [Placed in Service] AS Placed_in_Service, [Net Book Value] AS Net_Book_Value, [Last Posted] AS Last_Posted, [Last Amount] AS Last_Amount, Status, [Depreciation Expense Account] AS Depreciation_Expense_Account, 
                         [Accumulated Depreciation Account] AS Accumulated_Depreciation_Account, [Date Created] AS Date_Created, [Created By] AS Created_By, [Date Last Modified] AS Date_Last_Modified, [Last Modified By] AS Last_Modified_By, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Maintenance_Asset_Depreciation
GO
/****** Object:  View [dbo].[df_Property_Address]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Property_Address]
AS
SELECT        Id, [Property Name] AS Property_Name, Address, City, State, [Postal Code] AS Postal_Code, [Country Code] AS Country_Code, Checksum, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Property_Address
GO
/****** Object:  View [dbo].[df_Report_Audit_Table_Event]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Report_Audit_Table_Event]
AS
SELECT        [Audit Event Id] AS Audit_Event_Id, [Audit Time Stamp] AS Audit_Time_Stamp, [Audit Action] AS Audit_Action, [User Name] AS User_Name, [Table Name] AS Table_Name, [Table PK Id] AS Table_PK_Id
FROM            DataFreedom.DataFreedom.df_Report_Audit_Table_Event
GO
/****** Object:  View [dbo].[df_Report_Audit_Table_Event_Detail]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Report_Audit_Table_Event_Detail]
AS
SELECT        [Audit Event Id] AS Audit_Event_Id, [Audit Time Stamp] AS Audit_Time_Stamp, [Audit Action] AS Audit_Action, [User Name] AS User_Name, [Table Name] AS Table_Name, [Table PK Id] AS Table_PK_Id, 
                         [Column Name] AS Column_Name, [Column Name Description] AS Column_Name_Description, [Old Value] AS Old_Value, [New Value] AS New_Value
FROM            DataFreedom.DataFreedom.df_Report_Audit_Table_Event_Detail
GO
/****** Object:  View [dbo].[df_Report_Rent_Projection_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Report_Rent_Projection_Commercial]
AS
SELECT        Month, [Is Current Month] AS Is_Current_Month, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, 
                         [Tenant Name] AS Tenant_Name, [Unit Id] AS Unit_Id, [Unit Code] AS Unit_Code, [Charge Code Id] AS Charge_Code_Id, [Charge Code] AS Charge_Code, [Charge Code Name] AS Charge_Code_Name, 
                         [Charge Code Type] AS Charge_Code_Type, Currency, Amount, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Report_Rent_Projection_Commercial
GO
/****** Object:  View [dbo].[df_Report_Security_Analytics_Permissions_By_Group]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Report_Security_Analytics_Permissions_By_Group]
AS
SELECT        [Permission Name] AS Permission_Name, [Program Type] AS Program_Type, [Permission Token] AS Permission_Token, [Permission Description] AS Permission_Description, [Permission Type] AS Permission_Type, 
                         [User Group Code] AS User_Group_Code, [User Group Description] AS User_Group_Description, Access, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Report_Security_Analytics_Permissions_By_Group
GO
/****** Object:  View [dbo].[df_Report_Workflow_Approvers]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Report_Workflow_Approvers]
AS
SELECT        [Record Type Id] AS Record_Type_Id, [Workflow Object] AS Workflow_Object, [Record Id] AS Record_Id, [Record Name] AS Record_Name, [Workflow Process Id] AS Workflow_Process_Id, 
                         [Workflow Process Step Id] AS Workflow_Process_Step_Id, [Workflow Step Name] AS Workflow_Step_Name, [Workflow Name] AS Workflow_Name, [Approver Person Id] AS Approver_Person_Id, 
                         [Approver User Id] AS Approver_User_Id, [Approver Name] AS Approver_Name, [Approver Email] AS Approver_Email, [Is Preferred Approver] AS Is_Preferred_Approver, 
                         [Approver Is Covering Out of Office] AS Approver_Is_Covering_Out_of_Office, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Report_Workflow_Approvers
GO
/****** Object:  View [dbo].[df_Report_Workflow_Steps]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Report_Workflow_Steps]
AS
SELECT        [Workflow Object] AS Workflow_Object, [Workflow Name] AS Workflow_Name, [Workflow Process Id] AS Workflow_Process_Id, [Workflow Status] AS Workflow_Status, [Workflow Process Step Id] AS Workflow_Process_Step_Id, 
                         [Workflow Step Name] AS Workflow_Step_Name, [Workflow Step Start] AS Workflow_Step_Start, [Workflow Step End] AS Workflow_Step_End, [Workflow Step Status] AS Workflow_Step_Status, Approver, Notes, 
                         [Record Id] AS Record_Id, [Record Code] AS Record_Code
FROM            DataFreedom.DataFreedom.df_Report_Workflow_Steps
GO
/****** Object:  View [dbo].[df_System_Daily_Job_Summary]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_System_Daily_Job_Summary]
AS
SELECT        Id, [Job Status] AS Job_Status, [Start Time] AS Start_Time, [End Time] AS End_Time, [Job Elapsed] AS Job_Elapsed, [Download 1 Status] AS Download_1_Status, [Download 1 Elapsed] AS Download_1_Elapsed, 
                         [Download 2 Status] AS Download_2_Status, [Download 2 Elapsed] AS Download_2_Elapsed, [Download 3 Status] AS Download_3_Status, [Download 3 Elapsed] AS Download_3_Elapsed, [Restore Status] AS Restore_Status, 
                         [Restore Elapsed] AS Restore_Elapsed, [Post Restore Status] AS Post_Restore_Status, [Post Restore Elapsed] AS Post_Restore_Elapsed, [Time Zone] AS Time_Zone
FROM            DataFreedom.DataFreedom.df_System_Daily_Job_Summary
GO
/****** Object:  View [dbo].[df_System_Data_Dictionary]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_System_Data_Dictionary]
AS
SELECT        Id, [Schema Name] AS Schema_Name, [Table Name] AS Table_Name, [Table Comments] AS Table_Comments
FROM            DataFreedom.DataFreedom.df_System_Data_Dictionary
GO
/****** Object:  View [dbo].[df_System_Data_Dictionary_Detail]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_System_Data_Dictionary_Detail]
AS
SELECT        Id, [Schema Name] AS Schema_Name, [Table Name] AS Table_Name, [Table Comments] AS Table_Comments, [Column Name] AS Column_Name, [Column Comments] AS Column_Comments, [Is Primary Key] AS Is_Primary_Key, 
                         [Is Foreign Key] AS Is_Foreign_Key, [Data Type] AS Data_Type, Length, [Numeric Precision] AS Numeric_Precision, [Numeric Scale] AS Numeric_Scale, Nullable, Computed, [Identity], [Default Value] AS Default_Value
FROM            DataFreedom.DataFreedom.df_System_Data_Dictionary_Detail
GO

