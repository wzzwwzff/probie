package com.app.cq.service;

import com.app.cq.model.DeskCatalog;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.stereotype.Service;

/**
 * 桌面目录业务层
 * Created by ZYK on 2018/2/28.
 */
@Service
public class DeskCatalogService extends HibernateDao<DeskCatalog> {

    /**
     * 获取所有的桌面文件列表
     * zyk
     * @param pageInfo
     * @return
     */
    public PageInfo<DeskCatalog> getDeskCatalogList(PageInfo<DeskCatalog> pageInfo){
        return this.list(pageInfo,"from DeskCatalog order by able desc,number,createDate");
    }

    /**
     * 获取有效的的桌面文件列表
     * zyk
     * @param pageInfo
     * @return
     */
    public PageInfo<DeskCatalog> getAbleDeskCatalogList(PageInfo<DeskCatalog> pageInfo){
        return this.list(pageInfo,"from DeskCatalog where able = 1 order by able desc,number,createDate");
    }
}
