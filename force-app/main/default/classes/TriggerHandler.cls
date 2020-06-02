public virtual with sharing class TriggerHandler {
    
    public void run(){
        //Insert Trigger
        if(Trigger.isInsert){
            if(Trigger.isAfter){
                this.afterInsert(Trigger.new);
            } else if(Trigger.isBefore){
                this.beforeInsert(Trigger.new);
            }
        }
        
        //Update Trigger
        else if(Trigger.isUpdate){
            if(Trigger.isAfter){
                this.afterUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
            }
            else if(Trigger.isBefore){
                this.beforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
            }
        }

        //<<TODO - Delete Trigger>>
       
    }

    protected virtual void beforeInsert(List<SObject> newRecords) {}
    protected virtual void beforeUpdate(List<SObject> updatedRecords, Map<Id, SObject> updatedRecordsMap, List<SObject> oldRecords, Map<Id, SObject> oldRecordsMap) {}
    protected virtual void afterInsert(List<SObject> newRecords) {}
    protected virtual void afterUpdate(List<SObject> updatedRecords, Map<Id, SObject> updatedRecordsMap, List<SObject> oldRecords, Map<Id, SObject> oldRecordsMap) {}
    //<<TODO>> virtual methods for Delete and Undelete to be added
    
}
