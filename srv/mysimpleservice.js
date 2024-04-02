const cds = require("@sap/cds")
const { employees } = cds.entities("rustam.db.master");
const mysrvdemo = function(srv){
    srv.on('myFunction', (req, res) =>{
        return "Hay " + req.data.msg;
    });

    srv.on("READ", "ReadEmployeeSrv", async(req, res)=> {
        var results = [];
        // results.push({
        //     "ID": "7B4569874D56587456987564",
        //     "nameFirst": "ALam",
        //     "nameLast": "Test"
        // });

        // tx=> Transaction, req=> current request. 
        //run=> Run the current transaction request for Employee.
        //1. CDS Query Language 
        results = await cds.tx(req).run(SELECT.from(employees));

        //2. CDS Query to Read single record with where
        //results = await cds.tx(req).run(SELECT.from(employees).where({"nameFirst": "Md1"}));

        //3. CDS Query if user pass key like /Entity/key
        var whereCondition = req.data;
        console.log(whereCondition);
        if(whereCondition.hasOwnProperty("ID")){
            results = await cds.tx(req).run(SELECT.from(employees).where(whereCondition));
        }else{
            results = await cds.tx(req).run(SELECT.from(employees).limit(1)); //any random employee.
        }

        return results;
    });

    srv.on("CREATE", "InsertEmployeeSrv", async(req, res) => {
    console.log(req.data);

        let returnData = await cds.transaction(req).run([
            INSERT.into(employees).entries([req.data])
        ]).then( (resolve, reject)=>{
            if(typeof(resolve) !== undefined){
                return req.data;
            }else{
                req.error(500, "There was an issue in Insert");
            }
        }).catch(err=>{
            erq.error(500, "There was as Error" + err.toSting());
        });

        return returnData;
    });

    srv.on("UPDATE", "UpdateEmployeeSrv", async(req, res)=>{
        let returnData = await cds.transaction(req).run([
            UPDATE(employees).set({
                nameFirst: req.data.nameFirst
            }).where({ ID : req.data.ID}),
            UPDATE(employees).set({
                nameLast: req.data.nameLast
            }).where({ ID: req.data.ID })
        ]).then( (resolve, reject)=>{
            if(typeof(resolve) !== undefined){
                return req.data;
            }else{
                req.error(500, "There was an issue in Insert");
            }
        }).catch(err=>{
            erq.error(500, "There was as Error" + err.toSting());
        });
        return returnData;
    });

    srv.on("DeleteEmployeeSrv", "UpdateEmployeeSrv", async(req, res)=>{
        let returnData = await cds.transaction(req).run([
            DELETE.from(employees).where(req.data)
        ]).then( (resolve, reject)=>{
            if(typeof(resolve) !== undefined){
                return req.data;
            }else{
                req.error(500, "There was an issue in Insert");
            }
        }).catch(err=>{
            erq.error(500, "There was as Error" + err.toSting());
        });
        return returnData;
    });
}

module.exports = mysrvdemo;