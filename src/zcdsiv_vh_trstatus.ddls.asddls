@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ValueHelp Transport status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity zcdsiv_vh_trstatus as select from dd07t
{
    @Search.defaultSearchElement: true
       @Search.fuzzinessThreshold: 0.8
       @ObjectModel.text.element: ['TrStatusText']
  key domvalue_l as  TrStatus,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      ddtext as TrStatusText
}
where
   (
       domvalue_l = 'D'
    or domvalue_l = 'R'
  )
  and  domname    = 'TRSTATUS'
  and  ddlanguage = $session.system_language
