var SHEET_ID = "YOU SPREADSHEET ID";

/* 
 * GET Requests
 */
function doGet( req ) {
   var action    = req.parameter.action;
   var table_req = req.parameter.table;

   var db    = SpreadsheetApp.openById( SHEET_ID );
   var table = db.getSheetByName( table_req );

   switch(action) {
      //  case "read":
      //      return Read( req, table );
      //      break;
      // case "insert":
      //     return Insert( req, table );
      //     break;
      // case "update":
      //     return Update( req, table );
      //     break;
      //  case "delete":
      //      return Delete( req, table );
      //      break;
       default:
           break;
   }
}

/* 
 * POST Requests
 */
function doPost( req ) {
   var action    = req.parameter.action;
   var table_req = req.parameter.table;

   var db    = SpreadsheetApp.openById( SHEET_ID );
   var table = db.getSheetByName( table_req );

   switch(action) {
      case "read":
          return Read( req, table );
          break;
       case "insert":
           return Insert( req, table );
           break;
       case "update":
           return Update( req, table );
           break;
      case "delete":
          return Delete( req, table );
          break;
       default:
           break;
   }
}

/* Read
 * request for all tables
 *
 * @parameter action=read
 * @parameter table=<TABLE_NAME>
 * @parameter id=<COLUMN_ID>
 *
 * @example-request | ?action=read&table=<TABLE_NAME>
 * @example-request-single-row | ?action=read&table=<TABLE_NAME>&id=<ROW_NUMBER>&filter_type=<json/condition>&filter_json=<{"where":"and", "filter-1": "value-1", "filter-2":"value-2"}>&filter_condition=<record.filter-1 == 'value-1' || record.filter-2 == 'value-2'>
 */
function Read( request, table ) {
  var request_id = Number( request.parameter.id );
  var filter_type = request.parameter.filter_type;
  var filter_json = request.parameter.filter_json;
  var filter_condition = request.parameter.filter_condition;
  if (filter_type == "json") {
    var filter_obj = JSON.parse( filter_json );
  }
  
  // return response().json({
  //   success: true,
  //   data: request.parameter
  // });

  return response().json({
    success: true,
    data: _read( table, request_id, filter_type, filter_obj, filter_condition )
  });

}

/* Insert
 * dynamic for all data
 *
 * @parameter action=insert
 * @parameter table=<TABLE_NAME>
 * @parameter data=JSON
 *  
 * @example-request | ?action=insert&table=<TABLE_NAME>&data={"name":"John Doe"}
 */
function Insert( request, table ) {
  var errors = [];
  
  var last_col     = table.getLastColumn();
  var first_row    = table.getRange(1, 1, 1, last_col).getValues();
  var headers      = first_row.shift();
  //var data         = JSON.parse( request.parameter.data );
  var received_info = JSON.stringify( JSON.parse( request.parameter.data ) );
  var column = 1;
  var colArray = table.getRange(2, column, table.getLastRow()).getValues();
  var maxInColumn = colArray.sort(function(a,b){return b-a})[0][0];
  // var next_id = Number(Number(maxInColumn) + 1).toFixed(0);
  var next_id = Number(maxInColumn) + 1;
  var data = JSON.parse('{"id":' + next_id + ',' + received_info.slice(1));
  var new_row;
  var result = {};  

  try {
    new_row = prepareRow( data, headers );
    table.appendRow( new_row );
    
    result.success = true;
    result.data = data;
    
  } catch ( error ) {
    result.success = false;
    result.data = { error: error.messsage };
  }
  
  return response().json( result );
}

/* Update
 * dynamic for all tables
 *
 * @parameter action=update
 * @parameter table=<TABLE_NAME>
 * @parameter id=<COLUMN_ID>
 * @parameter data=JSON
 * 
 * @example-request | ?action=update&table=<TABLE_NAME>&id=<ID>&data={"col_to_update": "value" }
 */
function Update( request, table ) {
  var last_col      = table.getLastColumn();
  var first_row     = table.getRange(1, 1, 1, last_col).getValues();
  var headers       = first_row.shift();
  
  var request_id    = Number( request.parameter.id );
  var current_data  = _read( table, request_id );
  var data          = JSON.parse( request.parameter.data );
  
  var result = {};
  
  try {
    var current_row   = current_data.row;
    for( var object_key in data ) {
      var current_col = headers.indexOf( object_key ) + 1;
      table.getRange( current_row, current_col ).setValue( data[ object_key ]); // update iteratively
      current_data[ object_key ] = data[ object_key ]; // update for response;
    }
    result.successs = true;
    result.data = current_data;
  } catch ( error ) {
    result.success = false;
    result.data = { error: error.messsage };
  }
  
  return response().json( result );
}

/* Delete
 * dynamic for all tables
 *
 * @parameter action=delete
 * @parameter table=<TABLE_NAME>
 * @parameter id=<COLUMN_ID>
 * 
 * @example-request | ?action=update&table=<TABLE_NAME>&id=<ID>
 */
function Delete( request, table ) {
  var request_id    = Number( request.parameter.id );
  var current_data  = _read( table, request_id );
  
  // delete
  table.deleteRow( current_data.row );
  
  return response().json({
    success: true,
    data: current_data
  });
}

/**
 * Build the response content type 
 * back to the user
 */
function response() {
   return {
      json: function(data) {
         return ContentService
            .createTextOutput(JSON.stringify(data))
            .setMimeType(ContentService.MimeType.JSON);
      }
   }
}

/**
* Read from sheet and return map key-value
* javascript object
*/
function _read( sheet, id, filter_type, filter_obj, filter_condition ) {
  var data         = sheet.getDataRange().getValues();
  var header       = data.shift();
  
  // Find All
  var result = data.map(function( row, indx ) {
    var reduced = header.reduce( function(accumulator, currentValue, currentIndex) {
      accumulator[ currentValue ] = row[ currentIndex ];
      return accumulator;
    }, {});

    reduced.row = indx + 2;
    return reduced;
    
  });
  
  // Filter if id is provided
  if( id ) {
    var filtered = result.filter( function( record ) {
      if ( record.id === id ) {
        return true;
      } else {
        return false;
      }
    });
    
    return filtered.shift();
  } 

  // Filter if condition is provided
  if( typeof filter_type !== "undefined" ) {
    
    if( filter_type == "json" ) {
      // CONVERT '{"where":"and", "filter-1": "value-1", "filter-2":"value-2"}' TO ("record.filter-1 == 'value-1' && record.filter-2 == 'value-2'")
      var filter_condition = '';
      var count_filter = Number(Object.keys(filter_obj).length) - 1;
      Object.keys(filter_obj).forEach(function(key) {
        if (key != "where") {
          // Logger.log(key, filter_obj[key]);
          filter_condition += "record." + key + " == '" + filter_obj[key] + "'";
          if(count_filter > 1) {
            if(filter_obj['where'] == 'and') {
              filter_condition += " && ";
            } else if(filter_obj['where'] == 'or') {
              filter_condition += " || ";
            } else {
              filter_condition += "";
            }
          }
          count_filter --;
        }
      });
    }

    var filtered_info = result.filter( function( record ) {
      if ( eval(filter_condition) ) {        
        return true;
      } else {
        return false;
      }
    });
    
    return filtered_info;
    // return filtered_info.shift();
  }
  
  return result;
  
}

/*
 * Prepare row with correct order to insert into
 * sheet.
 * 
 * @throws Error
 */
function prepareRow( object_to_sort, array_with_order ) {
  var sorted_array   = [];
  
  for( var i=0; i<array_with_order.length; i++ ) {
    var value = object_to_sort[ array_with_order[ i ]];
    
    if( typeof value === 'undefined' ) {
      throw new Error( "The attribute/column <" + array_with_order[i] + "> is missing." );
    } else {
      sorted_array[i] = value;      
    }
  }

  return sorted_array;
}