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
 * ffhttp_GoogleCloudPrintModelTest
 *
 * Tests each of the model classes.
 */
@isTest
public with sharing class ffhttp_GoogleCloudPrintModelTest 
{
	static testMethod void ffhttp_GoogleCloudPrintModelJob()
	{
		//Create the job class. Chain the set calls so that we can check that we correctly return the job object.
		ffhttp_GoogleCloudPrintModelJob job = new ffhttp_GoogleCloudPrintModelJob();
		job.setId('46ffe179-4914-4fa0-2eab-bfd35fe8e126')
		   .setPrinterId('__google__docs')
		   .setPrinterName('Save to Google Drive')
		   .setTitle('Testing')
		   .setContentType('image/jpeg')
		   .setFileUrl('https://www.google.com/cloudprint/download?id=46ffe179-4914-4fa0-2eab-bfd35fe8e126')
		   .setCreateTime('1420553457837')
		   .setUpdateTime('Testing')
		   .setTags(new String[]{'^own'})
		   .setOwnerId('mwood@financialforce.com')
		   .setNumberOfPages(1)
		   .setPrinterType('DRIVE')
		   .setDriveUrl('https://drive.google.com/file/d/1xoaHSkqDHVshy5iC0dYt4BW5I8bidMCzCP8GF8E09k0RDQARI1g5GWltc0OV6nD_FSW0ip-49Mtsa7Ze/view');
		   
		//Assert that we get the appropriate return values.	
		System.assertEquals(job.getId() , '46ffe179-4914-4fa0-2eab-bfd35fe8e126');
		System.assertEquals(job.getPrinterId(), '__google__docs');
		System.assertEquals(job.getPrinterName(), 'Save to Google Drive');
		System.assertEquals(job.getTitle(), 'Testing');
		System.assertEquals(job.getContentType(), 'image/jpeg');
		System.assertEquals(job.getFileUrl(), 'https://www.google.com/cloudprint/download?id=46ffe179-4914-4fa0-2eab-bfd35fe8e126');
		System.assertEquals(job.getCreateTime(), '1420553457837');
		System.assertEquals(job.getUpdateTime(), 'Testing');
		System.assertEquals(job.getTags()[0], '^own');
		System.assertEquals(job.getOwnerId(), 'mwood@financialforce.com');
		System.assertEquals(job.getNumberOfPages(), 1);
		System.assertEquals(job.getPrinterType(), 'DRIVE');
		System.assertEquals(job.getDriveUrl(), 'https://drive.google.com/file/d/1xoaHSkqDHVshy5iC0dYt4BW5I8bidMCzCP8GF8E09k0RDQARI1g5GWltc0OV6nD_FSW0ip-49Mtsa7Ze/view');
	}
	
	static testMethod void ffhttp_GoogleCloudPrintModelPrinter()
	{
		//Create the printer class. Chain the set calls so that we can check that we correctly return the printer object.
		ffhttp_GoogleCloudPrintModelPrinter printer = new ffhttp_GoogleCloudPrintModelPrinter();
		printer.setName('Save to Google Docs')
			   .setDescription('Save your document as a PDF in Google Drive')
			   .setDefaultDisplayName('Save to Google Drive')
			   .setProxy('google-wide')
			   .setUuid(null)
			   .setManufacturer(null)
			   .setModel(null)
			   .setGcpVersion('1.0')
			   .setSetupUrl(null)
			   .setSupportUrl(null)
			   .setUpdateUrl(null)
			   .setFirmware(null)
			   .setLocalSettings(null)
			   .setUseCdd(null)
			   .setCapsHash(null)
			   .setTags(new String[]{'^recent'});
		
		//Assert that we get the appropriate return values.	
		System.assertEquals(printer.getName(), 'Save to Google Docs');
		System.assertEquals(printer.getDescription(), 'Save your document as a PDF in Google Drive');
		System.assertEquals(printer.getDefaultDisplayName(), 'Save to Google Drive');
		System.assertEquals(printer.getProxy(), 'google-wide');
		System.assertEquals(printer.getUuid(), null);
		System.assertEquals(printer.getManufacturer(), null);
		System.assertEquals(printer.getModel(), null);
		System.assertEquals(printer.getGcpVersion(), '1.0');
		System.assertEquals(printer.getSetupUrl(), null);
		System.assertEquals(printer.getSupportUrl(), null);
		System.assertEquals(printer.getUpdateUrl(), null);
		System.assertEquals(printer.getFirmware(), null);
		System.assertEquals(printer.getLocalSettings(), null);
		System.assertEquals(printer.getUseCdd(), null);
		System.assertEquals(printer.getCapsHash(), null);
		System.assertEquals(printer.getTags()[0], '^recent');
	}
}
