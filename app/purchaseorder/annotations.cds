using CatalogService as service from '../../srv/CatalogService';
annotate service.POs with @(
    UI: {
        SelectionFields : [
            PO_ID,
            GROSS_AMOUNT,
            PARTNER_GUID_NODE_KEY
        ],
        LineItem : [
            {
                $Type : 'UI.DataField',
                Label: '{i18n>Poid}',
                Value : PO_ID,
            },{
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
              $Type: 'UI.DataFieldForAction',
              Label: 'Boost',
              Action: 'CatalogService.boost',
              Inline: true
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            },{
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>Country}',
                Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
            },{
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>LIFECYCLE_STATUS}',
                Value : LIFECYCLE_STATUS,
                Criticality: Criticality,
                CriticalityRepresentation: #WithIcon
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>PurchaseOrder}',
            TypeNamePlural : '{i18n>PurchaseOrders}',
            Title: {
                Label: '{i18n>POID}',
                Value: PO_ID
            },
            Description: {
                Label: '{i18n>DESC}',
                Value: PARTNER_GUID.COMPANY_NAME
            },
            ImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/SAP_2011_logo.svg/1200px-SAP_2011_logo.svg.png',
        },
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Label: '{i18n>POGeneralInfo}',
                Target : ![@UI.FieldGroup#HeaderGeneralInformation],
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>PoItemDetails}',
                Target: 'Items/@UI.LineItem',
            }
        ],
        FieldGroup#HeaderGeneralInformation  : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Label: '{i18n>POID}',
                    Value : PO_ID,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>PARTNER_GUID_NODE_KEY}',
                    Value : PARTNER_GUID_NODE_KEY,
                },{
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID.COMPANY_NAME,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>BP_ID}',
                    Value : PARTNER_GUID.BP_ID,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>NET_AMOUNT}',
                    Value : NET_AMOUNT,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>TAX_AMOUNT}',
                    Value : TAX_AMOUNT,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>CURRENCY_CODE}',
                    Value : CURRENCY_CODE,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>LIFECYCLE_STATUS}',
                    Value : LIFECYCLE_STATUS,
                },
            ]
        },
    }
);
annotate CatalogService.POItems with @(
    UI:{
        LineItem : [
           {
                $Type : 'UI.DataField',
                Label: '{i18n>PO_ITEM_POS}',
                Value : PO_ITEM_POS,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>PRODUCT_GUID_NODE_KEY}',
                Value : PRODUCT_GUID_NODE_KEY,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>PRODUCT_ID}',
                Value : PRODUCT_GUID.PRODUCT_ID,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>GROSS_AMOUNT}',
                Value : GROSS_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>NET_AMOUNT}',
                Value : NET_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>TAX_AMOUNT}',
                Value : TAX_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Label: '{i18n>CURRENCY_CODE}',
                Value : CURRENCY_CODE,
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'PO Item',
            TypeNamePlural : 'PO Items',
            Title: {
                Label: '{i18n>POID}',
                Value: ID
            },
            Description: {
                Label: '{i18n>DESC}',
                Value: PO_ITEM_POS,
            }
        },
        Facets : [
            {
                Label: '{i18n>lineItemHeader}',
                $Type: 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#LineItemHeader',
            },{
                Label: 'Product Details',
                $Type: 'UI.ReferenceFacet',
                Target: 'PRODUCT_GUID/@UI.FieldGroup#ProductDetails',
            }
        ],
        FieldGroup#LineItemHeader  : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Label: '{i18n>PO_ITEM_POS}',
                    Value : PO_ITEM_POS,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>PRODUCT_GUID_NODE_KEY}',
                    Value : PRODUCT_GUID_NODE_KEY,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>DESC}',
                    Value : PRODUCT_GUID.DESCRIPTION,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>GROSS_AMOUNT}',
                    Value : GROSS_AMOUNT,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>TAX_AMOUNT}',
                    Value : TAX_AMOUNT,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>NET_AMOUNT}',
                    Value : NET_AMOUNT,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>CURRENCY_CODE}',
                    Value : CURRENCY_CODE,
                },
            ]            
        },
    }
);

annotate CatalogService.ProductSet with @(
    UI: {
        HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Product',
            TypeNamePlural : 'Products',
            Title: {
                Value: PRODUCT_ID
            },
            Description: {
                Value: DESCRIPTION
            },
            ImageUrl: 'sap-icon://product'
        },
        FieldGroup#ProductDetails : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Label: '{i18n>PRODUCT_ID}',
                    Value : PRODUCT_ID,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>DESCRIPTION}',
                    Value : DESCRIPTION,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>TYPE_CODE}',
                    Value : TYPE_CODE,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>CATEGORY}',
                    Value : CATEGORY,
                },{
                    $Type : 'UI.DataField',
                    Label: '{i18n>COMPANY_NAME}',
                    Value : SUPPLIER_GUID.COMPANY_NAME,
                },
            ]
        },
    }
);


annotate service.POs with {
    PARTNER_GUID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BPSet',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : PARTNER_GUID_NODE_KEY,
                ValueListProperty : 'NODE_KEY',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'BP_ROLE',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'EMAIL_ADDRESS',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'PHONE_NUMBER',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FAX_NUMBER',
            },
        ],
    }
};

