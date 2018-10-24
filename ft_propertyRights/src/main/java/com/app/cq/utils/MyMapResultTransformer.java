package com.app.cq.utils;

import org.hibernate.transform.AliasedTupleSubsetResultTransformer;

import java.util.LinkedHashMap;

/**
 * Created by wcf-pc on 2016/9/28.
 */
public class MyMapResultTransformer extends AliasedTupleSubsetResultTransformer {
    public static final MyMapResultTransformer ALIAS_TO_ENTITY_MAP = new MyMapResultTransformer();

    private MyMapResultTransformer() {
    }

    public Object transformTuple(Object[] tuple, String[] aliases) {
        LinkedHashMap result = new LinkedHashMap(tuple.length);

        for (int i = 0; i < tuple.length; ++i) {
            String alias = aliases[i];
            if (alias != null) {
                result.put(alias, tuple[i]);
            }
        }

        return result;
    }

    public boolean isTransformedValueATupleElement(String[] aliases, int tupleLength) {
        return false;
    }

    private Object readResolve() {
        return ALIAS_TO_ENTITY_MAP;
    }
}
