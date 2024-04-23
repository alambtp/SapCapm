sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchase/app/purchaseorder/test/integration/FirstJourney',
		'purchase/app/purchaseorder/test/integration/pages/POsList',
		'purchase/app/purchaseorder/test/integration/pages/POsObjectPage',
		'purchase/app/purchaseorder/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchase/app/purchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);