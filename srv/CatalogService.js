const cds = require('@sap/cds')
module.exports = function (){
    this.before ('UPDATE','EmployeeSet', (req)=>{
        console.log("Employee Salary Update Request ");
        if(parseFloat(req.data.salaryAmount) >= 1000000){
            req.error(500, "Salary must be below 1MN");
        }
    })
}
