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
  as select from e071 as Task
    inner join   e07t as TaskDesc on  Task.trkorr    = TaskDesc.trkorr
                                  and TaskDesc.langu = $session.system_language
  association to parent zcdsiv_transport_list as _Transport on $projection.Trkorr = _Transport.Trkorr
{
  key Task.trkorr                     as Trkorr,
  key Task.as4pos                     as As4pos,
      Task.pgmid                      as Pgmid,
//      Task.object                     as Object,
      Task.obj_name                   as ObjName,
      substring(Task.obj_name, 1, 10) as SubTask_Number,
      Task.objfunc                    as Objfunc,
      Task.lockflag                   as Lockflag,
      Task.gennum                     as Gennum,
      Task.lang                       as Lang,
      Task.activity                   as Activity,
      TaskDesc.as4text                as Description,
      _Transport
}
where
      Task.pgmid  = 'CORR'
  and Task.object = 'MERG'
