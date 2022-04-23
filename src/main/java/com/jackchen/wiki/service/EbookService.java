package com.jackchen.wiki.service;

import com.jackchen.wiki.domain.Ebook;
import com.jackchen.wiki.domain.EbookExample;
import com.jackchen.wiki.mapper.EbookMapper;
import com.jackchen.wiki.req.EbookReq;
import com.jackchen.wiki.resp.EbookResp;
import com.jackchen.wiki.util.CopyUtil;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EbookService {

    @Resource
    private EbookMapper ebookMapper;

    public List<EbookResp> list(EbookReq req) {
        EbookExample ebookExample = new EbookExample();
        EbookExample.Criteria criteria = ebookExample.createCriteria();
        if(!ObjectUtils.isEmpty(req.getName())){
            criteria.andNameLike("%" + req.getName() + "%");
        }
        List<Ebook> ebookList = ebookMapper.selectByExample(ebookExample);
//        List<EbookResp> respList = new ArrayList<>();
//        for (Ebook ebook : ebookList) {
//            //EbookResp ebookResp = new EbookResp();
//            //BeanUtils.copyProperties(ebook, ebookResp);
//            EbookResp ebookResp = CopyUtil.copy(ebook, EbookResp.class);
//            respList.add(ebookResp);
//         }
        List<EbookResp> list = CopyUtil.copyList(ebookList, EbookResp.class);
        return list;
    }
}
