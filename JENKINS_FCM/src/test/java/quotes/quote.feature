Feature: quote endpoints

Background:
* url baseURL


 Scenario Outline: notnull valiadation Quotetraveller
#Given url 'http://localhost/quote/api/Quotes/GetQuoteCRPDetailsByQuoteID'
Given path 'GetQuoteCRPDetailsByQuoteID'
* def req =  read('some-big-payload.json')

Given request req
When method post
Then status 200
And  print 'TOTAL: ' +response.Content.Response
* def resString = response.Content.Response
* def strVar = resString
* json jsonVar = strVar
* def DBExample = Java.type('com.flight.database.flightdb')
* def result = DBExample.create2(database,colname)
* match jsonVar.Quote.QuoteTravellersDetails[0].CreatedBy ==  result.Quote.QuoteTravellersDetails[0].CreatedBy
* match jsonVar.Quote.QuoteTravellersDetails[<id>].<param> == '#notnull'
 
Examples:
|id|param|
|0|ID|
|1|ID|
|0|BrandCode|
|1|BrandCode|
|0|QuoteID|
|1|QuoteID|
|0|SabreProfileID|
|1|SabreProfileID|


Scenario Outline: notnull valiadation Componentdetail
Given path 'GetQuoteCRPDetailsByQuoteID'
* def req =  read('some-big-payload.json')

Given request req
When method post
Then status 200
And  print 'TOTAL: ' +response.Content.Response
* def resString = response.Content.Response
* def strVar = resString
* json jsonVar = strVar
* match jsonVar.Quote.QuoteComponentsDetails[<id>].<param> == '#notnull'
 
Examples:
|id|param|
|0|ID|
|1|ID|
|0|BrandCode|
|1|BrandCode|
|0|QuoteID|
|1|QuoteID|
|0|ComponentCode|
|1|ComponentCode|


Scenario: Ticketnumber Validation

Given path 'GetQuoteCRPDetailsByQuoteID'
* def req =  read('some-big-payload.json')
Given request req
When method post
Then status 200
* def resString = response.Content.Response
* def strVar = resString
* json jsonVar = strVar

 * match jsonVar.TicketInvoice[0].TicketNumber == '#regex [0-9]+'
 * assert  jsonVar.TicketInvoice[0].TicketNumber.length ==  13
 
Scenario: DkNUM validation

Given path 'GetQuoteCRPDetailsByQuoteID'
* def req =  read('some-big-payload.json')
Given request req
When method post
Then status 200
* def resString = response.Content.Response
* def strVar = resString
* json jsonVar = strVar
* assert  jsonVar.TicketInvoice[0].DKNumber.length ==  6 || jsonVar.TicketInvoice[0].DKNumber.length ==  7 
 * match jsonVar.TicketInvoice[0].DKNumber == '#regex ^[a-zA-Z0-9]*$'
 
Scenario: logical condition

Given path 'GetQuoteCRPDetailsByQuoteID'
* def req =  read('some-big-payload.json')
Given request req
When method post
Then status 200
* def resString = response.Content.Response
* def strVar = resString
* json jsonVar = strVar




 
