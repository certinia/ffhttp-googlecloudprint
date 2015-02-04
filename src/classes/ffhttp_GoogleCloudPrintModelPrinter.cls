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
 * ffhttp_GoogleCloudPrintModelPrinter
 *
 * Class that represents a Google Cloud Print printer.
 */
public with sharing class ffhttp_GoogleCloudPrintModelPrinter extends ffhttp_AbstractJsonSerializable
{
	private String name; 					//System name of the printer (need not be unique).	
	private String defaultDisplayName;		//Name of the printer to be displayed to users. 
											//If a default display name is not provided, the system name is displayed.
	private String proxy;					//Identification of the printer client or proxy 
											//(many printers can share the same proxy).
	private String uuid;					//Manufacturer-provided serial number of the printer.
	private String manufacturer; 			//Name of the printer manufacturer.
	private String model; 					//Printer model.
	private String gcpVersion; 				//Version of the GCP protocol supported by the printer, e.g. "2.0".
	private String setupUrl; 				//URL with printer setup instructions.
	private String supportUrl;				//URL that user should be directed to if they are in need of printer support.
	private String updateUrl;				//URL that user should be directed to if printer needs a firmware update.
	private String firmware;				//Version of the printer's firmware.
	private String localSettings;			//Current local settings of the printer (see Local settings).
	private Boolean useCdd ;				//Set this to "true" if the capabilities are provided in CDD format.
	private String capsHash ;				//A hash or digest value of the capabilities data. 
											//This value is useful, for example, to compare values and check 
											//whether the local printer's capabilities have changed.
	private String[] tags ;					//Tags (free-form string values) to add to the printer. 
											//You can attach a set of unique tags to a printer, which may be useful 
											//to store additional metadata about the printer for later use by your 
											//application.
	private String description;				//Descriptive string about the printer.
											
	/**
	 * Gets/Sets
	 */
	public String getName()
	{
		return name;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setName(String name)
	{
		this.name = name;
		return this;
	}
	public String getDefaultDisplayName()
	{
		return defaultDisplayName;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setDefaultDisplayName(String defaultDisplayName)
	{
		this.defaultDisplayName = defaultDisplayName;
		return this;
	}
	public String getProxy()
	{
		return proxy;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setProxy(String proxy)
	{
		this.proxy = proxy;
		return this;
	}
	public String getUuid()
	{
		return uuid;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setUuid(String uuid)
	{
		this.uuid = uuid;
		return this;
	}
	public String getManufacturer()
	{
		return manufacturer;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setManufacturer(String manufacturer)
	{
		this.manufacturer = manufacturer;
		return this;
	}
	public String getModel()
	{
		return model;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setModel(String model)
	{
		this.model = model;
		return this;
	}
	public String getGcpVersion()
	{
		return gcpVersion;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setGcpVersion(String gcpVersion)
	{
		this.gcpVersion = gcpVersion;
		return this;
	}
	public String getSetupUrl()
	{
		return setupUrl;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setSetupUrl(String setupUrl)
	{
		this.setupUrl = setupUrl;
		return this;
	}
	public String getSupportUrl()
	{
		return supportUrl;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setSupportUrl(String supportUrl)
	{
		this.supportUrl = supportUrl;
		return this;
	}
	public String getUpdateUrl()
	{
		return updateUrl;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setUpdateUrl(String updateUrl)
	{
		this.updateUrl = updateUrl;
		return this;
	}
	public String getFirmware()
	{
		return firmware;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setFirmware(String firmware)
	{
		this.firmware = firmware;
		return this;
	}
	public String getLocalSettings()
	{
		return localSettings;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setLocalSettings(String localSettings)
	{
		this.localSettings = localSettings;
		return this;
	}
	public Boolean getUseCdd()
	{
		return useCdd;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setUseCdd(Boolean useCdd)
	{
		this.useCdd = useCdd;
		return this;
	}
	public String getCapsHash()
	{
		return capsHash;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setCapsHash(String capsHash)
	{
		this.capsHash = capsHash;
		return this;
	}
	public String[] getTags()
	{
		return tags;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setTags(String[] tags)
	{
		this.tags = tags;
		return this;
	}
	public String getDescription()
	{
		return description;
	}
	public ffhttp_GoogleCloudPrintModelPrinter setDescription(String description)
	{
		this.description = description;
		return this;
	}
}
