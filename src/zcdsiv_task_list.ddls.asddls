@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - TR Task List'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcdsiv_task_list
  as select from e070
    inner join   e07t on  e07t.trkorr = e070.trkorr
                      and e07t.langu  = $session.system_language
  association to parent zcdsiv_transport_list as _Transport on $projection.Strkorr = _Transport.Trkorr
{
  key e070.trkorr     as Trkorr,
      e070.trfunction as Trfunction,
      e070.trstatus   as Trstatus,
      e070.tarsystem  as Tarsystem,
      e070.korrdev    as Korrdev,
      e070.as4user    as As4user,
      e070.as4date    as As4date,
      e070.as4time    as As4time,
      e070.strkorr    as Strkorr,
      e07t.as4text    as TaskDescription,
      _Transport
}
where
  e070.trfunction = 'S'
