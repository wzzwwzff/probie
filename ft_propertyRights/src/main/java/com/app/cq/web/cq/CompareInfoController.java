package com.app.cq.web.cq;


import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.ReadExcel;
import com.sqds.exception.SqdsException;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/cq/compareInfo/*")
public class CompareInfoController {
    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private DataDictService dataDictService;


    @RequestMapping("innerExcelIndex")
    public void innerExcelIndex(HttpServletRequest request,ModelMap modelMap){
        Integer familyType = ParamUtils.getInteger(request, "familyType", 0);
        modelMap.addAttribute("familyType",familyType);
    }
    @RequestMapping("innerExcelIndex2")
    public void innerExcelIndex2(HttpServletRequest request,ModelMap modelMap){
    }
    @RequestMapping("innerExcelIndex3")
    public void innerExcelIndex3(HttpServletRequest request,ModelMap modelMap){
    }


    /**
     * 家庭信息上传
     * @param request
     * @param map
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("comparison")
    public String comparison(HttpServletRequest request , ModelMap map) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);
        List<Family> familyList=familyService.listAll();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    Family family = new Family();
                    String projectName = (String) row.get(1);
                    String familyTypeName = (String)row.get(2);
                    String familyCode = (String)row.get(3);
                    String name = (String) row.get(4);
                    String age = (String) row.get(5);
                    String applyDate1 = (String) row.get(6);
                    String cardType = (String) row.get(7);
                    String idCard = (String) row.get(8);
                    String contactName = (String) row.get(9);
                    String phone = (String) row.get(10);
                    String currentAddres = (String) row.get(11);
                    String postCode = (String) row.get(12);
                    String memo = (String) row.get(13);
                    String marry = (String) row.get(14);
                    Integer marryStatus = 0;
                    if (!marry.equals("") && marry.equals("未婚")){
                        marryStatus = 1;
                    }
                    if (!marry.equals("") && marry.equals("已婚")){
                        marryStatus = 2;
                    }
                    if (!marry.equals("") && marry.equals("离异")){
                        marryStatus = 3;
                    }
                    String work = (String) row.get(15);
                    Integer workUnit = 0;
                    if (!work.equals("") && work.equals("丰台区")){
                        workUnit = 1;
                    }
                    if (!work.equals("") && work.equals("东城区")){
                        workUnit = 2;
                    }
                    String isThisArea = (String) row.get(16);
                    Integer thisArea = 0;
                    if (!isThisArea.equals("") && isThisArea.equals("是")){
                        thisArea = 1;
                    }
                    if (!isThisArea.equals("") && isThisArea.equals("否")){
                        thisArea = 2;
                    }
                    String address = (String) row.get(17);
                    String Permit1 = (String) row.get(18);
                    Integer residencePermit = 0;
                    if (!Permit1.equals("") && Permit1.equals("北京市工作居住证")){
                        residencePermit = 1;
                    }

                    String handleType1 = (String) row.get(19);
                    Integer handleType = 0;
                    if (!handleType1.equals("") && handleType1.equals("身份证")){
                        handleType = 1;
                    }
                    if (!handleType1.equals("") && handleType1.equals("军（警）身份证")){
                        handleType = 2;
                    }
                    String handleCard = (String) row.get(20);
                    String residencePermitCode = (String) row.get(21);
                    String startDate1 = (String) row.get(22);
                    String endDate1 = (String) row.get(23);
                    String armyType1 = (String) row.get(24);
                    Integer armyType = 0;
                    if (!armyType1.equals("") && armyType1.equals("军官证")){
                        armyType = 1;
                    }
                    if (!armyType1.equals("") && armyType1.equals("警官证")){
                        armyType = 2;
                    }
                    String armyIdCard = (String) row.get(25);
                    String registerCode = (String) row.get(26);
                    String firstOrNot1 = (String) row.get(27);
                    Integer firstOrNot = 0;
                    if (!firstOrNot1.equals("") && firstOrNot1.equals("是")){
                        firstOrNot = 1;
                    }
                    if (!firstOrNot1.equals("") && firstOrNot1.equals("否")){
                        firstOrNot = 2;
                    }
                    String continuity1 = (String) row.get(28);
                    Integer continuity = 0;
                    if (!continuity1.equals("") && continuity1.equals("是")){
                        continuity = 1;
                    }
                    if (!continuity1.equals("") && continuity1.equals("否")){
                        continuity = 2;
                    }
                    String education = (String) row.get(29);
                    String learningMethod = (String) row.get(30);
                    String thisParkIs = (String) row.get(31);
                    String educationCode = (String) row.get(32);
                    String job = (String) row.get(33);
                    String unit = (String) row.get(34);
                    String unitPerson = (String) row.get(35);
                    String unitPhone = (String) row.get(36);
                    String shakingBatch = (String) row.get(37);
                    String shakingCode = (String) row.get(38);
                    String shakingGroup = (String) row.get(39);
                    String shakingResult = (String) row.get(40);
                    String exSpouseName = (String) row.get(41);
                    String exCardTypeName = (String) row.get(42);
                    Integer exCardType = 0;
                    if (!exCardTypeName.equals("") && exCardTypeName.equals("军官证")){
                        exCardType = 1;
                    }
                    if (!exCardTypeName.equals("") && exCardTypeName.equals("警官证")){
                        exCardType = 2;
                    }
                    String exIdCard = (String) row.get(43);
                    String divorceDate = (String) row.get(44);



                    family.setProjectName(projectName);
                    Integer familyType = null;
                    List<DataDict> familyTypeList = this.dataDictService.getDataDictList("家庭类型");
                    for (DataDict dataDict : familyTypeList) {
                        if (dataDict.getAttributeName().equals(familyTypeName)){
                            familyType = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    family.setFamilyCode(familyCode);
                    if (familyType == null){
                        throw new SqdsException("家庭类型不能为空");
                    }else {
                        family.setFamilyType(familyType);
                    }

                    for (Family family1:familyList) {
                        if (family1.getFamilyCode().equals(familyCode)){
                            throw new SqdsException("申请编号重复,请核验");
                        }
                    }


                    family.setName(name);
                    family.setAge(age.equals("") ? null :Integer.valueOf(age));
                    if (!applyDate1.equals("") && applyDate1 != null) {
                        if (applyDate1.contains("/")){
                            applyDate1 = applyDate1.replace("/","-");
                        }
                        Date applyDate = sdf.parse(applyDate1);
                        family.setApplyDate(applyDate);
                    }
                    if ("身份证".equals(cardType.trim())){
                        family.setCardType(1);
                    }
                    if ("警官证".equals(cardType.trim())){
                        family.setCardType(2);
                    }
                    family.setIdCard(idCard);
                    family.setContactName(contactName);
                    family.setPhone(phone);
                    family.setCurrentAddres(currentAddres);
                    family.setPostCode(postCode);
                    family.setMemo(memo);
                    family.setMarryStatus(marryStatus);
                    family.setWorkUnit(workUnit);
                    family.setThisArea(thisArea);
                    family.setAddress(address);
                    family.setResidencePermit(residencePermit);
                    family.setHandleType(handleType);
                    family.setHandleCard(handleCard);
                    family.setResidencePermitCode(residencePermitCode);
                    if (!startDate1.equals("") && startDate1 != null) {
                        if (startDate1.contains("/")) {
                            startDate1 = startDate1.replace("/", "-");
                        }
                        Date startDate = sdf.parse(startDate1);
                        family.setStartDate(startDate);
                    }
                    if (!endDate1.equals("") && endDate1 != null) {
                        if (endDate1.contains("/")){
                            endDate1 = endDate1.replace("/","-");
                        }
                        Date endDate = sdf.parse(endDate1);
                        family.setEndDate(endDate);
                    }
                    family.setArmyType(armyType);
                    family.setArmyIdCard(armyIdCard);
                    family.setRegisterCode(registerCode);
                    family.setFirstOrNot(firstOrNot);
                    family.setContinuity(continuity);
                    List<DataDict> dataList = dataDictService.getDataDictList("学历层次");
                    Integer educationLevel = 0;
                    for (DataDict dataDict : dataList) {
                        if (dataDict.getAttributeName().equals(education)){
                            educationLevel = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    //学历不为空
                    if(education != null && !education.equals("")){
                        if(education.contains("本科")){
                            educationLevel = 1;
                        }else if(education.contains("硕士")){
                            educationLevel = 2;
                        }else if(education.contains("博士")){
                            educationLevel = 3;
                        }
                    }
                    family.setEducation(educationLevel);
                    //学习形式不为空
                    if(learningMethod !=null && !learningMethod.equals("")){
                        if(learningMethod.equals("是")){
                            learningMethod = "全日制";
                        }else if(learningMethod.equals("否")){
                            learningMethod = "非全日制";
                        }
                        family.setLearning(learningMethod);
                    }
                    List<DataDict> thisParkList = dataDictService.getDataDictList("是否");
                    Integer thisPark = 0;
                    for (DataDict dataDict : thisParkList) {
                        if (dataDict.getAttributeName().equals(thisParkIs)){
                            thisPark = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    family.setThisPark(thisPark);
                    family.setEducationCode(educationCode);
                    family.setJob(job);
                    family.setUnit(unit);
                    family.setUnitPerson(unitPerson);
                    family.setUnitPhone(unitPhone);
                    family.setShakingBatch(shakingBatch);
                    family.setShakingCode(shakingCode);
                    family.setShakingGroup(shakingGroup);
                    family.setShakingResult(shakingResult);
                    family.setExSpouseName(exSpouseName);
                    family.setExCardType(exCardType);
                    family.setExIdCard(exIdCard);
                    if (!divorceDate.equals("") && divorceDate != null) {
                        if (divorceDate.contains("/")){
                            divorceDate = divorceDate.replace("/","-");
                        }
                        Date divorceDates = sdf.parse(divorceDate);
                        family.setDivorceDate(divorceDates);
                    }
                    this.familyService.save(family);
                }
            }
        }
        return "redirect:/cq/compareInfo/innerExcelIndex";
    }


    /**
     * 摇号上传
     * @param request
     * @param map
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("comparison1")
    public String comparison1(HttpServletRequest request , ModelMap map) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);
        List<Family> familyList=familyService.listAll();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    String familyCode = (String)row.get(1);
                    String name = (String) row.get(2);
                    String shakingBatch = (String) row.get(3);
                    String shakingCode = (String) row.get(4);
                    String shakingGroup = (String) row.get(5);
                    String shakingResult = (String) row.get(6);

                    if(familyList != null && familyList.size() > 0){
                        for (Family family1 : familyList){
                            if (family1.getFamilyCode().equals(familyCode) && family1.getName().equals(name)){
                                family1.setShakingBatch(shakingBatch);
                                family1.setShakingCode(shakingCode);
                                family1.setShakingGroup(shakingGroup);
                                family1.setShakingResult(shakingResult);
                                this.familyService.update(family1);
                            }
                        }
                    }
                }
            }
        }
        return "redirect:/cq/compareInfo/innerExcelIndex2";
    }


    /**
     * 家庭成员上传
     * @param request
     * @param map
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("comparison2")
    public String comparison2(HttpServletRequest request , ModelMap map) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);
        List<Family> familyList=familyService.listAll();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    FamilyPerson familyPerson = new FamilyPerson();

                    String familyCode = (String)row.get(1);
                    String name = (String) row.get(2);
                    String cardType1 = (String) row.get(3);
                    Integer cardType = 0;
                    if (!cardType1.equals("") && cardType1.equals("身份证")){
                        cardType = 1;
                    }
                    if (!cardType1.equals("") && cardType1.equals("军（警）身份证")){
                        cardType = 2;
                    }
                    String idCard = (String) row.get(4);
                    String relationShip = (String) row.get(5);
                    String address = (String) row.get(6);
                    String memo = (String) row.get(7);
                    Family family = null;

                    if(familyList != null && familyList.size() > 0){
                        for (Family family1 : familyList){
                            if (family1.getFamilyCode().equals(familyCode)){
                                family = family1;
                            }
                        }
                    }
                    if (family == null){
                        throw new SqdsException("无此申请人");
                    }
                    familyPerson.setName(name);
                    familyPerson.setCardType(cardType);
                    familyPerson.setIdCard(idCard);
                    familyPerson.setRelationShip(relationShip);
                    familyPerson.setAddress(address);
                    familyPerson.setMemo(memo);
                    familyPerson.setFamily(family);
                    this.familyPersonService.save(familyPerson);
                }
            }
        }
        return "redirect:/cq/compareInfo/innerExcelIndex3";
    }
}
