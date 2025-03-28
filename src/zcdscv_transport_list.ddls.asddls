@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - TR Main List'
@Metadata.allowExtensions: true
define root view entity zcdscv_transport_list
  provider contract transactional_query
  as projection on zcdsiv_transport_list
{
     
  key Trkorr, 
      Trfunction,
      TrStatus,
      Tarsystem,
      As4user,
      As4date,
      As4time,
      AS4text,
      TrTypeDesc,
      TrStatusDesc,
      /* Associations */
      _Task : redirected to composition child zcdscv_task_list
      
}
