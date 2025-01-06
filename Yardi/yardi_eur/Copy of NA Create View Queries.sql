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
/****** Object:  View [dbo].[df_Construction_Budget_Revision]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Construction_Budget_Revision]
AS
SELECT   [Job Id] AS Job_Id, [Job Code] AS Job_Code, [Category Code] AS Category_Code, [Revision Amount] AS Revision_Amount, [Revision Date] AS Revision_Date, Status, 
                         [Exchange Rate] AS Exchange_Rate, [Cost Id] AS Cost_Id, [Cost Code] AS Cost_Code, [Approved By] AS Approved_By, [Revision Reason] AS Revision_Reason, 
                         [Posted Status] AS Posted_Status, [Revision Number] AS Revision_Number, [Is Latest Posted Budget Revision] AS Is_Latest_Posted_Budget_Revision, [Voyager URL] AS Voyager_URL, 
                         [Construction Manager URL] AS Construction_Manager_URL, Workflow, [Workflow Status] AS Workflow_Status, [Workflow Start Date] AS Workflow_Start_Date, 
                         [Workflow Final Approval Date] AS Workflow_Final_Approval_Date, [Workflow Current Step] AS Workflow_Current_Step, 
                         [Workflow Current Preferred Approver] AS Workflow_Current_Preferred_Approver, [Workflow Current Approvers] AS Workflow_Current_Approvers, 
                         [Workflow Current Step Start Date] AS Workflow_Current_Step_Start_Date, [Workflow Prior Step Comments] AS Workflow_Prior_Step_Comments, 
                         [Workflow Current Step Id] AS Workflow_Current_Step_Id, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Budget_Revision
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

/****** Object:  View [dbo].[df_Construction_Job]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Construction_Job]
AS
SELECT   [Job Id] AS Job_Id, Code, Name, [Address Line 1] AS Address_Line_1, [Address Line 2] AS Address_Line_2, [Address Line 3] AS Address_Line_3, [Address City] AS Address_City, 
                         [Address State] AS Address_State, [Address Postal Code] AS Address_Postal_Code, [Address Country] AS Address_Country, Remarks, [Property Id] AS Property_Id, 
                         [Property Code] AS Property_Code, [Property Name] AS Property_Name, Area, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, 
                         [Unit Id] AS Unit_Id, [Unit Code] AS Unit_Code, [Unit Name] AS Unit_Name, Status, [Type Code] AS Type_Code, [Type Description] AS Type_Description, [Phase Code] AS Phase_Code, 
                         [Phase Description] AS Phase_Description, [Date 1] AS Date_1, [Date 2] AS Date_2, [Gl Account] AS Gl_Account, [Cash Account] AS Cash_Account, [AP Account] AS AP_Account, 
                         [Functional Currency] AS Functional_Currency, [Base Currency] AS Base_Currency, [Exchange Rate] AS Exchange_Rate, [Scheduled Start Date] AS Scheduled_Start_Date, 
                         [Revised Start Date] AS Revised_Start_Date, [Actual Start Date] AS Actual_Start_Date, [Scheduled Completion Date] AS Scheduled_Completion_Date, 
                         [Revised Completion Date] AS Revised_Completion_Date, [Actual Completion Date] AS Actual_Completion_Date, [Original Budget Start Date] AS Original_Budget_Start_Date, 
                         [Original Budget End Date] AS Original_Budget_End_Date, [Risk Assessment Date] AS Risk_Assessment_Date, [Risk Assessment Level] AS Risk_Assessment_Level, 
                         [Risk Assessment Percent Complete] AS Risk_Assessment_Percent_Complete, [Risk Assessment Proposed Final Cost] AS Risk_Assessment_Proposed_Final_Cost, 
                         [Risk Assessment Proposed Completion Date] AS Risk_Assessment_Proposed_Completion_Date, [Risk Assessment Over Budget Risk] AS Risk_Assessment_Over_Budget_Risk, 
                         [Risk Assessment Past Due Risk] AS Risk_Assessment_Past_Due_Risk, [Risk Assessment Remarks] AS Risk_Assessment_Remarks, [Risk Assessor User Id] AS Risk_Assessor_User_Id, 
                         [Risk Assessor User Name] AS Risk_Assessor_User_Name, [Custom - VDC Budget Mgr] AS [Custom_-_VDC_Budget_Mgr], [Custom - Sr Approver] AS [Custom_-_Sr_Approver], 
                         [Custom - field 3] AS [Custom_-_field_3], [Custom - field 4] AS [Custom_-_field_4], [Custom - field 5] AS [Custom_-_field_5], [Custom - field 6] AS [Custom_-_field_6], 
                         [Custom - field 7] AS [Custom_-_field_7], [Custom - field 8] AS [Custom_-_field_8], [Custom - field 9] AS [Custom_-_field_9], [Custom - field 10] AS [Custom_-_field_10], 
                         [Custom - field 11] AS [Custom_-_field_11], [Custom - field 12] AS [Custom_-_field_12], [Custom - field 13] AS [Custom_-_field_13], [Custom - field 14] AS [Custom_-_field_14], 
                         [Project Manager Name] AS Project_Manager_Name, [Created By] AS Created_By, [Created Date] AS Created_Date, [Last Modified By] AS Last_Modified_By, 
                         [Last Modified Date] AS Last_Modified_Date, [Original Budget Date] AS Original_Budget_Date, [Project Code] AS Project_Code, 
                         [Sub Retention Percentage] AS Sub_Retention_Percentage, [Client Retention Percentage] AS Client_Retention_Percentage, [Requires Lien Release] AS Requires_Lien_Release, 
                         [Model Code] AS Model_Code, [Vendor Code] AS Vendor_Code, [Mark Up Percentage] AS Mark_Up_Percentage, Computation, 
                         [Pre Approve Allowance Amount] AS Pre_Approve_Allowance_Amount, [Pre Approve Allowance Percentage] AS Pre_Approve_Allowance_Percentage, 
                         [Over Budget Allowance Amount] AS Over_Budget_Allowance_Amount, [Over Budget Allowance Percentage] AS Over_Budget_Allowance_Percentage, [No Allowance] AS No_Allowance,
                          [Hold Payments] AS Hold_Payments, [Pay When Paid] AS Pay_When_Paid, [Allocate Cost] AS Allocate_Cost, [Parent Job Id] AS Parent_Job_Id, [Parent Job Code] AS Parent_Job_Code, 
                         [Proposed Budget] AS Proposed_Budget, [Balance Brought Forward] AS Balance_Brought_Forward, [Board Approved] AS Board_Approved, 
                         [Attribute - Project Type] AS [Attribute_-_Project_Type], [Attribute - Maintenance Capex] AS [Attribute_-_Maintenance_Capex], [Attribute - Budget Year] AS [Attribute_-_Budget_Year], 
                         [Voyager URL] AS Voyager_URL, [Construction Manager URL] AS Construction_Manager_URL, Workflow, [Workflow Status] AS Workflow_Status, 
                         [Workflow Start Date] AS Workflow_Start_Date, [Workflow Final Approval Date] AS Workflow_Final_Approval_Date, [Workflow Current Step] AS Workflow_Current_Step, 
                         [Workflow Current Preferred Approver] AS Workflow_Current_Preferred_Approver, [Workflow Current Approvers] AS Workflow_Current_Approvers, 
                         [Workflow Current Step Start Date] AS Workflow_Current_Step_Start_Date, [Workflow Prior Step Comments] AS Workflow_Prior_Step_Comments, 
                         [Workflow Current Step Id] AS Workflow_Current_Step_Id, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Job
GO
/****** Object:  View [dbo].[df_Construction_Job_Forecast]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Construction_Job_Forecast]
AS
SELECT   [Job Id] AS Job_Id, [Job Code] AS Job_Code, [Job Name] AS Job_Name, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, 
                         [Category Id] AS Category_Id, [Category Code] AS Category_Code, [Category Description] AS Category_Description, [Forecast Number] AS Forecast_Number, 
                         [Forecast Header Post Month] AS Forecast_Header_Post_Month, [Forecast Status] AS Forecast_Status, [Is Latest Posted Forecast] AS Is_Latest_Posted_Forecast, Month, 
                         [Forecast Monthly Amount] AS Forecast_Monthly_Amount, [Is Actuals] AS Is_Actuals, [Voyager URL] AS Voyager_URL, [Construction Manager URL] AS Construction_Manager_URL, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM         DataFreedom.DataFreedom.df_Construction_Job_Forecast
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
/****** Object:  View [dbo].[df_Financial_AP_Aging_By_Month]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[df_Financial_AP_Aging_By_Month]
AS
SELECT [As Of Month] AS As_Of_Month, [Is Current Month] AS Is_Current_Month, [Person Id] AS Person_Id, [Person Type] AS Person_Type, [Person Code] AS Person_Code, [Person Name] AS Person_Name, [Person State] AS Person_State, [Person City] AS Person_City, [Person Zip] AS Person_Zip, [Property Id] AS Property_Id, [Property Code] AS Property_Code, 
         [Property Name] AS Property_Name, [Transaction Id] AS Transaction_Id, [Transaction Ctrl] AS Transaction_Ctrl, [Voyager URL] AS Voyager_URL, [Is Intercompany Transaction] AS Is_Intercompany_Transaction, [Invoice Date] AS Invoice_Date, [Due Date] AS Due_Date, [Post Month] AS Post_Month, [Invoice Number] AS Invoice_Number, [Invoice Notes] AS Invoice_Notes, 
         [Batch Id] AS Batch_Id, [Account Id] AS Account_Id, [Account Code] AS Account_Code, [Account Name] AS Account_Name, Reference, Remark, [Module Created By] AS Module_Created_By, [Exchange Rate] AS Exchange_Rate, [Transaction Currency Code] AS Transaction_Currency_Code, [Base Currency Code] AS Base_Currency_Code, 
         [Remittance Vendor Code] AS Remittance_Vendor_Code, [Remittance Vendor Id] AS Remittance_Vendor_Id, [Remittance Vendor Name] AS Remittance_Vendor_Name, [Segment - Due to/from] AS [Segment_-_Due_to-from], [Segment - Utility Month] AS [Segment_-_Utility_Month], [Segment - Budget Key] AS [Segment_-_Budget_Key], 
         [Segment - Budget Flag] AS [Segment_-_Budget_Flag], [Days Overdue Based On Invoice Date and Last Day Of Month] AS Days_Overdue_Based_On_Invoice_Date_and_Last_Day_Of_Month, [Aging Bracket Based On Invoice Date and Last Day Of Month] AS Aging_Bracket_Based_On_Invoice_Date_and_Last_Day_Of_Month, 
         [Days Overdue Based On Due Date and Last Day Of Month] AS Days_Overdue_Based_On_Due_Date_and_Last_Day_Of_Month, [Aging Bracket Based On Due Date and Last Day Of Month] AS Aging_Bracket_Based_On_Due_Date_and_Last_Day_Of_Month, [Days Overdue Based On Invoice Date and Current Date] AS Days_Overdue_Based_On_Invoice_Date_and_Current_Date, 
         [Aging Bracket Based On Invoice Date and Current Date] AS Aging_Bracket_Based_On_Invoice_Date_and_Current_Date, [Days Overdue Based On Due Date and Current Date] AS Days_Overdue_Based_On_Due_Date_and_Current_Date, [Aging Bracket Based On Due Date and Current Date] AS Aging_Bracket_Based_On_Due_Date_and_Current_Date, 
         [Transaction Currency Open Balance Net] AS Transaction_Currency_Open_Balance_Net, [Transaction Currency Open Balance Tax 1] AS Transaction_Currency_Open_Balance_Tax_1, [Transaction Currency Open Balance Tax 2] AS Transaction_Currency_Open_Balance_Tax_2, [Transaction Currency Open Balance Total] AS Transaction_Currency_Open_Balance_Total, 
         [Base Currency Open Balance Net] AS Base_Currency_Open_Balance_Net, [Base Currency Open Balance Tax 1] AS Base_Currency_Open_Balance_Tax_1, [Base Currency Open Balance Tax 2] AS Base_Currency_Open_Balance_Tax_2, [Base Currency Open Balance Total] AS Base_Currency_Open_Balance_Total, [Database Id] AS Database_Id, 
         [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Financial_AP_Aging_By_Month
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
/****** Object:  View [dbo].[df_Financial_Balance_Sheet_Segmented]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Financial_Balance_Sheet_Segmented]
AS
SELECT [Account Tree Id] AS Account_Tree_Id, [Account Tree Code] AS Account_Tree_Code, [Account Tree Description] AS Account_Tree_Description, [Account Tree Node Id] AS Account_Tree_Node_Id, [Account Tree Node Type] AS Account_Tree_Node_Type, [Account Tree Node Code] AS Account_Tree_Node_Code, 
         [Account Tree Node Code Formatted] AS Account_Tree_Node_Code_Formatted, [Account Tree Node Description] AS Account_Tree_Node_Description, [Account Tree Node Description Indented] AS Account_Tree_Node_Description_Indented, [Account Tree Node Code and Description] AS Account_Tree_Node_Code_and_Description, 
         [Segment - Due to/from] AS [Segment_-_Due_to-from], [Segment - Utility Month] AS [Segment_-_Utility_Month], [Segment - Budget Key] AS [Segment_-_Budget_Key], [Segment - Budget Flag] AS [Segment_-_Budget_Flag], [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Book Name] AS Book_Name, [Post Month] AS Post_Month, 
         [Is Last Closed GL Period] AS Is_Last_Closed_GL_Period, [Is Current GL Period] AS Is_Current_GL_Period, [Is Not Zero] AS Is_Not_Zero, Balance, [Beginning Balance] AS Beginning_Balance, [Net Change] AS Net_Change, Currency, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Financial_Balance_Sheet_Segmented
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
/****** Object:  View [dbo].[df_Financial_Entire_Segmented]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[df_Financial_Entire_Segmented]
AS
SELECT [Account Tree Id] AS Account_Tree_Id, [Account Tree Code] AS Account_Tree_Code, [Account Tree Description] AS Account_Tree_Description, [Account Tree Node Id] AS Account_Tree_Node_Id, [Account Tree Node Type] AS Account_Tree_Node_Type, [Account Tree Node Sign] AS Account_Tree_Node_Sign, [Account Tree Node Code] AS Account_Tree_Node_Code, [Account Tree Node Code Formatted] AS Account_Tree_Node_Code_Formatted, 
         [Account Tree Node Description] AS Account_Tree_Node_Description, [Account Tree Node Description Indented] AS Account_Tree_Node_Description_Indented, [Account Tree Node Code and Description] AS Account_Tree_Node_Code_and_Description, [Is Hidden] AS Is_Hidden, [Segment - Due to/from] AS [Segment_-_Due_to-from], [Segment - Utility Month] AS [Segment_-_Utility_Month], [Segment - Budget Key] AS [Segment_-_Budget_Key], 
         [Segment - Budget Flag] AS [Segment_-_Budget_Flag], [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Book Name] AS Book_Name, [Post Month] AS Post_Month, [Actual Beginning Balance] AS Actual_Beginning_Balance, Actual, [Budget Beginning Balance] AS Budget_Beginning_Balance, Budget, Currency, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through, 
         [GL Account Id] AS GL_Account_Id, [GL Account Code] AS GL_Account_Code, [GL Account Description] AS GL_Account_Description, [Normal Balance] AS Normal_Balance
FROM   DataFreedom.DataFreedom.df_Financial_Entire_Segmented
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
/****** Object:  View [dbo].[df_Global_Bank]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[df_Global_Bank]
AS
SELECT [Bank Id] AS Bank_Id, Code, [Account Number] AS Account_Number, Description, Currency, [Is Active] AS Is_Active, [Date Inactive] AS Date_Inactive, Notes, [Number Of Days for Clearing] AS Number_Of_Days_for_Clearing, [Reconciliation Date] AS Reconciliation_Date, [Reconciliation Balance] AS Reconciliation_Balance, [Next Cheque Number] AS Next_Cheque_Number, 
         [Next EFT Number] AS Next_EFT_Number, [Next Deposit Number] AS Next_Deposit_Number, [Next EFT Deposit Number] AS Next_EFT_Deposit_Number, [Next Adjustment Number] AS Next_Adjustment_Number, [Bank Name] AS Bank_Name, [Bank Address 1] AS Bank_Address_1, [Bank Address 2] AS Bank_Address_2, [Bank Address 3] AS Bank_Address_3, 
         [Bank ABA Number] AS Bank_ABA_Number, [Payer Name,] AS [Payer_Name], [Payer Address 1] AS Payer_Address_1, [Payer Address 2] AS Payer_Address_2, [Payer Address 3] AS Payer_Address_3, [Payer Address 4] AS Payer_Address_4, MICR, [Custom - Country] AS [Custom_-_Country], [Custom - User defined 2] AS [Custom_-_User_defined_2], 
         [Custom - User defined 3] AS [Custom_-_User_defined_3], [Custom - User defined 4] AS [Custom_-_User_defined_4], [Cheque Type] AS Cheque_Type, [Stub Position] AS Stub_Position, [EPay Provider] AS EPay_Provider, [User Created By] AS User_Created_By, [Date Created] AS Date_Created, [User Last Modified By] AS User_Last_Modified_By, [Date Modified] AS Date_Modified, 
         [Count of Properties] AS Count_of_Properties, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Bank
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
/****** Object:  View [dbo].[df_Global_Bank_Statement_Balance]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Bank_Statement_Balance]
AS
SELECT [Bank Id] AS Bank_Id, [Bank Code] AS Bank_Code, Date, Period, [Bank Book Statment Id] AS Bank_Book_Statment_Id, [Statement Number] AS Statement_Number, [Is Posted] AS Is_Posted, [GL Balance As Of Date Bank File Imported] AS GL_Balance_As_Of_Date_Bank_File_Imported, [Statement Balance] AS Statement_Balance, [Bank Currency] AS Bank_Currency, 
         [Is Current] AS Is_Current, [Cash TB Balance As At Period End] AS Cash_TB_Balance_As_At_Period_End, [Cash TB Balance Currency] AS Cash_TB_Balance_Currency, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Bank_Statement_Balance
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
/****** Object:  View [dbo].[df_Global_Property]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[df_Global_Property]
AS
SELECT [Property Id] AS Property_Id, Type, Code, Name, [Address 1] AS Address_1, [Address 2] AS Address_2, City, State, [Postal Code] AS Postal_Code, Country, Latitude, Longitude, Notes, [Legal Entity Id] AS Legal_Entity_Id, [Legal Entity Code] AS Legal_Entity_Code, [Legal Entity Name] AS Legal_Entity_Name, [Tax Authority] AS Tax_Authority, [Base Currency] AS Base_Currency, [Is Commercial] AS Is_Commercial, [Is Residential] AS Is_Residential, 
         [Area - Default] AS [Area_-_Default], [Area - Rentable] AS [Area_-_Rentable], [Area - MegaWatts] AS [Area_-_MegaWatts], [Area - Quantity] AS [Area_-_Quantity], [Area - KW] AS [Area_-_KW], [Area - Default (Sum of Units)] AS [Area_-_Default_Sum_of_Units], [Is Active] AS Is_Active, [Inactive Date] AS Inactive_Date, [Attribute - SUBGROUP1] AS [Attribute_-_SUBGROUP1], [Attribute - SUBGROUP2] AS [Attribute_-_SUBGROUP2], 
         [Attribute - SUBGROUP3] AS [Attribute_-_SUBGROUP3], [Attribute - SUBGROUP4] AS [Attribute_-_SUBGROUP4], [Attribute - SUBGROUP5] AS [Attribute_-_SUBGROUP5], [Attribute - SUBGROUP6] AS [Attribute_-_SUBGROUP6], [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM   DataFreedom.DataFreedom.df_Global_Property
GO
/****** Object:  View [dbo].[df_Global_Property_Contacts]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Property_Contacts]
AS
SELECT [Property Id] AS Property_Id, [Contact - CTO] AS [Contact_-_CTO], [Contact - Wire Instructions] AS [Contact_-_Wire_Instructions], [Contact - CCF] AS [Contact_-_CCF], [Contact - Manager of Ops] AS [Contact_-_Manager_of_Ops], [Contact - CINVO] AS [Contact_-_CINVO], [Contact - VP Market Dev] AS [Contact_-_VP_Market_Dev], [Contact - Vendor] AS [Contact_-_Vendor], 
         [Contact - CCF AP] AS [Contact_-_CCF_AP], [Contact - AP PO Review] AS [Contact_-_AP_PO_Review], [Contact - Construction OFCI] AS [Contact_-_Construction_OFCI], [Contact - VP of EHS] AS [Contact_-_VP_of_EHS], [Contact - Dir Network Service Delivery] AS [Contact_-_Dir_Network_Service_Delivery], [Contact - UT IR Notify] AS [Contact_-_UT_IR_Notify], 
         [Contact - Sr Director IT Digital Products] AS [Contact_-_Sr_Director_IT_Digital_Products], [Contact - Director IT ServiceDesk] AS [Contact_-_Director_IT_ServiceDesk], [Contact - Director DMO] AS [Contact_-_Director_DMO], [Contact - Accounts Receivable] AS [Contact_-_Accounts_Receivable], [Contact - Director of Public Policy] AS [Contact_-_Director_of_Public_Policy], 
         [Contact - VP of Legal] AS [Contact_-_VP_of_Legal], [Contact - PO Address] AS [Contact_-_PO_Address], [Contact - CCF Requestor] AS [Contact_-_CCF_Requestor], [Contact - Journal] AS [Contact_-_Journal], [Contact - CCO NA] AS [Contact_-_CCO_NA], [Contact - Director of Security] AS [Contact_-_Director_of_Security], 
         [Contact - Manager Rel Eng] AS [Contact_-_Manager_Rel_Eng], [Contact - Sr VP of Ops] AS [Contact_-_Sr_VP_of_Ops], [Contact - Executive VP NA] AS [Contact_-_Executive_VP_NA], [Contact - VP of Marketing] AS [Contact_-_VP_of_Marketing], [Contact - Sr Director Finance] AS [Contact_-_Sr_Director_Finance], [Contact - Director of Ops] AS [Contact_-_Director_of_Ops], 
         [Contact - VP of Tax] AS [Contact_-_VP_of_Tax], [Contact - Chief Info Sec Global] AS [Contact_-_Chief_Info_Sec_Global], [Contact - Director of HR] AS [Contact_-_Director_of_HR], [Contact - Dir Bus Proc] AS [Contact_-_Dir_Bus_Proc], [Contact - Manager Accnt Tax] AS [Contact_-_Manager_Accnt_Tax], 
         [Contact - Sr Manager Cyber Security] AS [Contact_-_Sr_Manager_Cyber_Security], [Contact - COO NA] AS [Contact_-_COO_NA], [Contact - Chief Legal Officer] AS [Contact_-_Chief_Legal_Officer], [Contact - SR Director Rel Eng] AS [Contact_-_SR_Director_Rel_Eng], [Contact - Procurement Dir] AS [Contact_-_Procurement_Dir], [Contact - SVP of CAD] AS [Contact_-_SVP_of_CAD], 
         [Contact - VP of Innovation] AS [Contact_-_VP_of_Innovation], [Contact - NSD Requestor] AS [Contact_-_NSD_Requestor], [Contact - Director of Compliance] AS [Contact_-_Director_of_Compliance], [Contact - CIO] AS [Contact_-_CIO], [Contact - Director IT TechnoInfra] AS [Contact_-_Director_IT_TechnoInfra], 
         [Contact - Director of HR Operations] AS [Contact_-_Director_of_HR_Operations], [Contact - Manager BizOps] AS [Contact_-_Manager_BizOps], [Contact - Lockbox] AS [Contact_-_Lockbox], [Contact - VP Internal Audit] AS [Contact_-_VP_Internal_Audit], [Contact - Utility Power Approver] AS [Contact_-_Utility_Power_Approver], [Contact - Sr Approver] AS [Contact_-_Sr_Approver], 
         [Contact - Lockbox2] AS [Contact_-_Lockbox2], [Contact - Manager New Dev] AS [Contact_-_Manager_New_Dev], [Contact - Legal Review] AS [Contact_-_Legal_Review], [Contact - Eng PM] AS [Contact_-_Eng_PM], [Contact - Procurement Manager] AS [Contact_-_Procurement_Manager], [Contact - Director of Legal] AS [Contact_-_Director_of_Legal], 
         [Contact - Sr Director of Ops] AS [Contact_-_Sr_Director_of_Ops], [Contact - CFO] AS [Contact_-_CFO], [Contact - Accounting Manager] AS [Contact_-_Accounting_Manager], [Contact - Auto Ctrl Sys Dir] AS [Contact_-_Auto_Ctrl_Sys_Dir], [Contact - Opex PO Requestor] AS [Contact_-_Opex_PO_Requestor], [Contact - EHS Director] AS [Contact_-_EHS_Director], 
         [Contact - VP Talent Acquisition] AS [Contact_-_VP_Talent_Acquisition], [Contact - CFO NA] AS [Contact_-_CFO_NA], [Contact - Manager IT Service Delivery] AS [Contact_-_Manager_IT_Service_Delivery], [Contact - Sr Director Onsite Power] AS [Contact_-_Sr_Director_Onsite_Power], [Contact - Sr Director of Public Policy] AS [Contact_-_Sr_Director_of_Public_Policy], 
         [Contact - Utility Non-Power Approver] AS [Contact_-_Utility_Non-Power_Approver], [Contact - Controller] AS [Contact_-_Controller], [Contact - Budget Manager] AS [Contact_-_Budget_Manager], [Contact - Chief People and Culture Officer] AS [Contact_-_Chief_People_and_Culture_Officer], [Contact - VP Auto Sys] AS [Contact_-_VP_Auto_Sys], 
         [Contact - Director Corp Sustain] AS [Contact_-_Director_Corp_Sustain], [Contact - Director of Market Dev] AS [Contact_-_Director_of_Market_Dev], [Contact - PO Property] AS [Contact_-_PO_Property], [Contact - VDC Budget Mgr] AS [Contact_-_VDC_Budget_Mgr], [Contact - VP of HR NA] AS [Contact_-_VP_of_HR_NA], 
         [Contact - Director IT Digital Products] AS [Contact_-_Director_IT_Digital_Products], [Contact - Accounts Payable] AS [Contact_-_Accounts_Payable], [Contact - CCF Contract] AS [Contact_-_CCF_Contract], [Contact - Director of Insurance] AS [Contact_-_Director_of_Insurance], [Contact - VP of Construction] AS [Contact_-_VP_of_Construction], 
         [Contact - Manager HR] AS [Contact_-_Manager_HR], [Contact - Director of BizOps] AS [Contact_-_Director_of_BizOps], [Contact - Construction Finance Director] AS [Contact_-_Construction_Finance_Director], [Contact - COO] AS [Contact_-_COO], [Contact - Pay App Draft] AS [Contact_-_Pay_App_Draft], [Contact - EHS Manager] AS [Contact_-_EHS_Manager], 
         [Contact - Manager Security] AS [Contact_-_Manager_Security]
FROM  DataFreedom.DataFreedom.df_Global_Property_Contacts
GO
/****** Object:  View [dbo].[df_Global_Property_Details]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[df_Global_Property_Details]
AS
SELECT [Property Id] AS Property_Id, Type, Code, Name, [Address 1] AS Address_1, [Address 2] AS Address_2, City, State, [Postal Code] AS Postal_Code, Country, Latitude, Longitude, Notes, [International - Legal Entity Id] AS [International_-_Legal_Entity_Id], [International - Legal Entity Code] AS [International_-_Legal_Entity_Code], 
         [International - Legal Entity Name] AS [International_-_Legal_Entity_Name], [International - Tax Authority] AS [International_-_Tax_Authority], [International - Base Currency] AS [International_-_Base_Currency], [International - Tax Opted] AS [International_-_Tax_Opted], [International - Tax Status Changed] AS [International_-_Tax_Status_Changed], 
         [International - Status] AS [International_-_Status], [International - Default_Sales Tax Type] AS [International_-_Default_Sales_Tax_Type], [International - Default Purchase Tax Type] AS [International_-_Default_Purchase_Tax_Type], [International - Taxpoint] AS [International_-_Taxpoint], [International - Report Entity] AS [International_-_Report_Entity], 
         [Accounting Control - Last Closed GL Period] AS [Accounting_Control_-_Last_Closed_GL_Period], [Accounting Control - Last Closed Performance Period] AS [Accounting_Control_-_Last_Closed_Performance_Period], [Accounting Control - Fiscal Year End Month] AS [Accounting_Control_-_Fiscal_Year_End_Month], 
         [Accounting Control - Open AR Month] AS [Accounting_Control_-_Open_AR_Month], [Accounting Control - Open AP Month] AS [Accounting_Control_-_Open_AP_Month], [Accounting Control - Open JE Month] AS [Accounting_Control_-_Open_JE_Month], [Accounting Control - Monthly Charges Last Posted] AS [Accounting_Control_-_Monthly_Charges_Last_Posted], 
         [Accounting Control - Leasing Week Start Date] AS [Accounting_Control_-_Leasing_Week_Start_Date], [Accounting Control - Open Performance Period] AS [Accounting_Control_-_Open_Performance_Period], [Accounting Control - Funding Type] AS [Accounting_Control_-_Funding_Type], 
         [Accounting Control - Apply Receipts to Newest Charges] AS [Accounting_Control_-_Apply_Receipts_to_Newest_Charges], [Accounting Control - Pay Charges by Date First] AS [Accounting_Control_-_Pay_Charges_by_Date_First], [Property Defaults - Is Commercial] AS [Property_Defaults_-_Is_Commercial], 
         [Property Defaults - Is Residential] AS [Property_Defaults_-_Is_Residential], [Property Defaults - Is International] AS [Property_Defaults_-_Is_International], [Property Defaults - Is Affordable] AS [Property_Defaults_-_Is_Affordable], [Property Defaults - Is Student Housing] AS [Property_Defaults_-_Is_Student_Housing], 
         [Property Defaults - Is Association] AS [Property_Defaults_-_Is_Association], [Property Defaults - Is Military] AS [Property_Defaults_-_Is_Military], [Property Defaults - Is Public Housing] AS [Property_Defaults_-_Is_Public_Housing], [Property Defaults - Is Senior Housing] AS [Property_Defaults_-_Is_Senior_Housing], 
         [Property Defaults - Association Type] AS [Property_Defaults_-_Association_Type], [Property Defaults - One Resident per Unit] AS [Property_Defaults_-_One_Resident_per_Unit], [Property Defaults - One Applicant per Unit] AS [Property_Defaults_-_One_Applicant_per_Unit], [Property Defaults - Minimum days Notice] AS [Property_Defaults_-_Minimum_days_Notice], 
         [Property Defaults - Days to Make Ready] AS [Property_Defaults_-_Days_to_Make_Ready], [Property Defaults - Max Hold Days] AS [Property_Defaults_-_Max_Hold_Days], [Property Defaults - NSF Checks then Cash] AS [Property_Defaults_-_NSF_Checks_then_Cash], [Property Defaults - Normal Lease Term] AS [Property_Defaults_-_Normal_Lease_Term], 
         [Property Defaults - Minimum Lease Term] AS [Property_Defaults_-_Minimum_Lease_Term], [Property Defaults - Rounding Lease Term] AS [Property_Defaults_-_Rounding_Lease_Term], [Property Defaults - Round To Previous EOM if Date On/Before] AS [Property_Defaults_-_Round_To_Previous_EOM_if_Date_On-Before], 
         [Property Defaults - Receipt PM Vendor] AS [Property_Defaults_-_Receipt_PM_Vendor], [Property Defaults - Lease Ready Process] AS [Property_Defaults_-_Lease_Ready_Process], [Property Defaults - Charge Next Month if Move in After] AS [Property_Defaults_-_Charge_Next_Month_if_Move_in_After], [Property Defaults - Sales Tax1] AS [Property_Defaults_-_Sales_Tax1], 
         [Property Defaults - Tax Rate1] AS [Property_Defaults_-_Tax_Rate1], [Property Defaults - Tax Charge Code1] AS [Property_Defaults_-_Tax_Charge_Code1], [Property Defaults - Sales Tax2] AS [Property_Defaults_-_Sales_Tax2], [Property Defaults - Tax Rate2] AS [Property_Defaults_-_Tax_Rate2], [Property Defaults - Tax Charge Code2] AS [Property_Defaults_-_Tax_Charge_Code2], 
         [Property Defaults - MTM Flat Fee] AS [Property_Defaults_-_MTM_Flat_Fee], [Property Defaults - MTM Percent of Rent] AS [Property_Defaults_-_MTM_Percent_of_Rent], [Property Defaults - MTM Charge Code] AS [Property_Defaults_-_MTM_Charge_Code], [Property Defaults - Early Term Fee] AS [Property_Defaults_-_Early_Term_Fee], 
         [Property Defaults - Early Term Fee Type] AS [Property_Defaults_-_Early_Term_Fee_Type], [Property Defaults - Early Term Charge Code] AS [Property_Defaults_-_Early_Term_Charge_Code], [Property Defaults - NSF Bank Fee] AS [Property_Defaults_-_NSF_Bank_Fee], [Property Defaults - NSF Bank Fee Account] AS [Property_Defaults_-_NSF_Bank_Fee_Account], 
         [Property Defaults - NSF Tenant Fee] AS [Property_Defaults_-_NSF_Tenant_Fee], [Property Defaults - NSF Tenant Charge Code] AS [Property_Defaults_-_NSF_Tenant_Charge_Code], [Property Defaults - Reset NSF Count on Renewal] AS [Property_Defaults_-_Reset_NSF_Count_on_Renewal], 
         [Property Defaults - Percent of Interest on Deposit] AS [Property_Defaults_-_Percent_of_Interest_on_Deposit], [Property Defaults - Over Budget Book] AS [Property_Defaults_-_Over_Budget_Book], [Property Defaults - No ACH From Check Scanner] AS [Property_Defaults_-_No_ACH_From_Check_Scanner], 
         [Default Accounts - Cash Account Payables Only] AS [Default_Accounts_-_Cash_Account_Payables_Only], [Default Accounts - Payable Account] AS [Default_Accounts_-_Payable_Account], [Default Accounts - Cash Account Receipts Only] AS [Default_Accounts_-_Cash_Account_Receipts_Only], 
         [Default Accounts - Cash Account Security Deposits] AS [Default_Accounts_-_Cash_Account_Security_Deposits], [Default Accounts - Cash Account Direct Debit] AS [Default_Accounts_-_Cash_Account_Direct_Debit], [Default Accounts - GL Allocation Template] AS [Default_Accounts_-_GL_Allocation_Template], 
         [Unit Transfer - Charge Move In Day] AS [Unit_Transfer_-_Charge_Move_In_Day], [Unit Transfer - Charge Move Out Day] AS [Unit_Transfer_-_Charge_Move_Out_Day], [Unit Transfer - Reset NSF Count] AS [Unit_Transfer_-_Reset_NSF_Count], [Unit Transfer - Update Late Feee Info] AS [Unit_Transfer_-_Update_Late_Feee_Info], 
         [Unit Transfer - Transfer Security Deposit Balance] AS [Unit_Transfer_-_Transfer_Security_Deposit_Balance], [Maintenance - Storage Property] AS [Maintenance_-_Storage_Property], [Maintenance - Storage Property Contact] AS [Maintenance_-_Storage_Property_Contact], [Maintenance - Management Vendor] AS [Maintenance_-_Management_Vendor], 
         [Maintenance - Months to Remain on Dashboard] AS [Maintenance_-_Months_to_Remain_on_Dashboard], [Maintenance - WO Email Tech] AS [Maintenance_-_WO_Email_Tech], [Maintenance - WO Limit] AS [Maintenance_-_WO_Limit], [Maintenance - WO Commission Percent] AS [Maintenance_-_WO_Commission_Percent], 
         [Maintenance - WO Commission Payable Account] AS [Maintenance_-_WO_Commission_Payable_Account], [Maintenance - WO Commission Charge Code] AS [Maintenance_-_WO_Commission_Charge_Code], [Maintenance - Hours Difference From Server] AS [Maintenance_-_Hours_Difference_From_Server], 
         [Commerical Configuration - Default Amount Type] AS [Commerical_Configuration_-_Default_Amount_Type], [Commerical Configuration - Default Amount Period] AS [Commerical_Configuration_-_Default_Amount_Period], [Commerical Configuration - Proration Type] AS [Commerical_Configuration_-_Proration_Type], 
         [Commerical Configuration - Recovery End of Year] AS [Commerical_Configuration_-_Recovery_End_of_Year], [Commerical Configuration - Sales End of Year] AS [Commerical_Configuration_-_Sales_End_of_Year], [Commerical Configuration - Separate Holdover Charge] AS [Commerical_Configuration_-_Separate_Holdover_Charge], 
         [Commerical Configuration - Holdover Charge Code] AS [Commerical_Configuration_-_Holdover_Charge_Code], [Commerical Configuration - Require Opening Charges] AS [Commerical_Configuration_-_Require_Opening_Charges], [Commerical Configuration - Segment Recovery] AS [Commerical_Configuration_-_Segment_Recovery], 
         [Commerical Configuration - Advanced Recoveries] AS [Commerical_Configuration_-_Advanced_Recoveries], [Acquisition Date] AS Acquisition_Date, [Acquisition Price] AS Acquisition_Price, [Disposition Date] AS Disposition_Date, [Disposition Price] AS Disposition_Price, [Created Date] AS Created_Date, [Created By] AS Created_By, [Last Modified Date] AS Last_Modified_Date, 
         [Last Modified By] AS Last_Modified_By, [Area - Default Label] AS [Area_-_Default_Label], [Area - Default Label 1] AS [Area_-_Default_Label_1], [Area - Default Label 2] AS [Area_-_Default_Label_2], [Area - Default Label 3] AS [Area_-_Default_Label_3], [Area - Default Label 4] AS [Area_-_Default_Label_4], [Area - Default Label 5] AS [Area_-_Default_Label_5], 
         [Area - Default Label 6] AS [Area_-_Default_Label_6], [Area - Default Label 7] AS [Area_-_Default_Label_7], [Area - Default Label 8] AS [Area_-_Default_Label_8], [Area - Default Label 9] AS [Area_-_Default_Label_9], [Area - Default Label 10] AS [Area_-_Default_Label_10], [Area - Default Label 11] AS [Area_-_Default_Label_11], [Area - Default Label 12] AS [Area_-_Default_Label_12], 
         [Area - Default Label 13] AS [Area_-_Default_Label_13], [Area - Default Label 14] AS [Area_-_Default_Label_14], [Area - Default Label 15] AS [Area_-_Default_Label_15], [Area - Default Label 16] AS [Area_-_Default_Label_16], [Area - Default] AS [Area_-_Default], [Area - Rentable] AS [Area_-_Rentable], [Area - MegaWatts] AS [Area_-_MegaWatts], [Area - Quantity] AS [Area_-_Quantity], 
         [Area - KW] AS [Area_-_KW], [Area - Default (Sum of Units)] AS [Area_-_Default_Sum_of_Units], [Is Active] AS Is_Active, [Inactive Date] AS Inactive_Date, [Attribute - SUBGROUP1] AS [Attribute_-_SUBGROUP1], [Attribute - SUBGROUP2] AS [Attribute_-_SUBGROUP2], [Attribute - SUBGROUP3] AS [Attribute_-_SUBGROUP3], [Attribute - SUBGROUP4] AS [Attribute_-_SUBGROUP4], 
         [Attribute - SUBGROUP5] AS [Attribute_-_SUBGROUP5], [Attribute - SUBGROUP6] AS [Attribute_-_SUBGROUP6], [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM  DataFreedom.DataFreedom.df_Global_Property_Details
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
/****** Object:  View [dbo].[df_Global_Tenant_By_Day_Charges_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_By_Day_Charges_Commercial]
AS
SELECT        [As Of Date] AS As_Of_Date, [Tenant Id] AS Tenant_Id, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, 
                         [Monthly Rent] AS Monthly_Rent, [Monthly MISC] AS Monthly_MISC, [Monthly Common Area Maintenance] AS Monthly_Common_Area_Maintenance, [Monthly Overage] AS Monthly_Overage, 
                         [Monthly Amount - addrent] AS [Monthly_Amount_-_addrent], [Monthly Amount - carrier] AS [Monthly_Amount_-_carrier], [Monthly Amount - definc] AS [Monthly_Amount_-_definc], 
                         [Monthly Amount - enterpri] AS [Monthly_Amount_-_enterpri], [Monthly Amount - ins] AS [Monthly_Amount_-_ins], [Monthly Amount - nonitren] AS [Monthly_Amount_-_nonitren], 
                         [Monthly Amount - opex] AS [Monthly_Amount_-_opex], [Monthly Amount - other] AS [Monthly_Amount_-_other], [Monthly Amount - rent] AS [Monthly_Amount_-_rent], [Monthly Amount - rent2] AS [Monthly_Amount_-_rent2], 
                         [Monthly Amount - rentdm91] AS [Monthly_Amount_-_rentdm91], [Monthly Amount - rentds2] AS [Monthly_Amount_-_rentds2], [Monthly Amount - rentnvv5] AS [Monthly_Amount_-_rentnvv5], 
                         [Monthly Amount - rentnvv6] AS [Monthly_Amount_-_rentnvv6], [Monthly Amount - secdep] AS [Monthly_Amount_-_secdep], [Monthly Amount - tax] AS [Monthly_Amount_-_tax], 
                         [Monthly Amount - tenserv] AS [Monthly_Amount_-_tenserv], [Monthly Amount - termfee] AS [Monthly_Amount_-_termfee], [Monthly Amount - termrecv] AS [Monthly_Amount_-_termrecv], 
                         [Monthly Amount - xconnect] AS [Monthly_Amount_-_xconnect], [Is Current Date] AS Is_Current_Date, [Is First Of Month] AS Is_First_Of_Month, [Is End Of Month] AS Is_End_Of_Month, [Database Id] AS Database_Id, 
                         [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_By_Day_Charges_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Clause_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Clause_Commercial]
AS
SELECT        [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, [Tenant Name] AS Tenant_Name, [Commercial Clause Id] AS Commercial_Clause_Id, [Property Id] AS Property_Id, [Property Code] AS Property_Code, 
                         [Property Name] AS Property_Name, [Amendment Type] AS Amendment_Type, [Amendment Start Date] AS Amendment_Start_Date, [Amendment End Date] AS Amendment_End_Date, 
                         [Amendment Sequence] AS Amendment_Sequence, [Amendment Description] AS Amendment_Description, Name, Description, Reference, [Clause Date] AS Clause_Date, [Unit Id] AS Unit_Id, [Unit Code] AS Unit_Code, 
                         [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Clause_Commercial
GO
/****** Object:  View [dbo].[df_Global_Tenant_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Tenant_Commercial]
AS
SELECT        [Tenant Id] AS Tenant_Id, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, Code, Name, [Lease From Date] AS Lease_From_Date, [Lease To Date] AS Lease_To_Date, 
                         [Move In Date] AS Move_In_Date, [Move Out Date] AS Move_Out_Date, [Current Tenant Status] AS Current_Tenant_Status, [Contracted Area] AS Contracted_Area, [Customer Id] AS Customer_Id, 
                         [Customer Code] AS Customer_Code, [Customer Name] AS Customer_Name, [Original Lease Amendment Status] AS Original_Lease_Amendment_Status, 
                         [Original Lease Amendment Sign Date] AS Original_Lease_Amendment_Sign_Date, [Original Lease Amendment Contracted Area] AS Original_Lease_Amendment_Contracted_Area, 
                         [Original Lease Amendment Term In Months] AS Original_Lease_Amendment_Term_In_Months, Company, [Lease Type] AS Lease_Type, Units, [Lease Type Name] AS Lease_Type_Name, 
                         [Lease Type Category] AS Lease_Type_Category, [Lease Recovery Type] AS Lease_Recovery_Type, [Is Anchor Tenant] AS Is_Anchor_Tenant, [At Risk] AS At_Risk, [Retail Sales Category] AS Retail_Sales_Category, 
                         [Industry Classification Group Code] AS Industry_Classification_Group_Code, [Industry Classification Group Description] AS Industry_Classification_Group_Description, 
                         [Industry Classification Code] AS Industry_Classification_Code, [Industry Classification Description] AS Industry_Classification_Description, [Invoice Bill Day] AS Invoice_Bill_Day, [Bill To Customer] AS Bill_To_Customer, 
                         [Hold Payments] AS Hold_Payments, Payment, [Guarantee Required] AS Guarantee_Required, [Method of Correspondence] AS Method_of_Correspondence, [Correspondence Language] AS Correspondence_Language, 
                         [Method Of Payment] AS Method_Of_Payment, [Company Code] AS Company_Code, [Company Description] AS Company_Description, [Funding Entity Code] AS Funding_Entity_Code, 
                         [Funding Entity Description] AS Funding_Entity_Description, [Default Sales Tran Type] AS Default_Sales_Tran_Type, [Tax Registration Number] AS Tax_Registration_Number, [Lease Currency] AS Lease_Currency, 
                         [Lease Currency Rate Provider] AS Lease_Currency_Rate_Provider, [Lease Currency Rate Type] AS Lease_Currency_Rate_Type, [Retail Sales Currency] AS Retail_Sales_Currency, 
                         [Retail Sales Currency Rate Provider] AS Retail_Sales_Currency_Rate_Provider, [Retail Sales Currency Rate Type] AS Retail_Sales_Currency_Rate_Type, [Late Fee Calculation Type] AS Late_Fee_Calculation_Type, 
                         [Late Fee Percentage] AS Late_Fee_Percentage, [Late Fee Grace Period] AS Late_Fee_Grace_Period, [Late Fee Interest Free Period] AS Late_Fee_Interest_Free_Period, [Late Fee Min Threshold] AS Late_Fee_Min_Threshold, 
                         [Late Fee Max Threshold] AS Late_Fee_Max_Threshold, [Late Fee Additional Fee] AS Late_Fee_Additional_Fee, [Late Fee Calculation Basis] AS Late_Fee_Calculation_Basis, 
                         [Late Fee Charge On Unpaid] AS Late_Fee_Charge_On_Unpaid, [Late Fee Days in Year] AS Late_Fee_Days_in_Year, [Late Fee Interest Index] AS Late_Fee_Interest_Index, 
                         [Late Fee Min Percentage] AS Late_Fee_Min_Percentage, [Late Fee Max Percentage] AS Late_Fee_Max_Percentage, [Late Fee Factor] AS Late_Fee_Factor, [Late Fee Adjustment] AS Late_Fee_Adjustment, 
                         [Late Fee Notes] AS Late_Fee_Notes, Bank, [Account #] AS Account_No, Rating, Business, Employees, Cost, [$/sqft], [Option 1] AS Option_1, Term, [Opt.Date], [Spare 1] AS Spare_1, [Spare 2] AS Spare_2, [Spare 3] AS Spare_3, 
                         [Spare 4] AS Spare_4, [Phone - Office] AS [Phone_-_Office], [Phone - Home] AS [Phone_-_Home], [Phone - FAX] AS [Phone_-_FAX], [Phone - Mobile] AS [Phone_-_Mobile], [Phone - Pager] AS [Phone_-_Pager], 
                         [Phone - Secretary] AS [Phone_-_Secretary], [Phone - Other 1] AS [Phone_-_Other_1], [Phone - Other 2] AS [Phone_-_Other_2], [Phone - Other 3] AS [Phone_-_Other_3], [Phone - Other 4] AS [Phone_-_Other_4], 
                         [Billing Contact First Name] AS Billing_Contact_First_Name, [Billing Contact Last Name] AS Billing_Contact_Last_Name, [Billing Contact Email] AS Billing_Contact_Email, [Billing Contact Phone 1] AS Billing_Contact_Phone_1, 
                         [Billing Contact Phone 2] AS Billing_Contact_Phone_2, [Billing Contact Phone 3] AS Billing_Contact_Phone_3, [Billing Contact Phone 4] AS Billing_Contact_Phone_4, [Billing Contact Phone 5] AS Billing_Contact_Phone_5, 
                         [Billing Contact Phone 6] AS Billing_Contact_Phone_6, [Billing Contact Phone 7] AS Billing_Contact_Phone_7, [Billing Contact Phone 8] AS Billing_Contact_Phone_8, [Billing Contact Phone 9] AS Billing_Contact_Phone_9, 
                         [Billing Contact Phone 10] AS Billing_Contact_Phone_10, [Billing Contact Address Line 1] AS Billing_Contact_Address_Line_1, [Billing Contact Address Line 2] AS Billing_Contact_Address_Line_2, 
                         [Billing Contact Address Line 3] AS Billing_Contact_Address_Line_3, [Billing Contact Address Line 4] AS Billing_Contact_Address_Line_4, [Billing Contact State] AS Billing_Contact_State, 
                         [Billing Contact Zip Code] AS Billing_Contact_Zip_Code, [Billing Contact City] AS Billing_Contact_City, [User Created By] AS User_Created_By, [Date Created] AS Date_Created, 
                         [User Last Modified By] AS User_Last_Modified_By, [Active Renewal Options] AS Active_Renewal_Options, [Number Active Renewal Options] AS Number_Active_Renewal_Options, 
                         [Earliest Renewal Option Expiration Date] AS Earliest_Renewal_Option_Expiration_Date, [Earliest Termination Option Expiration Date] AS Earliest_Termination_Option_Expiration_Date, 
                         [Security Deposit Required Amount] AS Security_Deposit_Required_Amount, [Security Deposit Received Amount] AS Security_Deposit_Received_Amount, 
                         [Bank Guarantee Required Amount] AS Bank_Guarantee_Required_Amount, [Bank Guarantee Received Amount] AS Bank_Guarantee_Received_Amount, Notes, [Date Modified] AS Date_Modified, 
                         [Current Monthly Rent] AS Current_Monthly_Rent, [Current Monthly MISC] AS Current_Monthly_MISC, [Current Monthly Common Area Maintenance] AS Current_Monthly_Common_Area_Maintenance, 
                         [Current Monthly Overage] AS Current_Monthly_Overage, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Tenant_Commercial
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
/****** Object:  View [dbo].[df_Global_Unit_By_Day_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Unit_By_Day_Commercial]
AS
SELECT        [As Of Date] AS As_Of_Date, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Building Id] AS Building_Id, [Floor Code] AS Floor_Code, [Floor Description] AS Floor_Description,
                          [Floor Level] AS Floor_Level, [Unit Id] AS Unit_Id, Code, Name, [Address 1] AS Address_1, [Address 2] AS Address_2, City, State, [Postal Code] AS Postal_Code, Country, [Unit Type Code] AS Unit_Type_Code, 
                         [Unit Type Description] AS Unit_Type_Description, [Rental Type] AS Rental_Type, [Rental Type Group] AS Rental_Type_Group, Location, [Voyager URL] AS Voyager_URL, [Is Physically Occupied] AS Is_Physically_Occupied, 
                         [Current Tenant Id] AS Current_Tenant_Id, [Current Tenant Code] AS Current_Tenant_Code, [Current Tenant Name] AS Current_Tenant_Name, [Current Amendment Id] AS Current_Amendment_Id, 
                         [Current Amendment Type] AS Current_Amendment_Type, [Current Amendment Lease From] AS Current_Amendment_Lease_From, [Current Amendment Lease To] AS Current_Amendment_Lease_To, 
                         [Current Amendment Move In] AS Current_Amendment_Move_In, [Current Amendment Move Out] AS Current_Amendment_Move_Out, [Is Committed] AS Is_Committed, [Current Occupancy Expiry] AS Current_Occupancy_Expiry, 
                         [Next Termination Option Lessee] AS Next_Termination_Option_Lessee, [Next Termination Option Lessor] AS Next_Termination_Option_Lessor, [Is Excluded] AS Is_Excluded, 
                         [Attribute - User defined 1] AS [Attribute_-_User_defined_1], [Attribute - User defined 2] AS [Attribute_-_User_defined_2], [Attribute - User defined 3] AS [Attribute_-_User_defined_3], 
                         [Attribute - User defined 4] AS [Attribute_-_User_defined_4], [Attribute - User defined 5] AS [Attribute_-_User_defined_5], [Attribute - User defined 6] AS [Attribute_-_User_defined_6], 
                         [Attribute - User defined 7] AS [Attribute_-_User_defined_7], [Attribute - User defined 8] AS [Attribute_-_User_defined_8], [Attribute - User defined 9] AS [Attribute_-_User_defined_9], 
                         [Attribute - User defined 10] AS [Attribute_-_User_defined_10], Notes, [Forecasting Commercial MLA] AS Forecasting_Commercial_MLA, [Forecasting Market Rent Method] AS Forecasting_Market_Rent_Method, 
                         [Forecasting Market Rent Adjustment Method] AS Forecasting_Market_Rent_Adjustment_Method, [Forecasting Amount] AS Forecasting_Amount, [Forecasting Percent] AS Forecasting_Percent, 
                         [Forecasting Unit Forecasted Termination Date] AS Forecasting_Unit_Forecasted_Termination_Date, [Forecasting Lease Type] AS Forecasting_Lease_Type, 
                         [Forecasting Market Date Method] AS Forecasting_Market_Date_Method, [Forecasting Override Market Date] AS Forecasting_Override_Market_Date, [Created By] AS Created_By, [Created Date] AS Created_Date, 
                         [Last Modified By] AS Last_Modified_By, [Last Modified Date] AS Last_Modified_Date, [Last Measurement Date] AS Last_Measurement_Date, [Area - Default] AS [Area_-_Default], [Occupied Area] AS Occupied_Area, 
                         [Area - Rentable] AS [Area_-_Rentable], [Area - MegaWatts] AS [Area_-_MegaWatts], [Area - Quantity] AS [Area_-_Quantity], [Area - KW] AS [Area_-_KW], [Market Rent as at Date] AS Market_Rent_as_at_Date, 
                         [Monthly Market Rent] AS Monthly_Market_Rent, [Monthly Market Rent per Area - Default] AS [Monthly_Market_Rent_per_Area_-_Default], 
                         [Monthly Market Rent per Area - Rentable] AS [Monthly_Market_Rent_per_Area_-_Rentable], [Monthly Market Rent per Area - MegaWatts] AS [Monthly_Market_Rent_per_Area_-_MegaWatts], 
                         [Monthly Market Rent per Area - Quantity] AS [Monthly_Market_Rent_per_Area_-_Quantity], [Monthly Market Rent per Area - KW] AS [Monthly_Market_Rent_per_Area_-_KW], [Monthly Rent] AS Monthly_Rent, 
                         [Monthly Rent per Area - Default] AS [Monthly_Rent_per_Area_-_Default], [Monthly Rent per Area - Rentable] AS [Monthly_Rent_per_Area_-_Rentable], 
                         [Monthly Rent per Area - MegaWatts] AS [Monthly_Rent_per_Area_-_MegaWatts], [Monthly Rent per Area - Quantity] AS [Monthly_Rent_per_Area_-_Quantity], [Monthly Rent per Area - KW] AS [Monthly_Rent_per_Area_-_KW], 
                         [Is Current Date] AS Is_Current_Date, [Is First Of Month] AS Is_First_Of_Month, [Is End Of Month] AS Is_End_Of_Month, [Building Code] AS Building_Code, [Building Name] AS Building_Name, [Building Lot] AS Building_Lot, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Unit_By_Day_Commercial
GO
/****** Object:  View [dbo].[df_Global_Unit_Commercial]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Unit_Commercial]
AS
SELECT        [As Of Date] AS As_Of_Date, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Property Name] AS Property_Name, [Building Id] AS Building_Id, [Floor Code] AS Floor_Code, [Floor Description] AS Floor_Description,
                          [Floor Level] AS Floor_Level, [Unit Id] AS Unit_Id, Code, Name, [Address 1] AS Address_1, [Address 2] AS Address_2, City, State, [Postal Code] AS Postal_Code, Country, [Unit Type Code] AS Unit_Type_Code, 
                         [Unit Type Description] AS Unit_Type_Description, [Rental Type] AS Rental_Type, [Rental Type Group] AS Rental_Type_Group, Location, [Voyager URL] AS Voyager_URL, [Is Physically Occupied] AS Is_Physically_Occupied, 
                         [Current Tenant Id] AS Current_Tenant_Id, [Current Tenant Code] AS Current_Tenant_Code, [Current Tenant Name] AS Current_Tenant_Name, [Current Amendment Id] AS Current_Amendment_Id, 
                         [Current Amendment Type] AS Current_Amendment_Type, [Current Amendment Lease From] AS Current_Amendment_Lease_From, [Current Amendment Lease To] AS Current_Amendment_Lease_To, 
                         [Current Amendment Move In] AS Current_Amendment_Move_In, [Current Amendment Move Out] AS Current_Amendment_Move_Out, [Is Committed] AS Is_Committed, [Current Occupancy Expiry] AS Current_Occupancy_Expiry, 
                         [Next Termination Option Lessee] AS Next_Termination_Option_Lessee, [Next Termination Option Lessor] AS Next_Termination_Option_Lessor, [Is Excluded] AS Is_Excluded, 
                         [Attribute - User defined 1] AS [Attribute_-_User_defined_1], [Attribute - User defined 2] AS [Attribute_-_User_defined_2], [Attribute - User defined 3] AS [Attribute_-_User_defined_3], 
                         [Attribute - User defined 4] AS [Attribute_-_User_defined_4], [Attribute - User defined 5] AS [Attribute_-_User_defined_5], [Attribute - User defined 6] AS [Attribute_-_User_defined_6], 
                         [Attribute - User defined 7] AS [Attribute_-_User_defined_7], [Attribute - User defined 8] AS [Attribute_-_User_defined_8], [Attribute - User defined 9] AS [Attribute_-_User_defined_9], 
                         [Attribute - User defined 10] AS [Attribute_-_User_defined_10], Notes, [Forecasting Commercial MLA] AS Forecasting_Commercial_MLA, [Forecasting Market Rent Method] AS Forecasting_Market_Rent_Method, 
                         [Forecasting Market Rent Adjustment Method] AS Forecasting_Market_Rent_Adjustment_Method, [Forecasting Amount] AS Forecasting_Amount, [Forecasting Percent] AS Forecasting_Percent, 
                         [Forecasting Unit Forecasted Termination Date] AS Forecasting_Unit_Forecasted_Termination_Date, [Forecasting Lease Type] AS Forecasting_Lease_Type, 
                         [Forecasting Market Date Method] AS Forecasting_Market_Date_Method, [Forecasting Override Market Date] AS Forecasting_Override_Market_Date, [Created By] AS Created_By, [Created Date] AS Created_Date, 
                         [Last Modified By] AS Last_Modified_By, [Last Modified Date] AS Last_Modified_Date, [Last Measurement Date] AS Last_Measurement_Date, [Area - Default] AS [Area_-_Default], [Occupied Area] AS Occupied_Area, 
                         [Area - Rentable] AS [Area_-_Rentable], [Area - MegaWatts] AS [Area_-_MegaWatts], [Area - Quantity] AS [Area_-_Quantity], [Area - KW] AS [Area_-_KW], [Market Rent as at Date] AS Market_Rent_as_at_Date, 
                         [Monthly Market Rent] AS Monthly_Market_Rent, [Monthly Market Rent per Area - Default] AS [Monthly_Market_Rent_per_Area_-_Default], 
                         [Monthly Market Rent per Area - Rentable] AS [Monthly_Market_Rent_per_Area_-_Rentable], [Monthly Market Rent per Area - MegaWatts] AS [Monthly_Market_Rent_per_Area_-_MegaWatts], 
                         [Monthly Market Rent per Area - Quantity] AS [Monthly_Market_Rent_per_Area_-_Quantity], [Monthly Market Rent per Area - KW] AS [Monthly_Market_Rent_per_Area_-_KW], [Monthly Rent] AS Monthly_Rent, 
                         [Monthly Rent per Area - Default] AS [Monthly_Rent_per_Area_-_Default], [Monthly Rent per Area - Rentable] AS [Monthly_Rent_per_Area_-_Rentable], 
                         [Monthly Rent per Area - MegaWatts] AS [Monthly_Rent_per_Area_-_MegaWatts], [Monthly Rent per Area - Quantity] AS [Monthly_Rent_per_Area_-_Quantity], [Monthly Rent per Area - KW] AS [Monthly_Rent_per_Area_-_KW], 
                         [Is Current Date] AS Is_Current_Date, [Is First Of Month] AS Is_First_Of_Month, [Is End Of Month] AS Is_End_Of_Month, [Building Code] AS Building_Code, [Building Name] AS Building_Name, [Building Lot] AS Building_Lot, 
                         [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Unit_Commercial
GO
/****** Object:  View [dbo].[df_Global_Vendor]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Global_Vendor]
AS
SELECT        [Vendor Id] AS Vendor_Id, Code, Name, [First Name] AS First_Name, Dear, Contact, [Address 1] AS Address_1, [Address 2] AS Address_2, [Address 3] AS Address_3, City, State, [Postal Code] AS Postal_Code, Email, 
                         [Alternate Email] AS Alternate_Email, [Phone - Office] AS [Phone_-_Office], [Phone - Home] AS [Phone_-_Home], [Phone - FAX] AS [Phone_-_FAX], [Phone - Mobile] AS [Phone_-_Mobile], [Phone - Pager] AS [Phone_-_Pager], 
                         [Phone - Secretary] AS [Phone_-_Secretary], [Phone - Other 1] AS [Phone_-_Other_1], [Phone - Other 2] AS [Phone_-_Other_2], [Phone - Other 3] AS [Phone_-_Other_3], [Phone - Other 4] AS [Phone_-_Other_4], 
                         [Payment Method] AS Payment_Method, [Consolidate Checks] AS Consolidate_Checks, [Check Memo From Invoice] AS Check_Memo_From_Invoice, [Hold Payments] AS Hold_Payments, [PO Required] AS PO_Required, 
                         [No Signature] AS No_Signature, [On Checks Over] AS On_Checks_Over, [Check Memo] AS Check_Memo, [No Duplicate Invoice On Same Date] AS No_Duplicate_Invoice_On_Same_Date, 
                         [Stop Purchase Orders] AS Stop_Purchase_Orders, [Workflow Name] AS Workflow_Name, [Workflow Status] AS Workflow_Status, [Gets 1099] AS Gets_1099, [US Tax Id] AS US_Tax_Id, [US Tax Name] AS US_Tax_Name, 
                         [US Sales Tax Percent] AS US_Sales_Tax_Percent, [Tax Registered] AS Tax_Registered, [Tax Authority Code] AS Tax_Authority_Code, [Tax Authority Name] AS Tax_Authority_Name, 
                         [Tran Type Domestic] AS Tran_Type_Domestic, [Tran Type Cross Border] AS Tran_Type_Cross_Border, [Tax Point] AS Tax_Point, Status, [Is Active] AS Is_Active, [Inactive Date] AS Inactive_Date, [Is Employee] AS Is_Employee, 
                         [Is SubContractor] AS Is_SubContractor, Priority, [Requires Contract] AS Requires_Contract, [Is Preferred Supplier] AS Is_Preferred_Supplier, [Supplier Region] AS Supplier_Region, 
                         [Default Expense Type] AS Default_Expense_Type, [Default Display Type] AS Default_Display_Type, [Retention Percent] AS Retention_Percent, [Vendor URL] AS Vendor_URL, Notes, [Discount Percent] AS Discount_Percent, 
                         [Discount Days] AS Discount_Days, [Discount Day Type] AS Discount_Day_Type, [Payment Terms] AS Payment_Terms, [Is Due End Of Next Month] AS Is_Due_End_Of_Next_Month, 
                         [Workers Comp Insurance Expiry Date] AS Workers_Comp_Insurance_Expiry_Date, [Liability Insurance Expiry Date] AS Liability_Insurance_Expiry_Date, [Custom - Tag] AS [Custom_-_Tag], 
                         [Custom - Priority] AS [Custom_-_Priority], [Custom - Prop Prompt] AS [Custom_-_Prop_Prompt], [Custom - SUA Only] AS [Custom_-_SUA_Only], [Custom - Manual Payment Only] AS [Custom_-_Manual_Payment_Only], 
                         [Created Date] AS Created_Date, [Created By] AS Created_By, [Last Modified Date] AS Last_Modified_Date, [Last Modified By] AS Last_Modified_By, [Workflow Completed Date] AS Workflow_Completed_Date, Language, 
                         [Memo Count] AS Memo_Count, [Attachment Count] AS Attachment_Count, [Active Contact Count] AS Active_Contact_Count, [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, 
                         [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Global_Vendor
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
/****** Object:  View [dbo].[df_Maintenance_Asset]    Script Date: 1/30/2024 12:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[df_Maintenance_Asset]
AS
SELECT        [Asset Id] AS Asset_Id, Code, Name, [Property Id] AS Property_Id, [Property Code] AS Property_Code, [Unit Id] AS Unit_Id, [Unit Code] AS Unit_Code, [Tenant Id] AS Tenant_Id, [Tenant Code] AS Tenant_Code, 
                         [Asset Type Code] AS Asset_Type_Code, [Asset Type Name] AS Asset_Type_Name, [Item Type Id] AS Item_Type_Id, [Item Type Code] AS Item_Type_Code, [Item Type Description] AS Item_Type_Description, Make, Model, 
                         [Serial Number] AS Serial_Number, [Recurring Work Order Description] AS Recurring_Work_Order_Description, [Next Due Date] AS Next_Due_Date, [Purchase Date] AS Purchase_Date, [Retired Date] AS Retired_Date, Life, 
                         [Purchase Price] AS Purchase_Price, Status, [Replace Date] AS Replace_Date, [Replace Cost] AS Replace_Cost, Notes, [Custom - VDC Storage LOC] AS [Custom_-_VDC_Storage_LOC], 
                         [Custom - VDC Destination LOC] AS [Custom_-_VDC_Destination_LOC], [Custom - VDC MNF Status] AS [Custom_-_VDC_MNF_Status], [Custom - VDC MW Capacity] AS [Custom_-_VDC_MW_Capacity], 
                         [Voyager URL] AS Voyager_URL, [Database Id] AS Database_Id, [Source Data Through] AS Source_Data_Through
FROM            DataFreedom.DataFreedom.df_Maintenance_Asset
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

