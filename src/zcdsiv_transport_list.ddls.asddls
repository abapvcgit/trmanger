@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - TR Main List'
@Search.searchable: true
define root view entity zcdsiv_transport_list
  as select from e070 as Transport
    inner join   e07t as TransportDesc on  Transport.trkorr    = TransportDesc.trkorr
                                       and TransportDesc.langu = $session.system_language
 composition [0..*] of zcdsiv_task_list as _Task
 association [1] to zcdsiv_vh_trtype as _TrType on $projection.Trfunction = _TrType.Trtype
 association [1] to zcdsiv_vh_trstatus as _TrStatus on $projection.TrStatus = _TrStatus.TrStatus
{
  key Transport.trkorr      as Trkorr,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'TrTypeDesc' ]
      Transport.trfunction  as Trfunction,
      _TrType.TrTypeText as TrTypeDesc,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'TrStatusDesc' ]
      @Consumption.filter.defaultValue: 'D'
      Transport.trstatus    as TrStatus,
      _TrStatus.TrStatusText as TrStatusDesc,
      Transport.tarsystem   as Tarsystem,
      Transport.as4user     as As4user,
      Transport.as4date     as As4date,
      Transport.as4time     as As4time,
      @Search.defaultSearchElement: true
      TransportDesc.as4text as AS4text,
     _Task,
     _TrType,
     _TrStatus
}
where
       Transport.as4user    <> 'SAP'
  and(
       Transport.trfunction =  'K'
    or Transport.trfunction =  'W'
    or Transport.trfunction =  'T'
  )
  and Transport.strkorr    is initial
