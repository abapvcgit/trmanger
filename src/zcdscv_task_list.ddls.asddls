@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - TR Task List'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcdscv_task_list
  as projection on zcdsiv_task_list
{
  key Trkorr,
  key As4pos,
      Pgmid,
//      Object,
      ObjName,
      SubTask_Number,
      Objfunc,
      Lockflag,
      Gennum,
      Lang,
      Activity,
      Description,
      /* Associations */
      _Transport : redirected to parent zcdscv_transport_list
}
