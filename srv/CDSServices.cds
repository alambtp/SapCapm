using { rustam.db.CDSViews } from '../db/CDSViews';

service CDSService@(path: '/CDSService') {

entity POWorklist as projection on CDSViews.POWorklist;
entity ProductOrders as projection on CDSViews.ProductViewSub;
entity ProductAggregation as projection on CDSViews.CProductValueView;    

}
