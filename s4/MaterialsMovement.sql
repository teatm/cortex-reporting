SELECT
  matdoc.MANDT AS Client_MANDT,
  matdoc.MBLNR AS NumberOfMaterialDocument_MBLNR,
  matdoc.MJAHR AS MaterialDocumentYear_MJAHR,
  matdoc.ZEILE AS ItemInMaterialDocument_ZEILE,
  matdoc.MATNR AS MaterialNumber_MATNR,
  matdoc.CHARG AS BatchNumber_CHARG,
  matdoc.WERKS AS Plant_WERKS,
  matdoc.LGORT AS StorageLocation_LGORT,
  matdoc.BWART AS MovementType_BWART,
  matdoc.INSMK AS StockType_INSMK,
  matdoc.SHKZG AS Debit_CreditIndicator_SHKZG,
  matdoc.MENGE AS Quantity_MENGE,
  matdoc.MEINS AS BaseUnitOfMeasure_MEINS,
  matdoc.DMBTR AS AmountInLocalCurrency_DMBTR,
  matdoc.WAERS AS CurrencyKey_WAERS,
  matdoc.EBELN AS PurchaseOrderNumber_EBELN,
  matdoc.LIFNR AS VendorsAccountNumber_LIFNR,
  matdoc.KDAUF AS SalesOrderNumber_KDAUF,
  matdoc.KUNNR AS AccountNumberOfCustomer_KUNNR,
  matdoc.UMMAT AS Receiving_IssuingMaterial_UMMAT,
  matdoc.UMCHA AS Receiving_Issuing_Batch_UMCHA,
  matdoc.EBELP AS ItemNumberOfPurchasingDocument_EBELP,
  matdoc.LFBNR AS DocumentNumberOfAReferenceDocument_LFBNR,
  matdoc.LFPOS AS ItemOfAReferenceDocument_LFPOS,
  matdoc.AUFNR AS OrderNumber_AUFNR,
  matdoc.BUKRS AS CompanyCode_BUKRS,
  matdoc.UMWRK AS ReceivingPlant_UMWRK,
  matdoc.UMLGO AS Receiving_IssuingStorageLocation_UMLGO,
  matdoc.LGNUM AS WarehouseNumber_LGNUM,
  matdoc.BWLVS AS MovementTypeForWarehouseManagement_BWLVS,
  matdoc.XBLVS AS Indicator_PostingInWarehouseManagementSystem_XBLVS,
  matdoc.BESTQ AS StockCategoryInTheWarehouseManagementSystem_BESTQ,
  matdoc.SOBKZ AS SpecialStockIndicator_SOBKZ,
  matdoc.KZBEW AS MovementIndicator_KZBEW,
  matdoc.GRUND AS ReasonForMovement_GRUND,
  matdoc.WEUNB AS GoodsReceipt_Non_Valuated_WEUNB,
  matdoc.LGTYP AS StorageType_LGTYP,
  matdoc.EQUNR AS EquipmentNumber_EQUNR,
  matdoc.GSBER AS BusinessArea_GSBER,
  matdoc.KOSTL AS CostCenter_KOSTL,
  matdoc.PRCTR AS ProfitCenter_PRCTR,
  matdoc.PS_PSP_PNR AS WorkBreakdownStructureElement_PS_PSP_PNR,
  matdoc.SAKTO AS GLAccountNumber_SAKTO,
  matdoc.BUDAT AS PostingDateInTheDocument_BUDAT,
  matdoc.SHKUM AS Debit_CreditIndicatorInRevaluation_SHKUM,
  matdoc.BWTAR AS ValuationType_BWTAR,
  matdoc.KZZUG AS ReceiptIndicator_KZZUG
-- matdoc.KEY1 AS Split_GUID_Part1_KEY1,
-- matdoc.KEY2 AS Split_GUID_Part2_KEY2,
-- matdoc.KEY3 AS Split_GUID_Part3_KEY3,
-- matdoc.KEY4 AS Split_GUID_Part4_KEY4,
-- matdoc.KEY5 AS Split_GUID_Part5_KEY5,
-- matdoc.KEY6 AS Split_GUID_Part6_KEY6,
-- matdoc.RECORD_TYPE AS RecordType_RECORD_TYPE,
-- matdoc.HEADER_COUNTER AS MaterialDocumentCounter_HEADER_COUNTER,
-- matdoc.MATBF AS MaterialInRespectOfWhichStockIsManaged_MATBF,
-- matdoc.LGORT_SID AS StorageLocation_StockIdentifier_LGORT_SID,
-- matdoc.CHARG_SID AS BatchNumber_StockIdentifier_CHARG_SID,
-- matdoc.LIFNR_SID AS SupplierForSpecialStock_LIFNR_SID,
-- matdoc.MAT_KDAUF AS SalesOrderNumberOfValuatedSalesOrderStock_MAT_KDAUF,
-- matdoc.MAT_KDPOS AS SalesOrderItemOfValuatedSalesOrderStock_MAT_KDPOS,
-- matdoc.MAT_PSPNR AS ValuatedSalesOrderStock_WBS_Element_MAT_PSPNR,
-- matdoc.KUNNR_SID AS CustomerForSpecialStock_KUNNR_SID,
-- matdoc.LBBSA_SID AS StockTypeOfGoodsMovement_StockIdentifier_LBBSA_SID,
-- matdoc.DISUB_OWNER_SID AS AdditionalSupplierForSpecialStock_DISUB_OWNER_SID,
-- matdoc.RESOURCENAME_SID AS ResourceName_StockIdentifier_RESOURCENAME_SID,
-- matdoc.CHARG_WHS_SG AS BatchNumberOfWarehouseStock_StockIdentifier_CHARG_WHS_SG,
-- matdoc.MENGU AS QuantityUpdatingInMaterialMasterRecord_MENGU,
-- matdoc.WERTU AS ValueUpdatingInMaterialMasterRecord_WERTU,
-- matdoc.VBOBJ_SG AS SDDocumentObject_VBOBJ_SG,
-- matdoc.KZBWS AS ValuationOfSpecialStock_KZBWS,
-- matdoc.BSTAUS_SG AS StockCharacteristics_BSTAUS_SG,
-- matdoc.BSTTYP_SG AS StockCategory_BSTTYP_SG,
-- matdoc.KALNR AS CostEstimateNumber_ProductCosting_KALNR,
-- matdoc.BERID AS MRPArea_BERID,
-- matdoc.BNBTR AS DeliveryCostsInLocalCurrency_BNBTR,
-- matdoc.BUALT AS AmountPostedInAlternativePriceControl_BUALT,
-- matdoc.DMBUM AS RevaluationAmountOnBack_PostingToAPreviousPeriod_DMBUM,
-- matdoc.EXBWR AS ExternallyEnteredPostingAmountInLocalCurrency_EXBWR,
-- matdoc.VKWRT AS ValueAtSalesPricesIncludingValue_AddedTax_VKWRT,
-- matdoc.EXVKW AS ExternallyEnteredSalesValueInLocalCurrency_EXVKW,
-- matdoc.SALK3 AS ValueOfTotalValuatedStockBeforeThePosting_SALK3,
-- matdoc.VKWRA AS ValueAtSalesPricesExcludingValueAddedTax_VKWRA,
-- matdoc.J_1BEXBASE AS AlternateBaseAmountInDocumentCurrency_J_1BEXBASE,
-- matdoc.STOCK_VKWRT AS ValueAtSalesPricesIncludingValue_AddedTax_STOCK_VKWRT,
-- matdoc.DMBTR_STOCK AS AmountInLocalCurrencyWithSignOfStockQuantity_DMBTR_STOCK,
-- matdoc.DMBTR_CONS AS AmountInLocalCurrencyWithSignOfConsumptionQuantity_DMBTR_CONS,
-- matdoc.LBKUM AS TotalValuatedStockBeforeThePosting_LBKUM,
-- matdoc.STOCK_QTY AS StockQuantity_STOCK_QTY,
-- matdoc.CONSUMPTION_QTY AS ConsumptionQuantity_CONSUMPTION_QTY,
-- matdoc.ERFME AS UnitOfEntry_ERFME,
-- matdoc.ERFMG AS QuantityInUnitOfEntry_ERFMG,
-- matdoc.BPRME AS OrderPriceUnit_Purchasing_BPRME,
-- matdoc.BPMNG AS QuantityInPurchaseOrderPriceUnit_BPMNG,
-- matdoc.BSTME AS PurchaseOrderUnitOfMeasure_BSTME,
-- matdoc.BSTMG AS GoodsReceiptQuantityInOrderUnit_BSTMG,
-- matdoc.LSMEH AS UnitOfMeasureFromDeliveryNote_LSMEH,
-- matdoc.LSMNG AS QuantityInUnitOfMeasureFromDeliveryNote_LSMNG,
-- matdoc.PBAMG AS Quantity_PBAMG,
-- matdoc.CURRENCY_A1 AS AnalyticalCurrencyOfWarehouseStock_NotUsed_CURRENCY_A1,
-- matdoc.PRICE_A1 AS AnalyticalPriceOfOneBaseUnitOfMeasure_NotUsed_PRICE_A1,
-- matdoc.PRICE_SOURCE_A1 AS IndicatorForAnalyticalValueOfPriceSource_NotUsed_PRICE_SOURCE_A1,
-- matdoc.STOCK_VALUE_A1 AS AnalyticalValueOfWarehouseStock_NotUsed_STOCK_VALUE_A1,
-- matdoc.CONS_VALUE_A1 AS AnalyticalValueOfConsumptionQuantity_NotUsed_CONS_VALUE_A1,
-- matdoc.CWM_MENGE AS QuantityInParallelUnitOfMeasure_CWM_MENGE,
-- matdoc.CWM_MEINS AS ParallelUnitOfMeasure_CWM_MEINS,
-- matdoc.CWM_ERFMG AS QuantityInParallelUnitOfEntry_CWM_ERFMG,
-- matdoc.CWM_ERFME AS PUoMEntryUnitOfMeasure_CWM_ERFME,
-- matdoc.CWM_STOCK_QTY AS StockQuantityInPUoM_CWM_STOCK_QTY,
-- matdoc.CWM_CONSUMPTION_QTY AS ConsumptionQuantityInPUoM_CWM_CONSUMPTION_QTY,
-- matdoc.CWM_MEINS_SID AS ParallelUnitOfMeasure_StockIdentifier_CWM_MEINS_SID,
-- matdoc.UMMAB_CID AS Receiving_IssuingMaterial_UMMAB_CID,
-- matdoc.UMWRK_CID AS Plant_UMWRK_CID,
-- matdoc.LGORT_CID AS StorageLocation_StockIdentifier_LGORT_CID,
-- matdoc.CHARG_CID AS BatchNumber_StockIdentifier_CHARG_CID,
-- matdoc.LIFNR_CID AS SupplierForSpecialStock_LIFNR_CID,
-- matdoc.MAT_KDAUF_CID AS SalesAndDistributionDocumentNumber_StockIdentifier_MAT_KDAUF_CID,
-- matdoc.MAT_KDPOS_CID AS ItemNumberOfTheSDDocument_StockIdentifier_MAT_KDPOS_CID,
-- matdoc.MAT_PSPNR_CID AS WorkBreakdownStructureElement_StockIdentifier_MAT_PSPNR_CID,
-- matdoc.KUNNR_CID AS CustomerForSpecialStock_KUNNR_CID,
-- matdoc.UMSOK_CID AS SpecialStockIndicator_UMSOK_CID,
-- matdoc.LBBSA_CID AS StockTypeOfGoodsMovement_StockIdentifier_LBBSA_CID,
-- matdoc.DISUB_OWNER_CID AS AccountNumberOfVendorOrCreditor_DISUB_OWNER_CID,
-- matdoc.RESOURCENAME_CID AS ResourceName_StockIdentifierComplement_RESOURCENAME_CID,
-- matdoc.UMBUK_CG AS CompanyCode_UMBUK_CG,
-- matdoc.CHARG_WHS_CG AS BatchNumberOfWarehouseStock_StockIdentifier_CHARG_WHS_CG,
-- matdoc.UMMEN_CG AS QuantityUpdatingInMaterialMasterRecord_UMMEN_CG,
-- matdoc.UMWER_CG AS ValueUpdatingInMaterialMasterRecord_UMWER_CG,
-- matdoc.VBOBJ_CG AS SD_DocumentObject_VBOBJ_CG,
-- matdoc.UMKZBWS_CG AS ValuationOfSpecialStock_UMKZBWS_CG,
-- matdoc.BSTAUS_CG AS StockCharacteristics_BSTAUS_CG,
-- matdoc.BSTTYP_CG AS StockCategory_BSTTYP_CG,
-- matdoc.KALNR_CG AS ComplementCostEstimateNumber_ProductCosting_KALNR_CG,
-- matdoc.CPUDT AS DayOnWhichAccountingDocumentWasEntered_CPUDT,
-- matdoc.CPUTM AS TimeOfEntry_CPUTM,
-- matdoc.YEARDAY_BUDAT AS Year_Day_Combination_YEARDAY_BUDAT,
-- matdoc.YEARWEEK_BUDAT AS Year_Week_Combination_YEARWEEK_BUDAT,
-- matdoc.YEARMONTH_BUDAT AS Year_Month_Combination_YEARMONTH_BUDAT,
-- matdoc.YEARQUARTER_BUDAT AS Year_Quarter_Combination_YEARQUARTER_BUDAT,
-- matdoc.YEAR_BUDAT AS Year_YEAR_BUDAT,
-- matdoc.QUARTER_BUDAT AS Quarter_1_4_QUARTER_BUDAT,
-- matdoc.MONTH_BUDAT AS Month_1_12_MONTH_BUDAT,
-- matdoc.WEEK_BUDAT AS CalendarWeek_1_53_WEEK_BUDAT,
-- matdoc.DAY_BUDAT AS DayOfYear_1_366_DAY_BUDAT,
-- matdoc.WEEKDAY_BUDAT AS WeekDay_WEEKDAY_BUDAT,
-- matdoc.BLDAT AS DocumentDateInDocument_BLDAT,
-- matdoc.AEDAT AS DateOfLastChange_AEDAT,
-- matdoc.SPE_BUDAT_UHR AS TimeOfGoodsIssue_Local_RelatingToAPlant_SPE_BUDAT_UHR,
-- matdoc.SPE_BUDAT_ZONE AS TimeZone_SPE_BUDAT_ZONE,
-- matdoc.PERIV AS FiscalYearVariant_PERIV,
-- matdoc.GJAHR AS FiscalYear_GJAHR,
-- matdoc.GJPER AS Period_Year_GJPER,
-- matdoc.GJPER_CURR_PER AS Period_Year_GJPER_CURR_PER,
-- matdoc.VFDAT AS ShelfLifeExpirationOrBest_BeforeDate_VFDAT,
-- matdoc.DABRBZ AS ReferenceDateForSettlement_DABRBZ,
-- matdoc.DABRZ AS ReferenceDateForSettlement_DABRZ,
-- matdoc.HSDAT AS DateOfManufacture_HSDAT,
-- matdoc.LINE_ID AS UniqueIdentificationOfDocumentLine_LINE_ID,
-- matdoc.PARENT_ID AS IdentifierOfImmediatelySuperiorLine_PARENT_ID,
-- matdoc.LINE_DEPTH AS HierarchyLevelOfLineInDocument_LINE_DEPTH,
-- matdoc.MAA_URZEI AS OriginalLineForAccountAssignmentItemInMaterialDocument_MAA_URZEI,
-- matdoc.KDPOS AS ItemNumberInSalesOrder_KDPOS,
-- matdoc.KDEIN AS DeliveryScheduleForSalesOrder_KDEIN,
-- matdoc.LFBJA AS FiscalYearOfAReferenceDocument_LFBJA,
-- matdoc.SJAHR AS MaterialDocumentYear_SJAHR,
-- matdoc.SMBLN AS NumberOfMaterialDocument_SMBLN,
-- matdoc.SMBLP AS ItemInMaterialDocument_SMBLP,
-- matdoc.ANLN1 AS MainAssetNumber_ANLN1,
-- matdoc.ANLN2 AS AssetSubnumber_ANLN2,
-- matdoc.BELNR AS AccountingDocumentNumber_BELNR,
-- matdoc.BUZEI AS NumberOfLineItemWithinAccountingDocument_BUZEI,
-- matdoc.BELUM AS AccountingDocumentNumber_BELUM,
-- matdoc.BUZUM AS NumberOfLineItemWithinAccountingDocument_BUZUM,
-- matdoc.RSNUM AS NumberOfReservation_DependentRequirements_RSNUM,
-- matdoc.RSPOS AS ItemNumberOfReservation_DependentRequirements_RSPOS,
-- matdoc.TBNUM AS TransferRequirementNumber_TBNUM,
-- matdoc.TBPOS AS TransferRequirementItem_TBPOS,
-- matdoc.UBNUM AS PostingChangeNumber_UBNUM,
-- matdoc.TANUM AS TransferOrderNumber_TANUM,
-- matdoc.URZEI AS OriginalLineInMaterialDocument_URZEI,
-- matdoc.XBLNR AS ReferenceDocumentNumber_XBLNR,
-- matdoc.VBELN_IM AS Delivery_VBELN_IM,
-- matdoc.VBELP_IM AS DeliveryItem_VBELP_IM,
-- matdoc.LE_VBELN AS Delivery_LE_VBELN,
-- matdoc.SPE_LOGSYS AS LogicalSystemOfEWMMaterialDocument_SPE_LOGSYS,
-- matdoc.SPE_MDNUM_EWM AS NumberOfMaterialDocumentInEWM_SPE_MDNUM_EWM,
-- matdoc.CANCELLED AS ItemHasBeenCancelled_CANCELLED,
-- matdoc.CANCELLATION_TYPE AS RelevanceForAnalytics_CANCELLATION_TYPE,
-- matdoc.REVERSAL_MOVEMENT AS ReversalMovementType_REVERSAL_MOVEMENT,
-- matdoc.SERVICE_DOC_TYPE AS ServiceDocumentType_SERVICE_DOC_TYPE,
-- matdoc.SERVICE_DOC_ID AS ServiceDocumentID_SERVICE_DOC_ID,
-- matdoc.SERVICE_DOC_ITEM_ID AS ServiceDocumentItemID_SERVICE_DOC_ITEM_ID,
-- matdoc.EWM_LGNUM AS WarehouseNumber_WarehouseComplex_EWM_LGNUM,
-- matdoc.EWM_GMDOC AS WarehouseDocumentForGoodsMovement_EWM_GMDOC,
-- matdoc.ZUSCH AS BatchStatusKey_ZUSCH,
-- matdoc.ZUSTD AS BatchInRestricted_UseStock_ZUSTD,
-- matdoc.PLPLA AS DistributionOfDifferences_PLPLA,
-- matdoc.ELIKZ AS DeliveryCompleted_Indicator_ELIKZ,
-- matdoc.SGTXT AS ItemText_SGTXT,
-- matdoc.EQUNR AS EquipmentNumber_EQUNR,
-- matdoc.WEMPF AS GoodsRecipient_WEMPF,
-- matdoc.ABLAD AS UnloadingPoint_ABLAD,
-- matdoc.GSBER AS BusinessArea_GSBER,
-- matdoc.KOKRS AS ControllingArea_KOKRS,
-- matdoc.PARGB AS TradingPartners_BusinessArea_PARGB,
-- matdoc.PARBU AS ClearingCompanyCode_PARBU,
-- matdoc.KOSTL AS CostCenter_KOSTL,
-- matdoc.PROJN AS Old_ProjectNumber_NoLongerUsed_PS_POSNR_PROJN,
-- matdoc.XSKST AS Indicator_StatisticalPostingToCostCenter_XSKST,
-- matdoc.XSAUF AS Indicator_PostingToOrderIsStatistical_XSAUF,
-- matdoc.XSPRO AS Indicator_PostingToProjectIsStatistical_XSPRO,
-- matdoc.XSERG AS Indicator_PostingToProfitabilityAnalysisIsStatistical_XSERG,
-- matdoc.XRUEM AS AllowPostingToPreviousPeriod_Backposting_XRUEM,
-- matdoc.XRUEJ AS Indicator_PostToPreviousYear_XRUEJ,
-- matdoc.KZEAR AS FinalIssueForThisReservation_KZEAR,
-- matdoc.KZSTR AS Transaction_EventIsRelevantToStatistics_KZSTR,
-- matdoc.UMMAT AS Receiving_IssuinMaterial_UMMAT,
-- matdoc.UMZST AS StatusOfTransferBatch_UMZST,
-- matdoc.UMZUS AS StatusKeyOfTransferBatch_UMZUS,
-- matdoc.KZVBR AS ConsumptionPosting_KZVBR,
-- matdoc.PALAN AS WMS_NumberOfPallets_PALAN,
-- matdoc.LGPLA AS StorageBin_LGPLA,
-- matdoc.VSCHN AS Ind_InterimStoragePostingForSourceStor_TypeAndBin_VSCHN,
-- matdoc.NSCHN AS Ind_InterimStoragePostingForDest_Stor_TypeAndBin_NSCHN,
-- matdoc.DYPLA AS Indicator_DynamicStorageBin_DYPLA,
-- matdoc.TBPRI AS TransferPriority_TBPRI,
-- matdoc.WEANZ AS NumberOfGR_GISlipsToBePrinted_WEANZ,
-- matdoc.EVERS AS ShippingInstructions_EVERS,
-- matdoc.EVERE AS ComplianceWithShippingInstructions_EVERE,
-- matdoc.IMKEY AS InternalKeyForRealEstateObject_IMKEY,
-- matdoc.KSTRG AS CostObject_KSTRG,
-- matdoc.PAOBJNR AS ProfitabilitySegmentNumber_PAOBJNR,
-- matdoc.NPLNR AS NetworkNumberForAccountAssignment_NPLNR,
-- matdoc.AUFPL AS RoutingNumberOfOperationsInTheOrder_AUFPL,
-- matdoc.APLZL AS InternalCounter_APLZL,
-- matdoc.AUFPS AS OrderItemNumber_AUFPS,
-- matdoc.VPTNR AS PartnerAccountNumber_VPTNR,
-- matdoc.FIPOS AS CommitmentItem_FIPOS,
-- matdoc.XWSBR AS ReversalOfGR_AllowedForGR_Based_IV_DespiteInvoice_XWSBR,
-- matdoc.EMLIF AS SupplierToBeSupplied_WhoIsToReceiveDelivery_EMLIF,
-- matdoc.AKTNR AS Promotion_AKTNR,
-- matdoc.ZEKKN AS SequentialNumberOfAccountAssignment_ZEKKN,
-- matdoc.CUOBJ_CH AS InternalObjectNumberOfTheBatchClassification_CUOBJ_CH,
-- matdoc.PPRCTR AS PartnerProfitCenter_PPRCTR,
-- matdoc.RSART AS RecordType_RSART,
-- matdoc.GEBER AS Fund_GEBER,
-- matdoc.FISTL AS FundsCenter_FISTL,
-- matdoc.BUSTM AS PostingStringForQuantities_BUSTM,
-- matdoc.BUSTW AS PostingStringForValues_BUSTW,
-- matdoc.VPRSV AS PriceControlIndicator_VPRSV,
-- matdoc.FKBER AS FunctionalArea_FKBER,
-- matdoc.XBEAU AS PurchaseOrderCreatedAtTimeOfGoodsReceipt_XBEAU,
-- matdoc.QINSPST AS StatusOfGoodsReceiptInspection_QINSPST,
-- matdoc.MWSKZ AS TaxOnSales_PurchasesCode_MWSKZ,
-- matdoc.TXJCD AS TaxJurisdiction_TXJCD,
-- matdoc.EMATN AS MaterialNumberCorrespondingToManufacturerPartNumber_EMATN,
-- matdoc.J_1AGIRUPD AS GoodsIssueRevaluationPerformed_J_1AGIRUPD,
-- matdoc.VKMWS AS TaxOnSales_PurchasesCode_VKMWS,
-- matdoc.BERKZ AS MaterialStagingIndicatorForProductionSupply_BERKZ,
-- matdoc.XWOFF AS CalculationOfVal_Open_XWOFF,
-- matdoc.BEMOT AS AccountingIndicator_BEMOT,
-- matdoc.PRZNR AS BusinessProcess_PRZNR,
-- matdoc.LLIEF AS GoodsSupplier_LLIEF,
-- matdoc.LSTAR AS ActivityType_LSTAR,
-- matdoc.XOBEW AS VendorStockValuationIndicator_XOBEW,
-- matdoc.GRANT_NBR AS Grant_GRANT_NBR,
-- matdoc.ZUSTD_T156M AS StockTypeModification_ZUSTD_T156M,
-- matdoc.SPE_GTS_STOCK_TY AS GTSStockType_SPE_GTS_STOCK_TY,
-- matdoc.KBLNR AS DocumentNumberForEarmarkedFunds_KBLNR,
-- matdoc.KBLPOS AS EarmarkedFundsDocumentItem_KBLPOS,
-- matdoc.XMACC AS MultipleAccountAssignment_XMACC,
-- matdoc.UMMAB AS Receiving_IssuingMaterial_UMMAB,
-- matdoc.UMBAR AS ValuationTypeOfTransferBatch_UMBAR,
-- matdoc.UMSOK AS SpecialStockIndicator_UMSOK,
-- matdoc.SGT_SCAT AS StockSegment_SGT_SCAT,
-- matdoc.SGT_UMSCAT AS Receiving_IssuingStockSegment_SGT_UMSCAT,
-- matdoc.SGT_RCAT AS RequirementSegment_SGT_RCAT,
-- matdoc.DISUB_OWNER AS AccountNumberOfVendorOrCreditor_DISUB_OWNER,
-- matdoc.COMPL_MARK AS CompletedIndicator_COMPL_MARK,
-- matdoc.FZGLS_MARK AS DoNotAdjustCumulativeReceivedQuantity_FZGLS_MARK,
-- matdoc.ETANP_MARK AS AdjustOpenQuantityInSchedulingAgreementItem_ETANP_MARK,
-- matdoc.POPUP_MARK AS DisplayDialogBox_POPUP_MARK,
-- matdoc.XSAUT AS CreateSerialNumberAutomatically_XSAUT,
-- matdoc.SERVICEPERFORMER AS ServicePerformer_SERVICEPERFORMER,
-- matdoc.PERNR AS PersonnelNumber_PERNR,
-- matdoc.KNTTP_GR AS AccountAssignmentCategory_KNTTP_GR,
-- matdoc.WORK_ITEM_ID AS WorkItemID_WORK_ITEM_ID,
-- matdoc.FBUDA AS DateOnWhichServicesAreRendered_FBUDA,
-- matdoc.DUMMY_INCL_EEW_COBL AS CustomFields_DummyForUseInExtensionIncludes_DUMMY_INCL_EEW_COBL,
-- matdoc.FSH_SEASON_YEAR AS SeasonYear_FSH_SEASON_YEAR,
-- matdoc.FSH_SEASON AS Season_FSH_SEASON,
-- matdoc.FSH_COLLECTION AS FashionCollection_FSH_COLLECTION,
-- matdoc.FSH_THEME AS FashionTheme_FSH_THEME,
-- matdoc.WRF_CHARSTC1 AS CharacteristicValue1_WRF_CHARSTC1,
-- matdoc.WRF_CHARSTC2 AS CharacteristicValue2_WRF_CHARSTC2,
-- matdoc.WRF_CHARSTC3 AS CharacteristicValue3_WRF_CHARSTC3,
-- matdoc.OINAVNW AS Non_DeductibleInputTax_OINAVNW,
-- matdoc.OICONDCOD AS JointVentureIndicator_ConditionKey_OICONDCOD,
-- matdoc.CONDI AS JointVentureIndicatorConditionKey_CONDI,
-- matdoc.ASS_PSPNR AS AssignedOperative_WBS_Element_ASS_PSPNR,
-- matdoc.BLART AS DocumentType_BLART,
-- matdoc.BLAUM AS DocumentTypeOfRevaluationDocument_BLAUM,
-- matdoc.TCODE AS UndefinedRange_CanBeUsedForPatchLevels_TCODE,
-- matdoc.BKTXT AS DocumentHeaderText_BKTXT,
-- matdoc.FRATH AS UnplannedDeliveryCosts_FRATH,
-- matdoc.FRBNR AS NumberOfBillOfLadingAtTimeOfGoodsReceipt_FRBNR,
-- matdoc.WEVER AS VersionForPrintingGR_GISlip_WEVER,
-- matdoc.XABLN AS GoodsReceipt_IssueSlipNumber_XABLN,
-- matdoc.AWSYS AS LogicalSystem_AWSYS,
-- matdoc.BLA2D AS DocumentTypeForAdditionalDocumentInPurchaseAccountManagement_BLA2D,
-- matdoc.BFWMS AS ControlPostingForExternal_WMS_BFWMS,
-- matdoc.VGART AS Transaction_EventType_VGART,
-- matdoc.USNAM AS UserName_USNAM,
-- matdoc.TCODE2 AS TransactionCode_TCODE2,
-- matdoc.EXNUM AS NumberOfForeignTradeDataInMM_AndSD_Documents_EXNUM,
-- matdoc.GTS_CUSREF_NO AS CustomsReferenceNumberForScrapping_GTS_CUSREF_NO,
-- matdoc.FLS_RSTO AS StoreReturnWithInboundAndOutboundDelivery_FLS_RSTO,
-- matdoc.MSR_ACTIVE AS AdvancedReturnsManagementActive_MSR_ACTIVE,
-- matdoc.XCOMPL AS Single_CharacterFlag_XCOMPL,
-- matdoc.KNUMV AS NumberOfTheDocumentCondition_KNUMV,
-- matdoc.DATAAGING AS DataFilterValueForDataAging_DATAAGING,
-- matdoc.XPRINT AS PrintViaOutputControl_XPRINT,
-- matdoc.LMBMV AS Under_Overdelivery_LMBMV,
-- matdoc.PABPM AS PercentageVarianceInOrderPriceUnit_PABPM,
-- matdoc.XFMAT AS MaterialIsAMissingPart_XFMAT,
-- matdoc.KNBDR AS PrintKanbanCard_KNBDR
FROM
  `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.matdoc` AS matdoc