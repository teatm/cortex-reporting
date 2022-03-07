#-- Copyright 2022 Google LLC
#--
#-- Licensed under the Apache License, Version 2.0 (the "License");
#-- you may not use this file except in compliance with the License.
#-- You may obtain a copy of the License at
#--
#--     https://www.apache.org/licenses/LICENSE-2.0
#--
#-- Unless required by applicable law or agreed to in writing, software
#-- distributed under the License is distributed on an "AS IS" BASIS,
#-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#-- See the License for the specific language governing permissions and
#-- limitations under the License.
CREATE OR REPLACE VIEW `{{ project_id_tgt }}.{{ dataset_reporting_tgt }}.Deliveries`
OPTIONS(
  description = "Deliveries Header and Items"
)
AS
WITH
TCURX AS (
  -- Joining to this table is necesssary to fix the decimal place of 
  -- amounts for non-decimal-based currencies. SAP stores these amounts 
  -- offset by a factor  of 1/100 within the system (FYI this gets 
  -- corrected when a user observes these in the GUI) Currencies w/ 
  -- decimals are unimpacted.
  --
  -- Example of impacted currencies JPY, IDR, KRW, TWD 
  -- Example of non-impacted currencies USD, GBP, EUR
  -- Example 1,000 JPY will appear as 10.00 JPY
  SELECT DISTINCT
    CURRKEY,
    CAST(POWER(10, 2 - COALESCE(CURRDEC, 0)) AS NUMERIC) AS CURRFIX
  FROM
    `{{ project_id_src }}.{{ dataset_cdc_processed }}.tcurx`
)

SELECT
  LIKP.MANDT AS Client_MANDT,
  LIKP.VBELN AS Delivery_VBELN,
  LIKP.ERNAM AS CreatedBy_ERNAM,
  LIKP.ERZET AS CreateTime_ERZET,
  LIKP.ERDAT AS DateCreated_ERDAT,
  LIKP.BZIRK AS SalesDistrict_BZIRK,
  LIKP.VSTEL AS ShippingPointreceivingPoint_VSTEL,
  LIKP.VKORG AS SalesOrganization_VKORG,
  LIKP.LFART AS DeliveryType_LFART,
  LIKP.AUTLF AS CompleteDeliveryDefinedForEachSalesOrder_AUTLF,
  LIKP.KZAZU AS OrderCombinationIndicator_KZAZU,
  LIKP.WADAT AS PlannedGoodsMovementDate_WADAT,
  LIKP.LDDAT AS LoadingDate_LDDAT,
  LIKP.TDDAT AS TransportationPlanningDate_TDDAT,
  LIKP.LFDAT AS DeliveryDate_LFDAT,
  LIKP.KODAT AS PickingDate_KODAT,
  LIKP.ABLAD AS UnloadingPoint_ABLAD,
  LIKP.INCO1 AS Incoterms__part1___INCO1,
  LIKP.INCO2 AS Incoterms__part2___INCO2,
  LIKP.EXPKZ AS ExportIndicator_EXPKZ,
  LIKP.ROUTE AS Route_ROUTE,
  LIKP.FAKSK AS BillingBlockInSdDocument_FAKSK,
  LIKP.LIFSK AS DeliveryBlock_documentHeader_LIFSK,
  LIKP.VBTYP AS SdDocumentCategory_VBTYP,
  LIKP.KNFAK AS CustomerFactoryCalendar_KNFAK,
  LIKP.LPRIO AS DeliveryPriority_LPRIO,
  LIKP.VSBED AS ShippingConditions_VSBED,
  LIKP.KUNNR AS ShipToParty_KUNNR,
  LIKP.KUNAG AS SoldToParty_KUNAG,
  LIKP.KDGRP AS CustomerGroup_KDGRP,
  LIKP.BTGEW AS TotalWeight_BTGEW,
  LIKP.NTGEW AS NetWeightHdr_NTGEW,
  LIKP.GEWEI AS WeightUnitHdr_GEWEI,
  LIKP.VOLUM AS VolumeHdr_VOLUM,
  LIKP.VOLEH AS VolumeUnitHdr_VOLEH,
  LIKP.ANZPK AS TotalNumberOfPackagesInDelivery_ANZPK,
  LIKP.BEROT AS PickedItemsLocation_BEROT,
  LIKP.LFUHR AS TimeOfDelivery_LFUHR,
  LIKP.GRULG AS WeightGroupForDelivery__GRULG,
  LIKP.LSTEL AS LoadingPoint_LSTEL,
  LIKP.TRAGR AS TransportationGroupHdr_TRAGR,
  LIKP.FKARV AS ProposedBillingTypeForADeliveryRelatedBillingDoc_FKARV,
  LIKP.FKDAT AS BillingDateForBillingIndexAndPrintout_FKDAT,
  LIKP.PERFK AS InvoiceDates_PERFK,
  LIKP.ROUTA AS Route_ROUTA,
  LIKP.STAFO AS UpdateGroupForStatisticsHdr_STAFO,
  LIKP.KALSM AS PricingProcedure_KALSM,
  LIKP.KNUMV AS NumberOfTheDocumentCondition_KNUMV,
  LIKP.WAERK AS SdDocumentCurrency_WAERK,
  LIKP.VKBUR AS SalesOfficeHdr_VKBUR,
  LIKP.VBEAK AS ShippingProcessingTimeForTheEntireDocument_VBEAK,
  LIKP.ZUKRL AS CombinationCriteriaForDelivery_ZUKRL,
  LIKP.VERUR AS DistributionDelivery_VERUR,
  LIKP.COMMN AS CommunicationNumberForQApiInterface_COMMN,
  LIKP.STWAE AS StatisticsCurrency_STWAE,
  LIKP.STCUR AS ExchangeRateForStatistics_STCUR,
  LIKP.EXNUM AS NumberOfForeignTradeDataInMmAndSdDocuments_EXNUM,
  LIKP.AENAM AS NameOfPersonWhoChangedObjectHdr_AENAM,
  LIKP.AEDAT AS DateOfLastChangeHdr_AEDAT,
  LIKP.LGNUM AS WarehouseNumberWarehouseComplex_LGNUM,
  LIKP.LISPL AS DeliveryWithinOneWarehouse_LISPL,
  LIKP.VKOIV AS SalesOrganizationForIntercompanyBilling_VKOIV,
  LIKP.VTWIV AS DistributionChannelForIntercompanyBilling_VTWIV,
  LIKP.SPAIV AS DivisionForIntercompanyBilling_SPAIV,
  LIKP.FKAIV AS BillingTypeForIntercompanyBilling_FKAIV,
  LIKP.PIOIV AS DateForIntercompanyBilling_PIOIV,
  LIKP.FKDIV AS BillingDateForIntercompanyBilling_FKDIV,
  LIKP.KUNIV AS CustomerNumberForIntercompanyBilling_KUNIV,
  LIKP.KKBER AS CreditControlArea_KKBER,
  LIKP.KNKLI AS CreditLimitReference_KNKLI,
  LIKP.GRUPP AS CustomerCreditGroup_GRUPP,
  LIKP.SBGRP AS CreditRepresentativeGroupForCreditManagement_SBGRP,
  LIKP.CTLPC AS CreditManagement_RiskCategory_CTLPC,
  LIKP.CMWAE AS CurrencyKeyOfCreditControlArea_CMWAE,
  LIKP.AMTBL AS ReleasedCreditValueOfTheDocument_AMTBL,
  LIKP.BOLNR AS BillOfLading_BOLNR,
  LIKP.LIFNR AS VendorsAccountNumber_LIFNR,
  LIKP.TRATY AS MeansOfTransportType_TRATY,
  LIKP.TRAID AS MeansOfTransportId_TRAID,
  LIKP.CMFRE AS ReleaseDateOfTheDocumentDeterminedByCreditManagement_CMFRE,
  LIKP.CMNGV AS NextDate_CMNGV,
  LIKP.XABLN AS GoodsReceiptissueSlipNumber_XABLN,
  LIKP.BLDAT AS DocumentDateInDocument_BLDAT,
  LIKP.WADAT_IST AS ActualGoodsMovementDate_WADAT_IST,
  LIKP.TRSPG AS ShipmentBlockingReason_TRSPG,
  LIKP.TPSID AS IdForExternalTransportSystem_TPSID,
  LIKP.LIFEX AS ExternalIdentificationOfDeliveryNote_LIFEX,
  LIKP.TERNR AS OrderNumber_TERNR,
  LIKP.KALSM_CH AS SearchProcedureForBatchDetermination_KALSM_CH,
  LIKP.KLIEF AS CorrectionDelivery_KLIEF,
  LIKP.KALSP AS Shipping_PricingProcedure_KALSP,
  LIKP.KNUMP AS NumberOfDocumentConditionPricing_KNUMP,
  LIKP.AULWE AS RouteSchedule_AULWE,
  LIKP.WERKS AS ReceivingPlantForDeliveries_WERKS,
  LIKP.LCNUM AS FinancialDocNumber_LCNUM,
  LIKP.ABSSC AS PaymentGuaranteeProcedure_ABSSC,
  LIKP.KOUHR AS PickingTime_KOUHR,
  LIKP.TDUHR AS TranspPlanningTime_TDUHR,
  LIKP.LDUHR AS LoadingTime_LDUHR,
  LIKP.WAUHR AS TimeOfGoodsIssue_WAUHR,
  LIKP.LGTOR AS DoorForWarehouseNumber_LGTOR,
  LIKP.LGBZO AS StagingAreaForWarehouseComplexHdr_LGBZO,
  LIKP.AKWAE AS CurrencyKeyForeignTrade_AKWAE,
  LIKP.AKKUR AS ExchangeRateForLetterCreditProcgInForeignTrade_AKKUR,
  LIKP.AKPRZ AS DepreciationPercentageForFinancialDocumentProcessing_AKPRZ,
  LIKP.PROLI AS DangerousGoodsManagementProfileInSdDocuments_PROLI,
  LIKP.XBLNR AS ReferenceDocumentNumber_XBLNR,
  LIKP.HANDLE AS WorldwideUniqueKeyForLikpVbeln_HANDLE,
  LIKP.TSEGFL AS TimeSegmentExists_TSEGFL,
  LIKP.TSEGTP AS EventGroupTimeSegmentDeliveryHeader_TSEGTP,
  LIKP.TZONIS AS TimeZoneOfDeliveringLocation_TZONIS,
  LIKP.TZONRC AS TimeZoneOfRecipientLocation_TZONRC,
  LIKP.CONT_DG AS Indicator_DocumentContainsDangerousGoods_CONT_DG,
  LIKP.VERURSYS AS DistributionDelivery_OriginalSystem_VERURSYS,
  LIKP.KZWAB AS IndicatorForControllingGoodsMovement_KZWAB,
  LIKP.VLSTK AS DistributionStatus_VLSTK,
  LIKP.TCODE AS TransactionCode_TCODE,
  LIKP.VSART AS ShippingType_VSART,
  LIKP.TRMTYP AS MeansOfTransport_TRMTYP,
  LIKP.SDABW AS SpecialProcessingIndicator_SDABW,
  LIKP.VBUND AS CompanyId_VBUND,
  LIKP.XWOFF AS CalculationOfValOpen_XWOFF,
  LIKP.DIRTA AS AutomaticToCreationImmediatelyAfterTrGeneration_DIRTA,
  LIKP.PRVBE AS ProductionSupplyArea_PRVBE,
  LIKP.FOLAR AS DeliveryType_FOLAR,
  LIKP.PODAT AS Date__proofOfDelivery___PODAT,
  LIKP.POTIM AS ConfirmationTime_POTIM,
  LIKP.VGANZ AS NumberOfDeliveryItemsWithPrecedessorInOtherSystem_VGANZ,
  LIKP.IMWRK AS DeliveryHasStatusinPlant_IMWRK,
  LIKP.SPE_LOEKZ AS DocumentDeletionIndicator_SPE_LOEKZ,
  LIKP.SPE_LOC_SEQ AS SequenceOfIntermediateLocationsInReturnsProcess_SPE_LOC_SEQ,
  LIKP.SPE_ACC_APP_STS AS DeliveryConfirmationStatus_SPE_ACC_APP_STS,
  LIKP.SPE_SHP_INF_STS AS ShipmentInformationStatus_SPE_SHP_INF_STS,
  LIKP.SPE_RET_CANC AS Returns_FlagShowingThatAnAsnIsCancelled_SPE_RET_CANC,
  LIKP.SPE_WAUHR_IST AS TimeOfGoodsIssue__local,
  LIKP.SPE_WAZONE_IST AS TimeZone_SPE_WAZONE_IST,
  LIKP.SPE_REV_VLSTK AS DistributionStatus__decentralizedWarehouseProcessing_SPE_REV_VLSTK,
  LIKP.SPE_LE_SCENARIO AS ScenarioLogisticExecution_SPE_LE_SCENARIO,
  LIKP.SPE_ORIG_SYS AS OriginalSystemType_SPE_ORIG_SYS,
  LIKP.SPE_CHNG_SYS AS LastChangerSystemType_SPE_CHNG_SYS,
  LIKP.SPE_GEOROUTE AS DescriptionOfAGeographicalRoute_SPE_GEOROUTE,
  LIKP.SPE_GEOROUTEIND AS ChangeIndicatorForTheRoute_SPE_GEOROUTEIND,
  LIKP.SPE_CARRIER_IND AS ChangeIndicatorForTheCarrier_SPE_CARRIER_IND,
  LIKP.SPE_GTS_REL AS GoodsTrafficType_SPE_GTS_REL,
  LIKP.SPE_GTS_RT_CDE AS RouteCodeForSapGlobalTradeServices_SPE_GTS_RT_CDE,
  LIKP.SPE_REL_TMSTMP AS ReleaseTimeStamp_SPE_REL_TMSTMP,
  LIKP.SPE_UNIT_SYSTEM AS MeasurementUnitSystem_SPE_UNIT_SYSTEM,
  LIKP.SPE_INV_BFR_GI AS InvoiceCreationBeforeGoodsIssue_SPE_INV_BFR_GI,
  LIKP.SPE_QI_STATUS AS StatusOfQualityInspectionForReturnsDeliveries_SPE_QI_STATUS,
  LIKP.SPE_RED_IND AS SpeIndicatorIfRedirectingHasOccured_SPE_RED_IND,
  LIKP.SAKES AS SapGlobalTradeServices_StorageStatusOfDelivery_SAKES,
  LIKP.SPE_LIFEX_TYPE AS TypeOfExternalIdentification_SPE_LIFEX_TYPE,
  LIKP.SPE_TTYPE AS MeansOfTransport_SPE_TTYPE,
  LIKP.SPE_PRO_NUMBER AS PartnerIdentification_ProgressiveIdentificationNumber_SPE_PRO_NUMBER,
  LIKP.LOC_GUID AS Akkreditiv_guid_LOC_GUID,
  LIKP.SPE_BILLING_IND AS EwmBillingIndicator_SPE_BILLING_IND,
  LIKP.PRINTER_PROFILE AS DescriptionOfPrintProfile_PRINTER_PROFILE,
  LIKP.MSR_ACTIVE AS AdvancedReturnsManagementActive_MSR_ACTIVE,
  LIKP.PRTNR AS ConfirmationNumber_PRTNR,
  LIKP.STGE_LOC_CHANGE AS TemporaryChangeOfStorageLocationsInDelivery_STGE_LOC_CHANGE,
  LIKP.TM_CTRL_KEY AS ControlKeyForDocumentTransferToTm_TM_CTRL_KEY,
  LIKP.DLV_SPLIT_INITIA AS DeliverySplitInitiator_DLV_SPLIT_INITIA,
  LIKP.DLV_VERSION AS DeliveryVersion_DLV_VERSION,
  LIKP.HANDOVERLOC AS LocationForAPhysicalHandoverOfGoods_HANDOVERLOC,
  LIKP.HANDOVERDATE AS HandoverDateAtTheHandoverLocation_HANDOVERDATE,
  LIKP.INCO3_L AS IncotermsLocation2_INCO3_L,
  LIKP.BORGR_GRP AS MultiLevelGoodsReceiptAutomotive_BORGR_GRP,
  LIKP.FSH_TRANSACTION AS TransactionNumberHdr_FSH_TRANSACTION,
  LIKP.FSH_VAS_LAST_ITEM AS LastVasItemNumber_FSH_VAS_LAST_ITEM,
  LIKP.FSH_VAS_CG AS ValueAddedServicesCustomerGroup_FSH_VAS_CG,
  LIPS.POSNR AS DeliveryItem_POSNR,
  LIPS.PSTYV AS DeliveryItemCategory_PSTYV,
  LIPS.ERNAM AS NameOfPersonWhoCreatedTheObject_ERNAM,
  LIPS.ERZET AS EntryTime_ERZET,
  LIPS.ERDAT AS DateOnWhichRecordWasCreated_ERDAT,
  LIPS.MATNR AS MaterialNumber_MATNR,
  LIPS.MATWA AS MaterialEntered_MATWA,
  LIPS.MATKL AS MaterialGroup_MATKL,
  LIPS.WERKS AS Plant_WERKS,
  LIPS.LGORT AS StorageLocation_LGORT,
  LIPS.CHARG AS BatchNumber_CHARG,
  LIPS.LICHN AS VendorBatchNumber_LICHN,
  LIPS.KDMAT AS MaterialBelongingToTheCustomer_KDMAT,
  LIPS.PRODH AS ProductHierarchy_PRODH,
  LIPS.LFIMG AS ActualQuantityDelivered__inSalesUnits___LFIMG,
  LIPS.MEINS AS BaseUnitOfMeasure_MEINS,
  LIPS.VRKME AS SalesUnit_VRKME,
  LIPS.UMVKZ AS Numerator__factor__ForConversionOfSalesQuantityIntoSku_UMVKZ,
  LIPS.UMVKN AS Denominator__divisor__ForConversionOfSalesQtyIntoSku_UMVKN,
  LIPS.GEWEI AS WeightUnit_GEWEI,
  LIPS.VOLEH AS VolumeUnit_VOLEH,
  LIPS.KZTLF AS PartialDeliveryAtItemLevel_KZTLF,
  LIPS.UEBTK AS Indicator_UnlimitedOverdeliveryAllowed_UEBTK,
  LIPS.UEBTO AS OverdeliveryToleranceLimit_UEBTO,
  LIPS.UNTTO AS UnderdeliveryToleranceLimit_UNTTO,
  LIPS.CHSPL AS BatchSplitAllowed_CHSPL,
  LIPS.FAKSP AS Block_FAKSP,
  LIPS.MBDAT AS MaterialAvailabilityDate_MBDAT,
  LIPS.LGMNG AS ActualQuantityDeliveredInStockkeepingUnits_LGMNG,
  LIPS.ARKTX AS ShortTextForSalesOrderItem_ARKTX,
  LIPS.LGPBE AS StorageBin_LGPBE,
  LIPS.VBELV AS OriginatingDocument_VBELV,
  LIPS.POSNV AS OriginatingItem_POSNV,
  LIPS.VBTYV AS SdDocumentCategory_VBTYV,
  LIPS.VGSYS AS LogicalSystemInThePrecedingDocument_VGSYS,
  LIPS.VGBEL AS SalesOrderNumber_VGBEL,
  LIPS.VGPOS AS SalesOrderItem_VGPOS,
  LIPS.UPFLU AS UpdateIndicatorForDeliveryDocumentFlow_UPFLU,
  LIPS.UEPOS AS HigherLevelItemInBOM_UEPOS,
  LIPS.FKREL AS RelevantForBilling_FKREL,
  LIPS.LADGR AS LoadingGroup_LADGR,
  LIPS.TRAGR AS TransportationGroup_TRAGR,
  LIPS.KOMKZ AS IndicatorForPickingControl_KOMKZ,
  LIPS.LGNUM AS WarehouseNumber_LGNUM,
  LIPS.LISPL AS SplitToWarehouseNumberRequired_LISPL,
  LIPS.LGTYP AS StorageType_LGTYP,
  LIPS.LGPLA AS StorageBin_LGPLA,
  LIPS.BWTEX AS Indicator_SeparateValuation_BWTEX,
  LIPS.BWART AS MovementType__inventoryManagement___BWART,
  LIPS.BWLVS AS MovementTypeForWarehouseManagement_BWLVS,
  LIPS.KZDLG AS Indicator_DynamicStorageBinInWarehouseManagement_KZDLG,
  LIPS.BDART AS RequirementType_BDART,
  LIPS.PLART AS PlanningType_PLART,
  LIPS.MTART AS MaterialType_MTART,
  LIPS.XCHPF AS BatchManagementRequirementIndicator_XCHPF,
  LIPS.XCHAR AS BatchManagementIndicator__internal___XCHAR,
  LIPS.VGREF AS PrecedingDocumentHasResultedFromReference_VGREF,
  LIPS.POSAR AS ItemType_POSAR,
  LIPS.BWTAR AS ValuationType_BWTAR,
  LIPS.SUMBD AS SummingUpOfRequirements_SUMBD,
  LIPS.MTVFP AS CheckingGroupForAvailability_MTVFP,
  LIPS.GSBER AS BusinessArea_GSBER,
  LIPS.VKBUR AS SalesOffice_VKBUR,
  LIPS.VKGRP AS SalesGroup_VKGRP,
  LIPS.VTWEG AS DistributionChannel_VTWEG,
  LIPS.SPART AS Division_SPART,
  LIPS.GRKOR AS DeliveryGroup__itemsAreDeliveredTogether___GRKOR,
  LIPS.FMENG AS QuantityIsFixed_FMENG,
  LIPS.ANTLF AS MaximumNumberOfPartialDeliveriesAllowedPerItem_ANTLF,
  LIPS.VBEAF AS FixedShippingProcessingTimeInDays_VBEAF,
  LIPS.VBEAV AS VariableShippingProcessingTimeInDays_VBEAV,
  LIPS.STAFO AS UpdateGroupForStatisticsUpdate_STAFO,
  LIPS.KZWI1 AS Subtotal1FromPricingProcedureForCondition_KZWI1,
  LIPS.KZWI2 AS Subtotal2FromPricingProcedureForCondition_KZWI2,
  LIPS.KZWI3 AS Subtotal3FromPricingProcedureForCondition_KZWI3,
  LIPS.KZWI4 AS Subtotal4FromPricingProcedureForCondition_KZWI4,
  LIPS.KZWI5 AS Subtotal5FromPricingProcedureForCondition_KZWI5,
  LIPS.KZWI6 AS Subtotal6FromPricingProcedureForCondition_KZWI6,
  LIPS.SOBKZ AS SpecialStockIndicator_SOBKZ,
  LIPS.AEDAT AS DateOfLastChange_AEDAT,
  LIPS.EAN11 AS InternationalArticleNumber__eanupc___EAN11,
  LIPS.KVGR1 AS CustomerGroup1_KVGR1,
  LIPS.KVGR2 AS CustomerGroup2_KVGR2,
  LIPS.KVGR3 AS CustomerGroup3_KVGR3,
  LIPS.KVGR4 AS CustomerGroup4_KVGR4,
  LIPS.KVGR5 AS CustomerGroup5_KVGR5,
  LIPS.MVGR1 AS MaterialGroup1_MVGR1,
  LIPS.MVGR2 AS MaterialGroup2_MVGR2,
  LIPS.MVGR3 AS MaterialGroup3_MVGR3,
  LIPS.MVGR4 AS MaterialGroup4_MVGR4,
  LIPS.MVGR5 AS MaterialGroup5_MVGR5,
  LIPS.VPZUO AS AllocationIndicator_VPZUO,
  LIPS.VGTYP AS SdDocumentCategory_VGTYP,
  LIPS.RFVGTYP AS TypeOfPrecedingDocumentInCentralSystem_RFVGTYP,
  LIPS.KOSTL AS CostCenter_KOSTL,
  LIPS.KOKRS AS ControllingArea_KOKRS,
  LIPS.PAOBJNR AS ProfitabilitySegmentNumber_PAOBJNR,
  LIPS.PRCTR AS ProfitCenter_PRCTR,
  LIPS.PS_PSP_PNR AS WorkBreakdownStructureElement__wbsElement___PS_PSP_PNR,
  LIPS.AUFNR AS OrderNumber_AUFNR,
  LIPS.POSNR_PP AS OrderItemNumber_POSNR_PP,
  LIPS.KDAUF AS SalesOrderNumber_KDAUF,
  LIPS.KDPOS AS ItemNumberInSalesOrder_KDPOS,
  LIPS.VPMAT AS PlanningMaterial_VPMAT,
  LIPS.VPWRK AS PlanningPlant_VPWRK,
  LIPS.PRBME AS BaseUnitOfMeasureForProductGroup_PRBME,
  LIPS.UMREF AS ConversionFactor_Quantities_UMREF,
  LIPS.KNTTP AS AccountAssignmentCategory_KNTTP,
  LIPS.KZVBR AS ConsumptionPosting_KZVBR,
  LIPS.FIPOS AS CommitmentItem_FIPOS,
  LIPS.FISTL AS FundsCenter_FISTL,
  LIPS.GEBER AS Fund_GEBER,
  LIPS.PCKPF AS PackingControl_PCKPF,
  LIPS.BEDAR_LF AS RequirementsClass_BEDAR_LF,
  LIPS.CMPNT AS Id_ItemWithActiveCreditFunctionRelevantForCredit_CMPNT,
  LIPS.KCMENG AS CumulativeBatchQuantityOfAllSplitItems__inStckunit___KCMENG,
  LIPS.KCBRGEW AS CumulativeGrossWeightOfAllBatchSplitItems_KCBRGEW,
  LIPS.KCNTGEW AS CumulativeNetWeightOfAllBatchSplitItems_KCNTGEW,
  LIPS.KCVOLUM AS CumulativeVolumeOfAllBatchSplitItems_KCVOLUM,
  LIPS.UECHA AS HigherLevelItemOfBatchSplitItem_UECHA,
  LIPS.CUOBJ AS Configuration_CUOBJ,
  LIPS.CUOBJ_CH AS InternalObjectNumberOfTheBatchClassification_CUOBJ_CH,
  LIPS.ANZSN AS NumberOfSerialNumbers_ANZSN,
  LIPS.SERAIL AS SerialNumberProfile_SERAIL,
  LIPS.KCGEWEI AS WeightUnit_KCGEWEI,
  LIPS.KCVOLEH AS VolumeUnit_KCVOLEH,
  LIPS.SERNR AS BomExplosionNumber_SERNR,
  LIPS.ABRLI AS InternalDeliveryScheduleNumber_ABRLI,
  LIPS.ABART AS RelType_ABART,
  LIPS.ABRVW AS UsageIndicator_ABRVW,
  LIPS.QPLOS AS InspectionLotNumber_QPLOS,
  LIPS.QTLOS AS PartialLotNumber_QTLOS,
  LIPS.NACHL AS CustomerHasNotPostedGoodsReceipt_NACHL,
  LIPS.MAGRV AS MaterialGroup_PackagingMaterials_MAGRV,
  LIPS.OBJKO AS ObjectNumberAtHeaderLevel_OBJKO,
  LIPS.OBJPO AS ObjectNumberAtItemLevel_OBJPO,
  LIPS.AESKD AS CustomerEngineeringChangeStatus_AESKD,
  LIPS.SHKZG AS ReturnsItem_SHKZG,
  LIPS.PROSA AS IdForMaterialDetermination_PROSA,
  LIPS.UEPVW AS HigherLevelItemUsage_UEPVW,
  LIPS.EMPST AS ReceivingPoint_EMPST,
  LIPS.ABTNR AS DepartmentNumber_ABTNR,
  LIPS.KOQUI AS PickingIsSubjectToConfirmation_KOQUI,
  LIPS.STADAT AS StatisticsDate_STADAT,
  LIPS.AKTNR AS Promotion_AKTNR,
  LIPS.KNUMH_CH AS NumberOfConditionRecordFromBatchDetermination_KNUMH_CH,
  LIPS.PREFE AS PreferenceIndicatorInExportimport_PREFE,
  LIPS.EXART AS BusinessTransactionTypeForForeignTrade_EXART,
  LIPS.CLINT AS InternalClassNumber_CLINT,
  LIPS.CHMVS AS Batches_ExitToQuantityProposal_CHMVS,
  LIPS.ABELN AS AllocationTableNumber_ABELN,
  LIPS.ABELP AS ItemNumberOfAllocationTable_ABELP,
  LIPS.LFIMG_FLO AS InternalFieldDoNotUseLfimgInFloatMum_LFIMG_FLO,
  LIPS.LGMNG_FLO AS InternalFieldDoNotUseLgmngInFloatMum_LGMNG_FLO,
  LIPS.KCMENG_FLO AS InternalFieldDoNotUseKcmengInFloatMum_KCMENG_FLO,
  LIPS.KZUMW AS EnvironmentallyRelevant_KZUMW,
  LIPS.KMPMG AS ComponentQuantity_KMPMG,
  LIPS.AUREL AS RelevantToAllocationTable_AUREL,
  LIPS.KPEIN AS ConditionPricingUnit_KPEIN,
  LIPS.KMEIN AS ConditionUnit_KMEIN,
  LIPS.NETPR AS NetPrice_NETPR,
  LIPS.KOWRR AS StatisticalValues_KOWRR,
  LIPS.KZBEW AS MovementIndicator_KZBEW,
  LIPS.MFRGR AS MaterialFreightGroup_MFRGR,
  LIPS.CHHPV AS PackAccumulatedBatchesMovementTypeItem_CHHPV,
  LIPS.ABFOR AS FormOfPaymentGuarantee_ABFOR,
  LIPS.ABGES AS Guaranteed__factorBetween0And1___ABGES,
  LIPS.MBUHR AS MaterialStagingTime_MBUHR,
  LIPS.WKTNR AS ValueContractNo_WKTNR,
  LIPS.WKTPS AS ValueContractItem_WKTPS,
  LIPS.J_1BCFOP AS CfopCodeAndExtension_J_1BCFOP,
  LIPS.J_1BTAXLW1 AS TaxLaw_Icms_J_1BTAXLW1,
  LIPS.J_1BTAXLW2 AS TaxLaw_Ipi_J_1BTAXLW2,
  LIPS.J_1BTXSDC AS SdTaxCode_J_1BTXSDC,
  LIPS.SITUA AS IndicatorForSituation_SITUA,
  LIPS.RSNUM AS NumberOfReservationdependentRequirements_RSNUM,
  LIPS.RSPOS AS ItemNumberOfReservationDependentRequirements_RSPOS,
  LIPS.RSART AS RecordType_RSART,
  LIPS.KANNR AS KanbansequenceNumber_KANNR,
  LIPS.KZFME AS Id_LeadingUnitOfMeasureForCompletingATransaction_KZFME,
  LIPS.PROFL AS DangerousGoodsIndicatorProfile_PROFL,
  LIPS.KCMENGVME AS CumulativeBatchQuantityOfAllSplitItemsInSalesUnits_KCMENGVME,
  LIPS.KCMENGVMEF AS CumulatedBatchSplitQuantityInVrkmeAndFloat_KCMENGVMEF,
  LIPS.KZBWS AS ValuationOfSpecialStock_KZBWS,
  LIPS.PSPNR AS ProjectDefinition__internal___PSPNR,
  LIPS.EPRIO AS WithdrawalSequenceGroupForStocks_EPRIO,
  LIPS.RULES AS StockDeterminationRule_RULES,
  LIPS.KZBEF AS IndicatorInventoryManagementActive_KZBEF,
  LIPS.MPROF AS MfrPartProfile_MPROF,
  LIPS.EMATN AS MaterialNumberCorrespondingToManufacturerPartNumber_EMATN,
  LIPS.LGBZO AS StagingAreaForWarehouseComplex_LGBZO,
  LIPS.HANDLE AS WorldwideUniqueKeyForLips_HANDLE,
  LIPS.VERURPOS AS DistributionDelivery_OriginalItem_VERURPOS,
  LIPS.LIFEXPOS AS ExternalItemNumber_LIFEXPOS,
  LIPS.NOATP AS Indicator_DeactivateAvailabilityCheck_NOATP,
  LIPS.NOPCK AS Indicator_NotRelevantForPicking_NOPCK,
  LIPS.RBLVS AS ReferenceMovementTypeForWmFromMaterialMovements_RBLVS,
  LIPS.BERID AS MrpArea_BERID,
  LIPS.BESTQ AS StockCategoryInTheWarehouseManagementSystem_BESTQ,
  LIPS.UMBSQ AS StockCategoryInTheWarehouseManagementSystem_UMBSQ,
  LIPS.UMMAT AS ReceivingissuingMaterial_UMMAT,
  LIPS.UMWRK AS ReceivingPlantissuingPlant_UMWRK,
  LIPS.UMLGO AS ReceivingissuingStorageLocation_UMLGO,
  LIPS.UMCHA AS ReceivingissuingBatch_UMCHA,
  LIPS.UMBAR AS ValuationTypeOfTransferBatch_UMBAR,
  LIPS.UMSOK AS SpecialStockIndicatorForPhysicalStockTransfer_UMSOK,
  LIPS.SONUM AS SpecialStockNumber_SONUM,
  LIPS.USONU AS SpecialStockNumber_USONU,
  LIPS.AKKUR AS ExchangeRateForLetterForeignTrade_AKKUR,
  LIPS.AKMNG AS CurrentQtyFieldForArithmeticOperations_AKMNG,
  LIPS.VKGRU AS RepairProcessing_ClassificationOfItems_VKGRU,
  LIPS.SHKZG_UM AS Indicator_UnmatInMainPosting_SHKZG_UM,
  LIPS.INSMK AS StockType_INSMK,
  LIPS.KZECH AS DeterminationOfBatchEntryInTheProductionprocessOrder_KZECH,
  LIPS.FLGWM AS DestStorageDataFromPrecedingDocument_FLGWM,
  LIPS.BERKZ AS MaterialStagingIndicatorForProductionSupply_BERKZ,
  LIPS.HUPOS AS Indicator_DeliveryItemIsAHuItem_HUPOS,
  LIPS.NOWAB AS Indicator_ItemNotRelevantForGoodsMovements_NOWAB,
  LIPS.KONTO AS GlAccountNumber_KONTO,
  LIPS.KZEAR AS FinalIssueForThisReservation_KZEAR,
  LIPS.HSDAT AS DateOfManufacture_HSDAT,
  LIPS.VFDAT AS BestBeforeDate_VFDAT,
  LIPS.LFGJA AS FiscalYearOfCurrentPeriod_LFGJA,
  LIPS.LFBNR AS AReferenceDocument_LFBNR,
  LIPS.LFPOS AS ItemOfAReferenceDocument_LFPOS,
  LIPS.GRUND AS ReasonForGoodsMovment_GRUND,
  LIPS.FOBWA AS SubsequentMovementType_FOBWA,
  LIPS.DLVTP AS DeliveryCategory_DLVTP,
  LIPS.EXBWR AS ExternallyEnteredPostingAmountInLocalCurrency_EXBWR,
  LIPS.BPMNG AS QuantityInPurchaseOrderPriceUnit_BPMNG,
  LIPS.EXVKW AS ExternallyEnteredSalesValueInLocalCurrency_EXVKW,
  LIPS.CMPRE_FLT AS ItemCreditPrice_CMPRE_FLT,
  LIPS.KZPOD AS PodIndicator_KZPOD,
  LIPS.LFDEZ AS NotRelevantForDistributionForWms_LFDEZ,
  LIPS.UMREV AS ConversionFactorOfDeliveryQuantityVrkmeForMeins_UMREV,
  LIPS.PODREL AS PodControl_proofOfDelivery___PODREL,
  LIPS.KZUML AS StockTransfertransferPosting_KZUML,
  LIPS.FKBER AS FunctionalArea_FKBER,
  LIPS.GRANT_NBR AS Grant_GRANT_NBR,
  LIPS.KZWSO AS UnitsOfMeasureUsage_KZWSO,
  LIPS.GMCONTROL AS GoodsMovementControl_GMCONTROL,
  LIPS.POSTING_CHANGE AS GoodsMovementControl_Hu_POSTING_CHANGE,
  LIPS.UM_PS_PSP_PNR AS Receivingissuing_wbsElement_UM_PS_PSP_PNR,
  LIPS.PRE_VL_ETENS AS SequentialNumberOfVendorConfirmation_PRE_VL_ETENS,
  LIPS.SPE_GEN_ELIKZ AS deliveryCompleted_SPE_GEN_ELIKZ,
  LIPS.SPE_SCRAP_IND AS ScrapIndicatorForEwmProcessing_SPE_SCRAP_IND,
  LIPS.SPE_AUTH_NUMBER AS ReturnMaterialAuthorizationNumber_SPE_AUTH_NUMBER,
  LIPS.SPE_INSPOUT_GUID AS Inspections_InspectionOutcomeGuidSetByEwm_SPE_INSPOUT_GUID,
  LIPS.SPE_FOLLOW_UP AS DefaultFollow_SPE_FOLLOW_UP,
  LIPS.SPE_EXP_DATE_EXT AS EndDateOfValidityPeriodOfReturnsDelivery_SPE_EXP_DATE_EXT,
  LIPS.SPE_EXP_DATE_INT AS EndDateOfInternalValidityPeriodOfReturnsDelivery_SPE_EXP_DATE_INT,
  LIPS.SPE_AUTH_COMPLET AS RmaCompletionIndicator_SPE_AUTH_COMPLET,
  LIPS.ORMNG AS OriginalQuantityOfDeliveryItem_ORMNG,
  LIPS.SPE_ATP_TMSTMP AS AtpTimeStamp_SPE_ATP_TMSTMP,
  LIPS.SPE_ORIG_SYS AS OriginalSystemTypeItm_SPE_ORIG_SYS,
  LIPS.SPE_LIEFFZ AS CumulativeQtyForSchedagrVendorPOV_SPE_LIEFFZ,
  LIPS.SPE_IMWRK AS InboundDeliveryItemHasStatusinPlant_SPE_IMWRK,
  LIPS.SPE_LIFEXPOS2 AS ExternalItemIdentifier_SPE_LIFEXPOS2,
  LIPS.SPE_EXCEPT_CODE AS ExceptionCodeWarehouseForQuantityDifference_SPE_EXCEPT_CODE,
  LIPS.SPE_KEEP_QTY AS RetentionQuantityForScrap_SPE_KEEP_QTY,
  LIPS.SPE_ALTERNATE AS AlternateProductNumber_SPE_ALTERNATE,
  LIPS.SPE_MAT_SUBST AS ReasonForMaterialSubstitution_SPE_MAT_SUBST,
  LIPS.SPE_STRUC AS StructureOfItemsThatAreDeliveredTogether_SPE_STRUC,
  LIPS.SPE_APO_QNTYFAC AS NumeratorOfQuotientForUnitOfMeasureConversion_SPE_APO_QNTYFAC,
  LIPS.SPE_APO_QNTYDIV AS DenominatorOfQuotientForUnitOfMeasureConversion_SPE_APO_QNTYDIV,
  LIPS.SPE_HERKL AS NonPreferentialOrigin_SPE_HERKL,
  LIPS.SPE_BXP_DATE_EXT AS BeginDateOfValidityPeriodOfReturnsDelivery_SPE_BXP_DATE_EXT,
  LIPS.SPE_VERSION AS DeliveryVersionAtConfirmation_SPE_VERSION,
  LIPS.SPE_COMPL_MVT AS CompletionOfGoodsMovementsAfterDifferencePostings_SPE_COMPL_MVT,
  LIPS.J_1BTAXLW4 AS CofinsTaxLaw_J_1BTAXLW4,
  LIPS.J_1BTAXLW5 AS PisTaxLaw_J_1BTAXLW5,
  LIPS.J_1BTAXLW3 AS IssTaxLaw_J_1BTAXLW3,
  LIPS.BUDGET_PD AS Fm_BudgetPeriod_BUDGET_PD,
  LIPS.KBNKZ AS KanbanIndicator_KBNKZ,
  LIPS.FARR_RELTYPE AS RevenueAccountingType_FARR_RELTYPE,
  LIPS.SITKZ AS SpecificationForIssuingValuatedStockInTransit_SITKZ,
  LIPS.SGT_RCAT AS RequirementSegment_SGT_RCAT,
  LIPS.SGT_SCAT AS StockSegment_SGT_SCAT,
  LIPS.FSH_SEASON_YEAR AS SeasonYear_FSH_SEASON_YEAR,
  LIPS.FSH_SEASON AS Season_FSH_SEASON,
  LIPS.FSH_COLLECTION AS FashionCollection_FSH_COLLECTION,
  LIPS.FSH_THEME AS FashionTheme_FSH_THEME,
  LIPS.FSH_KVGR6 AS CustomerGroup6_FSH_KVGR6,
  LIPS.FSH_KVGR7 AS CustomerGroup7_FSH_KVGR7,
  LIPS.FSH_KVGR8 AS CustomerGroup8_FSH_KVGR8,
  LIPS.FSH_KVGR9 AS CustomerGroup9_FSH_KVGR9,
  LIPS.FSH_KVGR10 AS CustomerGroup10_FSH_KVGR10,
  LIPS.FSH_VAS_REL AS VasRelevant_FSH_VAS_REL,
  LIPS.FSH_VAS_PRNT_ID AS DeliveryItem_FSH_VAS_PRNT_ID,
  LIPS.FSH_TRANSACTION AS TransactionNumber_FSH_TRANSACTION,
  LIPS.FSH_ITEM_GROUP AS ItemGroup_FSH_ITEM_GROUP,
  LIPS.FSH_ITEM AS ItemNumber_FSH_ITEM,
  LIPS.FSH_RSNUM AS NumberOfReservationdependentRequirements_FSH_RSNUM,
  LIPS.FSH_RSPOS AS ItemNumberOfReservationDependentRequirements_FSH_RSPOS,
  LIPS.CONS_ORDER AS PurchaseOrderForConsignment_CONS_ORDER,
  LIPS.WRF_CHARSTC1 AS CharacteristicValue1_WRF_CHARSTC1,
  LIPS.WRF_CHARSTC2 AS CharacteristicValue2_WRF_CHARSTC2,
  LIPS.WRF_CHARSTC3 AS CharacteristicValue3_WRF_CHARSTC3,
  IF(
    LIKP.VBTYP IN ('H', 'K', 'N', 'O', 'T', '6'),
    COALESCE(LIKP.NETWR * TCURX_WAERK.CURRFIX * -1, LIKP.NETWR * -1),
    COALESCE(LIKP.NETWR * TCURX_WAERK.CURRFIX, LIKP.NETWR)
  ) AS NetValueOfTheSalesOrderInDocumentCurrency_NETWR,
  IF(LIPS.SHKZG IN ('B', 'S', 'X'), (LIPS.NTGEW * -1), LIPS.NTGEW ) AS NetWeight_NTGEW, IF(LIPS.SHKZG IN ('B', 'S', 'X'), (LIPS.BRGEW * -1), LIPS.BRGEW) AS GrossWeight_BRGEW,
  IF(LIPS.SHKZG IN ('B', 'S', 'X'), (LIPS.VOLUM * -1), LIPS.VOLUM) AS Volume_VOLUM,
  COALESCE(LIPS.WAVWR * TCURX_WAERK.CURRFIX, LIPS.WAVWR) AS CostInDocumentCurrency_WAVWR,
  COALESCE(LIPS.NETWR * TCURX_WAERK.CURRFIX, LIPS.NETWR) AS NetValueInDocumentCurrency_NETWR,
  DATE_DIFF(likp.wadat, likp.wadat_ist, DAY) AS delivery_delay,
  IF(LIKP.VBTYP IN ('H', 'K', 'N', 'O', 'T', '6') OR LIPS.SHKZG IN ('B', 'S', 'X'), 'X', '') AS IS_RETURN
FROM `{{ project_id_src }}.{{ dataset_cdc_processed }}.lips` AS LIPS
INNER JOIN `{{ project_id_src }}.{{ dataset_cdc_processed }}.likp` AS LIKP
  ON LIKP.VBELN = LIPS.VBELN
    AND LIKP.MANDT = LIPS.MANDT
LEFT JOIN TCURX AS TCURX_WAERK
  ON LIKP.WAERK = TCURX_WAERK.CURRKEY