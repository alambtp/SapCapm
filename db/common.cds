namespace rustam.common;

using {
    sap,
    Currency,
    temporal,
    managed
} from '@sap/cds/common';

type Gender      : String(1) enum {
    male         = 'M';
    female       = 'F';
    nonBinary    = 'N';
    noDisclosure = 'D';
    selfDescribe = 'S';
};

type AmountT : Decimal(15,2)@(
    Semantics.amount.currencyCode: 'CURRRENCY_CODE',
    sap.unit: 'CURRRENCY_CODE'
);

abstract entity Amount {
    CURRENCY_CODE: String(4);
    GROSS_AMOUNT : AmountT;
    NET_AMOUNT   : AmountT;
    TAX_AMOUNT   : AmountT;
}

type PhoneNumber : String(30) @assert.format: '^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
type Email       : String(255) @assert.format: '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
