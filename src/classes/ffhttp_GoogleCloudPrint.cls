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
 * ffhttp_GoogleCloudPrint
 *
 * The main GoogleCloudPrint client class.
 * This class contains the methods to access each of the Google Cloud Print API calls 
 * found at https://developers.google.com/cloud-print/docs/sendJobs.
 */
public with sharing class ffhttp_GoogleCloudPrint extends ffhttp_Client.AbstractClient
{
	//statics
	//printer types
	public static final String PRINTER_TYPE_GOOGLE = 'GOOGLE';
	public static final String PRINTER_TYPE_HP = 'HP';
	public static final String PRINTER_TYPE_DOCS = 'DOCS';
	public static final String PRINTER_TYPE_DRIVE = 'DRIVE';
	public static final String PRINTER_TYPE_FEDEX = 'FEDEX';
	public static final String PRINTER_TYPE_ANDROID_CHROME_SNAPSHOT = 'ANDROID_CHROME_SNAPSHOT';
	public static final String PRINTER_TYPE_IOS_CHROME_SNAPSHOT = 'IOS_CHROME_SNAPSHOT';
	
	//job status
	public static final String JOB_STATUS_QUEUED = 'QUEUED';				//Job just added and has not yet been downloaded
	public static final String JOB_STATUS_IN_PROGRESS = 'IN_PROGRESS';		//Job downloaded and has been added to the client-side native printer queue
	public static final String JOB_STATUS_DONE = 'DONE';					//Job printed successfully
	public static final String JOB_STATUS_ERROR = 'ERROR';					//Job cannot be printed due to an error
	public static final String JOB_STATUS_SUBMITTED = 'SUBMITTED';			//Job submitted to third-party service (only used for FedEx printer)
	public static final String JOB_STATUS_HELD = 'HELD';					//Job was successfully submitted but is pending some user action before being QUEUED
		
	//job sort order
	public static final String JOB_SORT_ORDER_CREATE_TIME = 'CREATE_TIME'; 				//Sort jobs in chronological order of submission.
	public static final String JOB_SORT_ORDER_CREATE_TIME_DESC = 'CREATE_TIME_DESC'; 	//Sort jobs in reverse chronological order of submission.
	public static final String JOB_SORT_ORDER_STATUS = 'STATUS';						//Sort jobs in ascending* order of status.
	public static final String JOB_SORT_ORDER_STATUS_DESC = 'STATUS_DESC';				//Sort jobs in descending* order of status.
	public static final String JOB_SORT_ORDER_TITLE = 'TITLE';							//Sort jobs in lexicographic order of title.
	public static final String JOB_SORT_ORDER_TITLE_DESC = 'TITLE_DESC';				//Sort jobs in reverse lexicographic order of title.
	
	//connection status
	public static final String CONNECTION_STATUS_ONLINE = 'ONLINE';		//The printer has an active XMPP connection to Google Cloud Print.
	public static final String CONNECTION_STATUS_UNKNOWN = 'UNKNOWN'; 	//The printer's connection status cannot be determined.
	public static final String CONNECTION_STATUS_OFFLINE = 'OFFLINE';	//The printer is offline.
	public static final String CONNECTION_STATUS_DORMANT = 'DORMANT'; 	//The printer has been offline for quite a while.
	
	//urls
	public static final String GOOGLE_CLOUD_PRINT_API_URL = 'https://www.google.com/cloudprint';
	
	public static final String GOOGLE_CLOUD_PRINT_URL_DELETE_JOB = '/deletejob';
	public static final String GOOGLE_CLOUD_PRINT_URL_JOBS = '/jobs';
	public static final String GOOGLE_CLOUD_PRINT_URL_PRINTER = '/printer';
	public static final String GOOGLE_CLOUD_PRINT_URL_SEARCH = '/search';
	public static final String GOOGLE_CLOUD_PRINT_URL_SUBMIT = '/submit';
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleCloudPrint(ffhttp_Client.Credentials credentials) 
	{ 
		this.setCredentials(credentials);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	public SubmitRequest submitRequest(String printerId, String title, Blob content, String contentType)
	{
		SubmitRequestBody srb = new SubmitRequestBody();
		srb.setTitle(title)
		   .setContentType(contentType)
		   .setPrinterId(printerId)
		   .setContent(content);
		
		return new SubmitRequest(this, srb);
	}
	
	public DeleteJobRequest deleteJobRequest(String jobId)
	{
		return new DeleteJobRequest(this, jobId);
	}
	
	public JobsRequest jobsRequest()
	{
		return new JobsRequest(this);
	}
	
	public PrinterRequest printerRequest(String printerId)
	{
		return new PrinterRequest(this, printerId);
	}
	
	public SearchRequest searchRequest()
	{
		return new SearchRequest(this);
	}
	
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class SubmitRequest extends GoogleCloudPrintRequest
	{
		SubmitRequest(ffhttp_GoogleCloudPrint service, SubmitRequestBody content)
		{
			super(service, GOOGLE_CLOUD_PRINT_URL_SUBMIT, content);
		}
	}
	
	public class DeleteJobRequest extends GoogleCloudPrintRequest
	{
		DeleteJobRequest(ffhttp_GoogleCloudPrint service, String jobId)
	 	{
			super(service, GOOGLE_CLOUD_PRINT_URL_DELETE_JOB, null);
			setJobId(jobId);	
		}
		
		/**
		 * Request Parameters
		 */
		public String getJobId()
		{
			return getParam('jobid');
		}
		public DeleteJobRequest setJobId(String jobid)
		{
			addParam('jobid', jobid);
			return this;
		}
	}
	
	public class JobsRequest extends GoogleCloudPrintRequest
	{ 
	 	JobsRequest(ffhttp_GoogleCloudPrint service)
	 	{
			super(service, GOOGLE_CLOUD_PRINT_URL_JOBS, null);
		}
		
		/**
		 * Request Parameters
		 */
		public String getPrinterId()
		{
			return getParam('printerid');
		}
		public JobsRequest setPrinterId(String printerId)
		{
			addParam('printerid', printerid);
			return this;
		}
		public String getOwner()
		{
			return getParam('owner');
		}
		public JobsRequest setOwner(String owner)
		{
			addParam('owner', owner);
			return this;
		}
		public String getStatus()
		{
			return getParam('status');
		}
		public JobsRequest setStatus(String status)
		{
			addParam('status', status);
			return this;
		}
		public String getQ()
		{
			return getParam('q');
		}
		public JobsRequest setQ(String q)
		{
			addParam('q', q);
			return this;
		}
		public String getOffset()
		{
			return getParam('offset');
		}
		public JobsRequest setOffset(String offset)
		{
			addParam('offset', offset);
			return this;
		}
		public String getLimit()
		{
			return getParam('limit');
		}
		public JobsRequest setLimit(String limitStr)
		{
			addParam('limit', limitStr);
			return this;
		}
		public String getSortOrder()
		{
			return getParam('sortorder');
		}
		public JobsRequest setSortOrder(String sortOrder)
		{
			addParam('sortorder', sortOrder);
			return this;
		}
	}
	
	public class PrinterRequest extends GoogleCloudPrintRequest
	{
		PrinterRequest(ffhttp_GoogleCloudPrint service, String printerId)
	 	{
			super(service, GOOGLE_CLOUD_PRINT_URL_PRINTER, null);
			setPrinterId(printerId);
		}
		
		/**
		 * Request Parameters
		 */
		public String getPrinterId()
		{
			return getParam('printerid');
		}
		public PrinterRequest setPrinterId(String printerId)
		{
			addParam('printerid', printerid);
			return this;
		}
		public Boolean getUseCdd()
		{
			return getParam('use_cdd', false);
		}
		public PrinterRequest setUseCdd(Boolean useCdd)
		{
			addParam('use_cdd', useCdd);
			return this;
		}
		public String getExtraFields()
		{
			return getParam('extra_fields');
		}
		public PrinterRequest setExtraFields(String extraFields)
		{
			addParam('extra_fields', extraFields);
			return this;
		}
	}

	public class SearchRequest extends GoogleCloudPrintRequest
	{ 
	 	SearchRequest(ffhttp_GoogleCloudPrint service)
	 	{
			super(service, GOOGLE_CLOUD_PRINT_URL_SEARCH, null);
		}
		
		/**
		 * Request Parameters
		 */
		public String getQ()
		{
			return getParam('q');
		}
		public SearchRequest setQ(String q)
		{
			addParam('q', q);
			return this;
		}
		public String getType()
		{
			return getParam('type');
		}
		public SearchRequest setType(String type)
		{
			addParam('type', type);
			return this;
		}
		public String getConnectionStatus()
		{
			return getParam('connection_status');
		}
		public SearchRequest setConnectionStatus(String connectionStatus)
		{
			addParam('connection_status', connectionStatus);
			return this;
		}
		public Boolean getUseCdd()
		{
			return getParam('use_cdd', false);
		}
		public SearchRequest setUseCdd(Boolean useCdd)
		{
			addParam('use_cdd', useCdd);
			return this;
		}
		public String getExtraFields()
		{
			return getParam('extra_fields');
		}
		public SearchRequest setExtraFields(String extraFields)
		{
			addParam('extra_fields', extraFields);
			return this;
		}
	}
	
	/**
	 * GoogleCloudPrintRequest
	 * 
	 * Abstract class created for all Google Cloud Print requests.
	 */
	public abstract class GoogleCloudPrintRequest extends ffhttp_Client.AbstractClientRequest
	{ 
	 	GoogleCloudPrintRequest(ffhttp_GoogleCloudPrint service, String subEndpoint, ffhttp_IHttpContent content)
	 	{
			super(service, GOOGLE_CLOUD_PRINT_API_URL + subEndpoint, REQUEST_METHOD_POST, content, new ffhttp_JsonDeserializer(CloudPrintResponse.class));
	 	} 
	}
	
	/**
	 * SubmitRequestBody
	 * 
	 * Helper class to wrap up the details required to submit a print request
	 */
	public class SubmitRequestBody implements ffhttp_IHttpContent
	{
		private String m_printerId;
		private String m_title;
		private String m_contentType;
		private Blob m_content;
		
		/**
		 * ffhttp_IHttpContent implementation
		 */
		public String getHttpContentType()
		{
			return 'application/x-www-form-urlencoded';
		}
	
		public Object getHttpContent()
		{
			return 'printerid=' + m_printerId +
	            '&contentType=dataUrl' +
	            '&capabilities=' +
	            '&title=' + EncodingUtil.urlEncode(m_title,'UTF-8') +
	            '&content=data:' + m_contentType + ';base64,' + EncodingUtil.base64Encode(m_content);
		}
		
		/**
		 * Get/Sets
		 */
		public String getPrinterId()
		{
			return m_printerId;
		}
		public SubmitRequestBody setPrinterId(String printerId)
		{
			m_printerId = printerId;
			return this;
		}
		public String getTitle()
		{
			return m_title;
		}
		public SubmitRequestBody setTitle(String title)
		{
			m_title = title;
			return this;
		}
		public String getContentType()
		{
			return m_contentType;
		}
		public SubmitRequestBody setContentType(String contentType)
		{
			m_contentType = contentType;
			return this;
		}
		public Blob getContent()
		{
			return m_content;
		}
		public SubmitRequestBody setContent(Blob content)
		{
			m_content = content;
			return this;
		}
	}
	
	/**
	 * CloudPrintResponse
	 *
	 * Class to wrap up all the fields expected in a response from Cloud Print.
	 * Note that not all of these fields are set in all responses 
	 * e.g. the job and jobs variables are null when submitting a printer request.
	 */
	public class CloudPrintResponse extends ffhttp_AbstractJsonSerializable
	{
		private Boolean success;
		private String message;
		private ffhttp_GoogleCloudPrintModelJob job;
		private ffhttp_GoogleCloudPrintModelJob[] jobs;
		private ffhttp_GoogleCloudPrintModelPrinter[] printers;
	
		/**
		 * Gets/Sets
		 */
		public Boolean getSuccess()
		{
			return success;
		}
		public CloudPrintResponse setSuccess(Boolean success)
		{
			this.success = success;
			return this;
		}
		public String getMessage()
		{
			return message;
		}
		public CloudPrintResponse setMessage(String message)
		{
			this.message = message;
			return this;
		}
		public ffhttp_GoogleCloudPrintModelJob getJob()
		{
			return job;
		}
		public CloudPrintResponse setJob(ffhttp_GoogleCloudPrintModelJob job)
		{
			this.job = job;
			return this;
		}
		public ffhttp_GoogleCloudPrintModelJob[] getJobs()
		{
			return jobs;
		}
		public CloudPrintResponse setJobs(ffhttp_GoogleCloudPrintModelJob[] jobs)
		{
			this.jobs = jobs;
			return this;
		}
		public ffhttp_GoogleCloudPrintModelPrinter[] getPrinters()
		{
			return printers;
		}
		public CloudPrintResponse setPrinters(ffhttp_GoogleCloudPrintModelPrinter[] printers)
		{
			this.printers = printers;
			return this;
		}
	}	
}
