component{


  /**
 *
 * @param queryStr
 */
  public struct function findAll(string queryStr=""){
    var queryPrep = "";
    var bucketName = application.couchbase.getCouchbaseConfig().getBucketName();
    if (len(arguments.queryStr) == 3) {
      queryPrep = "SELECT airportname FROM `" & bucketName & "` WHERE faa ='" & uCase(queryStr) & "'";
    }
    else if(len(arguments.queryStr) == 4) {
      queryPrep = "SELECT airportname FROM `" & bucketName & "` WHERE icao ='" & uCase(queryStr) & "'";
    }
    else {
      queryPrep = "SELECT airportname FROM `" & bucketName & "` WHERE airportname LIKE '" & queryStr & "%'";
    }
    return application.couchbase.n1qlQuery(
      statement=queryPrep
    );
  }

}