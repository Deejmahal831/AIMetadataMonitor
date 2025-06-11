public with sharing class MetadataCollector {
    public static void snapshotApexComponents() {
        List<Metadata_Snapshot__c> snapshots = new List<Metadata_Snapshot__c>();

        // Apex Classes
        for (ApexClass ac : [SELECT Name, LastModifiedDate, LastModifiedBy.Name FROM ApexClass]) {
            snapshots.add(new Metadata_Snapshot__c(
                Component_Name__c = ac.Name,
                Component_Type__c = 'ApexClass',
                Last_Modified_Date__c = ac.LastModifiedDate,
                Last_Modified_By__c = ac.LastModifiedBy.Name,
                Snapshot_Timestamp__c = System.now()
            ));
        }

        // Apex Triggers
        for (ApexTrigger at : [SELECT Name, LastModifiedDate, LastModifiedBy.Name FROM ApexTrigger]) {
            snapshots.add(new Metadata_Snapshot__c(
                Component_Name__c = at.Name,
                Component_Type__c = 'Trigger',
                Last_Modified_Date__c = at.LastModifiedDate,
                Last_Modified_By__c = at.LastModifiedBy.Name,
                Snapshot_Timestamp__c = System.now()
            ));
        }

        if (!snapshots.isEmpty()) {
            insert snapshots;
        }
    }
}
