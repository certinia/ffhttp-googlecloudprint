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
 * ffhttp_GoogleCloudPrintModelJob
 *
 * Class that represents a Google Cloud Print Job.
 */
public with sharing class ffhttp_GoogleCloudPrintModelJob extends ffhttp_AbstractJsonSerializable
{
	private String id;				//Print job's GCP ID
	private String printerid;		//Printer's GCP ID
	private String printerName; 	//Printer's display name
	private String title; 			//Document title
	private String contentType;		//Document content type (MIME type)
	private String fileUrl;			//URL where the document data can be accessed while the print job is active
	private String createTime;		//Timestamp of when the print job was created
	private String updateTime; 		//Timestamp of when the print job state was last updated
	private String[] tags;			//Array of free-form strings – print jobs are tagged as ^own if the user is the owner 
									//(submitter) of the job, and ^shared if the job was merely shared with the user
	private String ownerId;			//Email address of print job's owner (submitter)
	private Integer numberOfPages;	//Number of pages in the document
	private String printerType;		//Printer's type (see the /search interface for possible types)
	private String driveUrl;		//URL of the saved PDF in Google Drive if printerType is DRIVE and the job completed 
									//successfully
									
	/**
	 * Gets/Sets
	 */
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleCloudPrintModelJob setId(String id)
	{
		this.id = id;
		return this;
	}
	public String getPrinterid()
	{
		return printerid;
	}
	public ffhttp_GoogleCloudPrintModelJob setPrinterid(String printerid)
	{
		this.printerid = printerid;
		return this;
	}
	public String getPrinterName()
	{
		return printerName;
	}
	public ffhttp_GoogleCloudPrintModelJob setPrinterName(String printerName)
	{
		this.printerName = printerName;
		return this;
	}
	public String getTitle()
	{
		return title;
	}
	public ffhttp_GoogleCloudPrintModelJob setTitle(String title)
	{
		this.title = title;
		return this;
	}
	public String getContentType()
	{
		return contentType;
	}
	public ffhttp_GoogleCloudPrintModelJob setContentType(String contentType)
	{
		this.contentType = contentType;
		return this;
	}
	public String getFileUrl()
	{
		return fileUrl;
	}
	public ffhttp_GoogleCloudPrintModelJob setFileUrl(String fileUrl)
	{
		this.fileUrl = fileUrl;
		return this;
	}
	public String getCreateTime()
	{
		return createTime;
	}
	public ffhttp_GoogleCloudPrintModelJob setCreateTime(String createTime)
	{
		this.createTime = createTime;
		return this;
	}
	public String getUpdateTime()
	{
		return updateTime;
	}
	public ffhttp_GoogleCloudPrintModelJob setUpdateTime(String updateTime)
	{
		this.updateTime = updateTime;
		return this;
	}
	public String[] getTags()
	{
		return tags;
	}
	public ffhttp_GoogleCloudPrintModelJob setTags(String[] tags)
	{
		this.tags = tags;
		return this;
	}
	public String getOwnerId()
	{
		return ownerId;
	}
	public ffhttp_GoogleCloudPrintModelJob setOwnerId(String ownerId)
	{
		this.ownerId = ownerId;
		return this;
	}
	public Integer getNumberOfPages()
	{
		return numberOfPages;
	}
	public ffhttp_GoogleCloudPrintModelJob setNumberOfPages(Integer numberOfPages)
	{
		this.numberOfPages = numberOfPages;
		return this;
	}
	public String getPrinterType()
	{
		return printerType;
	}
	public ffhttp_GoogleCloudPrintModelJob setPrinterType(String printerType)
	{
		this.printerType = printerType;
		return this;
	}
	public String getDriveUrl()
	{
		return driveUrl;
	}
	public ffhttp_GoogleCloudPrintModelJob setDriveUrl(String driveUrl)
	{
		this.driveUrl = driveUrl;
		return this;
	}
}
