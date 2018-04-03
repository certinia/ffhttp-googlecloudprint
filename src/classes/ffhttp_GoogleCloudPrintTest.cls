/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * ffhttp_GoogleCloudPrintTest
 *
 * This class contains the test methods for Google Cloud Print.
 */
 @istest
private  class ffhttp_GoogleCloudPrintTest 
{
	static testMethod void googleCloudPrintSubmitRequestBody()
	{
		ffhttp_GoogleCloudPrint.SubmitRequestBody srb = new ffhttp_GoogleCloudPrint.SubmitRequestBody();
		srb.setTitle('Testing')
		   .setContentType('text/plain')
		   .setPrinterId('__google__docs')
		   .setContent(Blob.valueOf('Test contents'));
		   
		System.assertEquals(srb.getPrinterId(), '__google__docs');
		System.assertEquals(srb.getTitle(), 'Testing');
		System.assertEquals(srb.getContent().toString(), 'Test contents');
		System.assertEquals(srb.getContentType(), 'text/plain');	
		
		System.assertEquals(srb.getHttpContent(), 'printerid=__google__docs&contentType=dataUrl&capabilities=&title=Testing&content=data:text/plain;base64,VGVzdCBjb250ZW50cw==');
	}
	
	static testMethod void googleCloudPrintSubmitRequest()
	{
		ffhttp_GoogleCloudPrint googleCloudPrint = createClient();
		
		ffhttp_GoogleCloudPrint.SubmitRequest submitRequest = googleCloudPrint.submitRequest('__google__docs', 'Testing', Blob.valueOf('Test contents'), 'text/plain');
		assertRequestEndpointAndMethod(submitRequest, 'https://www.google.com/cloudprint/submit', 'POST');
	}
	
	static testMethod void googleCloudPrintDeleteJobRequest()
	{
		ffhttp_GoogleCloudPrint googleCloudPrint = createClient();
		
		ffhttp_GoogleCloudPrint.DeleteJobRequest deleteJobRequest = googleCloudPrint.deleteJobRequest('dcfa3b7f-f1bf-3851-99f6-375f1320e939');
		assertRequestEndpointAndMethod(deleteJobRequest, 'https://www.google.com/cloudprint/deletejob?jobid=dcfa3b7f-f1bf-3851-99f6-375f1320e939', 'POST');
	
		System.assertEquals(deleteJobRequest.getJobId(), 'dcfa3b7f-f1bf-3851-99f6-375f1320e939');
	}
	
	static testMethod void googleCloudPrintJobRequest()
	{
		ffhttp_GoogleCloudPrint googleCloudPrint = createClient();
		
		ffhttp_GoogleCloudPrint.JobsRequest jobsRequest = googleCloudPrint.jobsRequest();
		assertRequestEndpointAndMethod(jobsRequest, 'https://www.google.com/cloudprint/jobs', 'POST');
		
		jobsRequest.setPrinterId('__google__docs')
				   .setOwner('mwood@financialforce.com')
				   .setStatus('DONE')
				   .setQ('testing')
				   .setOffset('5')
				   .setLimit('1')
				   .setSortOrder('TITLE_DESC');
		
		System.assertEquals(jobsRequest.getPrinterId(), '__google__docs');
		System.assertEquals(jobsRequest.getOwner(), 'mwood@financialforce.com');
		System.assertEquals(jobsRequest.getStatus(), 'DONE');
		System.assertEquals(jobsRequest.getQ(), 'testing');
		System.assertEquals(jobsRequest.getOffset(),'5');
		System.assertEquals(jobsRequest.getLimit(), '1');
		System.assertEquals(jobsRequest.getSortOrder(), 'TITLE_DESC');
	}
	
	static testMethod void googleCloudPrintPrinterRequest()
	{
		ffhttp_GoogleCloudPrint googleCloudPrint = createClient();
		
		ffhttp_GoogleCloudPrint.PrinterRequest printerRequest = googleCloudPrint.printerRequest('__google__docs');
		assertRequestEndpointAndMethod(printerRequest, 'https://www.google.com/cloudprint/printer?printerid=__google__docs', 'POST');
	
		printerRequest.setUseCdd(true)
					  .setExtraFields('ALL');
					  
		System.assertEquals(printerRequest.getPrinterId(), '__google__docs');
		System.assertEquals(printerRequest.getUseCdd(), true);
		System.assertEquals(printerRequest.getExtraFields(), 'ALL');
	}
	
	static testMethod void googleCloudPrintSearchRequest()
	{
		ffhttp_GoogleCloudPrint googleCloudPrint = createClient();
		
		ffhttp_GoogleCloudPrint.SearchRequest searchRequest = googleCloudPrint.searchRequest();
		assertRequestEndpointAndMethod(searchRequest, 'https://www.google.com/cloudprint/search', 'POST');
		
		searchRequest.setQ('doc')
					 .setType('DRIVE')
					 .setConnectionStatus('ONLINE')
					 .setUseCdd(true)
					 .setExtraFields('ALL');
		
		System.assertEquals(searchRequest.getQ(), 'doc');
		System.assertEquals(searchRequest.getType(), 'DRIVE');
		System.assertEquals(searchRequest.getConnectionStatus(), 'ONLINE');
		System.assertEquals(searchRequest.getUseCdd(), true);
		System.assertEquals(searchRequest.getExtraFields(), 'ALL');			 
	}	
	
	static testMethod void testCloudPrintResponse()
	{
		ffhttp_GoogleCloudPrint.CloudPrintResponse response = new ffhttp_GoogleCloudPrint.CloudPrintResponse();
		response.setSuccess(true);
		response.setMessage('Print job added');
		response.setJob(null);
		response.setJobs(null);
		response.setPrinters(null);
		
		System.assertEquals(response.getSuccess(), true);
		System.assertEquals(response.getMessage(), 'Print job added');
		System.assertEquals(response.getJob(), null);
		System.assertEquals(response.getJobs(), null);
		System.assertEquals(response.getPrinters(), null);
	}
	
	private static ffhttp_GoogleCloudPrint createClient()
	{
		return new ffhttp_GoogleCloudPrint(new ffhttp_Client.AccessTokenCredentials('Bearer', 'Test Token'));
	}
	
	private static void assertRequestEndpointAndMethod(ffhttp_Client.AbstractClientRequest request, 
													   String endpoint, String method)
	{
		System.HttpRequest httpRequest = request.buildHttpRequest();
		System.assertEquals(httpRequest.getEndpoint(), endpoint);
		System.assertEquals(httpRequest.getMethod(), method);
	}
}
