using { rustam.db.master, rustam.db.transaction } from '../db/datamodel';
service CatalogService@(path: '/CatalogService') {
    @Capabilities: { Insertable,Updatable : true,Deletable}
    entity EmployeeSet as projection on master.employees;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    // entity ProductTextSet as projection on master.prodtext;
    @readonly
    entity BPSet as projection on master.businesspartner;

    // http://localhost:4004/CatalogService/POs
    // http://localhost:4004/CatalogService/POs('5P29FC40CA471067B31D00DD0106DA01')?$expand=Items
    entity POs @( 
        title: '{i18n>poHeader}',
        odata.draft.enabled: true
        ) as projection on transaction.purchaseorder{
            *,
            round(GROSS_AMOUNT,2) as GROSS_AMOUNT : Decimal(15,2),
            case LIFECYCLE_STATUS
               when 'N' then 'New'
               when 'D' then 'Delivered'
               when 'B' then 'Blocked'
            end as LIFECYCLE_STATUS: String(8),
            case LIFECYCLE_STATUS
               when 'N' then 2
               when 'B' then 1
               when 'D' then 3
            end as Criticality: Integer,
            Items: redirected to POItems
        }actions{
            function largestOrder() returns array of POs;
            action boost();
        }
       

        entity POItems @( title: '{i18n>poItems}' )
         as projection on transaction.poitems{
            *,
            PARENT_KEY: redirected to POs,
            PRODUCT_GUID: redirected to ProductSet
         }
        // http://localhost:4004/CatalogService/POItems('4P29FC40CA471067B31D00DD01LD1010')
        // http://localhost:4004/CatalogService/POItems('4P29FC40CA471067B31D00DD01LD1010')?$expand=PARENT_KEY,PRODUCT_GUID
}
