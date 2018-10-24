package com.app.cq.service;

import com.app.common.service.DataDictService;
import com.app.cq.model.Education;
import com.app.cq.model.Family;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class EducationService extends HibernateDao<Education> {

    @Autowired
    private DataDictService dataDictService;

    /**
     * 学历信息
     * @param familyId
     * @return
     */
    public Education findByFId(Integer familyId){
        String hql = "from Education where family.id = ?";
        return this.findUnique(hql,familyId);
    }

    /**
     * 通过htmlContent内容提取数据并保存
     * @param htmlContent
     */
    public void saveEducationFromHTML(String htmlContent,Family family,Education education){
        String[] strings = htmlContent.split("：");
        System.out.println(htmlContent + "%%%%%%%%%%%");
        String name = strings[2].split(" ")[1];
        String sexS = strings[3].split(" ")[1];
        Integer sex = null;
        if (sexS.equals("男")) {
            sex = 1;
        }
        if (sexS.equals("女")) {
            sex = 2;
        }
        String birthDateS = strings[4].split(" ")[1].replace("年", "-").replace("月", "-").replace("日", "");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = null;
        try {
            birthDate = sdf.parse(birthDateS);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Date entranceDate = null;

        if (!strings[5].split(" ")[1].equals("毕(结)业日期")) {
            String entranceDateS = strings[5].split(" ")[1].replace("年", "-").replace("月", "-").replace("日", "");
            //处理日期只到月份的情况
            if (entranceDateS.endsWith("-")) {
                entranceDateS = entranceDateS + "01-01";
            }
            try {
                entranceDate = sdf.parse(entranceDateS);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        String graducationDateS = strings[6].split(" ")[1].replace("年", "-").replace("月", "-").replace("日", "");
        if (graducationDateS.endsWith("-")) {
            graducationDateS = graducationDateS + "01-01";
        }
        Date graducationDate = null;
        try {
            graducationDate = sdf.parse(graducationDateS);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String educationCategory = strings[9].split(" ")[1];
        String level = strings[12].split(" ")[1];
        String schoolName = strings[7].split(" ")[1];
        //处理学制为空的情况
        String length = "";
        if (strings[10].split(" ").length > 2) {
            length = strings[10].split(" ")[1];
        }
        String major = strings[8].split(" ")[1];
        String learning = strings[11].split(" ")[1];

        String[] splitCertificateCode = strings[13].split(" ");
        String s1 = splitCertificateCode[1];
        String s2 = splitCertificateCode[2];
        String s3 = splitCertificateCode[3];
        String s4 = splitCertificateCode[4];
        String s5 = splitCertificateCode[5];
        String concatCer = s1.concat(s2.concat(s3.concat(s4).concat(s5)));
        String certificateCode = concatCer;

        String graducation = strings[14].split(" ")[1];
        String headmaster = "";
        if (strings[15].split(" ").length > 2) {
            headmaster = strings[15].split(" ")[1];
        }

        String[] splitEducation = strings[16].split(" ");
        String st1 = splitEducation[1];
        String st2 = splitEducation[2];
        String st3 = splitEducation[3];
        String concat = st1.concat(st2.concat(st3));
        String educationCode = concat;

        String updateDateS = strings[17].split(" ")[1].replace("年", "-").replace("月", "-").replace("日", "");
        Date updateDate = null;
        try {
            updateDate = sdf.parse(updateDateS);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        education.setName(name);
        education.setSex(sex);
        education.setBirthDate(birthDate);
        education.setEntranceDate(entranceDate);
        education.setGraducationDate(graducationDate);
        education.setEducationCategory(educationCategory);
        education.setLevel(level);
        education.setSchoolName(schoolName);
        education.setLength(length);
        education.setMajor(major);
        education.setLearning(learning);
        education.setCertificateCode(certificateCode);
        education.setGraducation(graducation);
        education.setHeadmaster(headmaster);
        education.setEducationCode(educationCode);
        education.setUpdateDate(updateDate);
        education.setFamily(family);

        this.save(education);
    }


    /**
     * 学历信息列表
     *@param pageInfo
     * @return
     */
    public PageInfo<Education> listEducation(PageInfo<Education> pageInfo){
        StringBuffer hql = new StringBuffer("from Education order by id");
        return this.list(pageInfo,hql.toString());
    }


    /**
     * 删除
     */
    public void deleteByFamilyId(Integer familyId){
        String hql="delete Education where family=?";
        getSession().createQuery(hql).setInteger(0,familyId).executeUpdate();
    }

}
