package com.app.cq.service;

import com.app.cq.model.DeskFile;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.Collections3;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 桌面文件业务层
 * Created by ZYK on 2018/2/28.
 */
@Service
public class DeskFileService extends HibernateDao<DeskFile> {

    /**
     * 根据目录Id查询对应下的文件
     * @param cataId
     * @return
     */
    public List<DeskFile> getDeskFileByCataId(Integer cataId){
        return this.list("from DeskFile where deskCatalogId = ? order by number,uploadDate",cataId);
    }

    /**
     * 得到相应目录下的文件数量
     *2018/01/30
     * zyk
     * @param deskCatalogId
     */
    public List<DeskFile> listByFileDeskFileId(Integer deskCatalogId) {
        return this.list("from DeskFile where deskCatalogId = ? order by number,uploadDate",deskCatalogId);
    }
}
