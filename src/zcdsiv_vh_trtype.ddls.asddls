@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ValueHelp Transport Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity zcdsiv_vh_trtype as select from dd07t
{
    @Search.defaultSearchElement: true
       @Search.fuzzinessThreshold: 0.8
       @ObjectModel.text.element: ['TrTypeText']
  key domvalue_l as  Trtype,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      ddtext as TrTypeText
}
where
  (
       domvalue_l = 'K'
    or domvalue_l = 'W'
    or domvalue_l = 'T'
  )
  and  domname    = 'TRFUNCTION'

  and  ddlanguage = $session.system_language
