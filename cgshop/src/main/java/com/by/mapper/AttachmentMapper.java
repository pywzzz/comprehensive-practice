package com.by.mapper;

import com.by.bean.Attachment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttachmentMapper {

    @Insert("insert into attachment(id,url,businessId,businessType) values(uuid(),#{url},#{businessId},#{businessType})")
    int save(Attachment attachment);
}
