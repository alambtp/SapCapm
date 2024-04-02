const cds = require('@sap/cds')
module.exports = function (){
    const {
        EmployeeSet, POs
    } = this.entities;

    this.before ('UPDATE','EmployeeSet', (req)=>{
        console.log("Employee Salary Update Request ");
        if(parseFloat(req.data.salaryAmount) >= 1000000){
            req.error(500, "Salary must be below 1MN");
        }
    });

    this.on('boost', async req =>{
        try {
            const ID = req.params[0];
            console.log(req.params[0]);
            console.log("Your Purchase order with ID --->" + ID + "will be Bossted");
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT: { '+=' : 20000}, NOTE: "Boosted"
            }).where(ID);
            return {};
        } catch (error) {
            return "Error " + error.toString();
        }
    });

    this.on('largestOrder', async req =>{
        try {
            const ID = req.params[0];
            console.log("Get The Largest Order");
            const tx = cds.tx(req);
            const repl = await tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
            return repl;
        } catch (error) {
            return "Error " + error.toString();
        }
    });
}
