@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - TR Task List'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zcdscv_task_list
  as projection on zcdsiv_task_list
{

  key  Trkorr,
       Trfunction,
       Trstatus,
       Tarsystem,
       Korrdev,
       As4user,
       As4date,
       As4time,
       Strkorr,
       TaskDescription,
       /* Associations */
       _Transport : redirected to parent zcdscv_transport_list
}
