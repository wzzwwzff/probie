package com.app.cq.service;

import com.app.cq.exception.Precondition;
import com.app.cq.model.FileInfo;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by jmdf on 2018/8/9.
 */
@Service
public class FileUploadService extends HibernateDao<FileInfo>{
    /**
     * 得到审核和未审核图片的数量--共计
     *
     * @param uuid
     */
    public Map<String, List<String>> getShNumberAll(String uuid) {
        StringBuffer sql = new StringBuffer("select fileType,SUM(case when delStatus = 1 then 1 else 0 end) as allFile,\n" +
                "SUM(case when handStatus = 2 then 1 else 0 end) as checkFile\n" +
                "from fileInfo\n" +
                "where familyId = '" + uuid + "'" +
                " group by fileType");
        Query query = this.getSession().createSQLQuery(sql.toString());
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> result = query.list();
        Map<String, List<String>> resultMap = Maps.newHashMap();
        List<String> numList = new ArrayList<String>();
        for (Map map : result) {
            String fileType = String.valueOf(map.get("fileType"));
            String allFile = String.valueOf(map.get("allFile"));
            String checkFile = String.valueOf(map.get("checkFile"));
            numList = resultMap.get(fileType);
            numList = numList == null ? new ArrayList<String>() : numList;
            numList.add(allFile);
            numList.add(checkFile);
            resultMap.put(fileType, numList);
        }
        return resultMap;
    }

    /**
     * 影像资料专用查询
     *
     * @param uuid
     * @param fileType
     * @return
     */
    public List<FileInfo> getFileInfoListForInCheck(String uuid, String fileType) {
        StringBuffer hql = new StringBuffer("from FileInfo fi where fi.family.id = '" + uuid + "' and fi.fileType = '" + fileType + "' order by sortBy");
        return this.list(hql.toString());
    }

    /**
     * 得到审计退回的资料
     *
     * @param uuid
     * @param fileType
     * @return
     */
    public List<FileInfo> getFileInfoListBack(String uuid, String fileType) {
        StringBuffer hql = new StringBuffer("from FileInfo where delStatus = 2 and fileType = '" + fileType + "' and familyId = '" + uuid + "'");
        return this.getSession().createQuery(hql.toString()).list();
    }

    /**
     * 得到上报和未上报图片的数量
     *
     * @param uuid
     * @param fileType
     */
    public List<String> getShNumber(String uuid, String fileType) {
        StringBuffer sql = new StringBuffer("select SUM(case when delStatus = 1 then 1 else 0 end) as allFile,\n" +
                "SUM(case when handStatus = 2 and delStatus = 1 then 1 else 0 end) as checkFile\n" +
                "from fileInfo\n" +
                "where familyId = '" + uuid + "' and fileType = '" + fileType + "'");
        Query query = this.getSession().createSQLQuery(sql.toString());
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> resultList = query.list();
        List<String> resultStr = new ArrayList<String>();
        String checkFile = null;
        String allFile = null;
        for (Map map : resultList) {

            if (map.get("allFile") == null) {
                allFile = "0";
            } else {
                allFile = String.valueOf(map.get("allFile"));
            }
            resultStr.add(allFile);

            if (map.get("checkFile") == null) {
                checkFile = "0";
            } else {
                checkFile = String.valueOf(map.get("checkFile"));
            }
            resultStr.add(checkFile);
        }
        return resultStr;
    }
    /**
     * 删除单个文件
     *
     * @param fileInfoUuid
     */
    public void deleteFileOne(String fileInfoUuid) {
        StringBuffer sql = new StringBuffer("update FileInfo set delStatus = 2 where id = '" + fileInfoUuid + "'");
        this.getSession().createSQLQuery(sql.toString()).executeUpdate();
    }

    public List<FileInfo> listByIds(String ids) {
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(ids), "0002", "该数据不存在！");
        StringBuffer hql = new StringBuffer("from FileInfo where id in(" + ids + ")");
        return this.list(hql.toString());
    }

    /**
     * 批量审核所有图片
     * @param fileInfoIds
     * @param request
     */
    public void fileBatchCheckOne(String fileInfoIds, HttpServletRequest request) {
        StringBuffer sql = new StringBuffer("update fileInfo set handStatus = 2 where id in(" + fileInfoIds + ")");
        this.getSession().createSQLQuery(sql.toString()).executeUpdate();
    }

    /**
     * 批量删除所选文件
     *
     * @param fileInfoIds
     */
    public void fileBatchDel(String fileInfoIds) {
        StringBuffer sql = new StringBuffer("update fileInfo set delStatus = 2 where id in (" + fileInfoIds + ")");
        if (StringUtils.isNotEmpty(fileInfoIds)) {
            this.getSession().createSQLQuery(sql.toString()).executeUpdate();
        }
    }

    /**
     * 根据familyId查询学历上传文件(未删除状态的)
     * @param familyId
     * @return
     */
    public List<FileInfo> getFileInfoByFamilyId(Integer familyId) {
        StringBuffer hql = new StringBuffer("from FileInfo where family.id = ? and delStatus = 1 and fileType = 0102");
        return this.list(hql.toString(),familyId);
    }

    /**
     * 删除
     */
    public void deleteByFamilyId(Integer familyId){
        String hql="delete FileInfo where familyId=?";
        getSession().createQuery(hql).setInteger(0,familyId).executeUpdate();
    }
}
