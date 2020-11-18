<?php
/**
 * PHPExcel
 *
 * Copyright (C) 2006 - 2007 Maarten Balliauw
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * @category   PHPExcel
 * @package    PHPExcel
 * @copyright  Copyright (c) 2006 - 2007 PHPExcel (http://www.codeplex.com/PHPExcel)
 * @license    http://www.gnu.org/licenses/gpl.txt	GPL
 */

/** Error reporting */
error_reporting(E_ALL);

/** Include path **/
ini_set('include_path', ini_get('include_path').';../Classes/');

/** PHPExcel */
include 'PHPExcel.php';

/** PHPExcel_Writer_Excel2007 */
include 'PHPExcel/Writer/Excel2007.php';

// Create new PHPExcel object
echo date('H:i:s') . " Create new PHPExcel object\n";
$objPHPExcel = new PHPExcel();

// Set properties
echo date('H:i:s') . " Set properties\n";
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw");
$objPHPExcel->getProperties()->setLastModifiedBy("Maarten Balliauw");
$objPHPExcel->getProperties()->setTitle("Office 2007 XLSX Test Document");
$objPHPExcel->getProperties()->setSubject("Office 2007 XLSX Test Document");
$objPHPExcel->getProperties()->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.");

// Create a first sheet
echo date('H:i:s') . " Add data and breaks\n";
$objPHPExcel->setActiveSheetIndex(0);
$objPHPExcel->getActiveSheet()->setCellValue('A1', "Firstname");
$objPHPExcel->getActiveSheet()->setCellValue('B1', "Lastname");
$objPHPExcel->getActiveSheet()->setCellValue('C1', "Phone");
$objPHPExcel->getActiveSheet()->setCellValue('D1', "Fax");
$objPHPExcel->getActiveSheet()->setCellValue('E1', "Is Client ?");

// Add data
for ($i = 2; $i <= 50; $i++) {
	$objPHPExcel->getActiveSheet()->setCellValue('A' . $i, "FName $i");
	$objPHPExcel->getActiveSheet()->setCellValue('B' . $i, "LName $i");
	$objPHPExcel->getActiveSheet()->setCellValue('C' . $i, "PhoneNo $i");
	$objPHPExcel->getActiveSheet()->setCellValue('D' . $i, "FaxNo $i");
	$objPHPExcel->getActiveSheet()->setCellValue('E' . $i, true);
	
	// Add page breaks every 10 rows
	if ($i % 10 == 0) {
		// Add a page break
		$objPHPExcel->getActiveSheet()->setBreak( 'A' . $i, PHPExcel_Worksheet::BREAK_ROW );
	}
}

// Save Excel 2007 file
echo date('H:i:s') . " Write to Excel2007 format\n";
$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
$objWriter->save(str_replace('.php', '.xlsx', __FILE__));

// Echo done
echo date('H:i:s') . " Done writing file.\r\n";