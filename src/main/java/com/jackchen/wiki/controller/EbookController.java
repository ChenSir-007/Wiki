package com.jackchen.wiki.controller;

import com.jackchen.wiki.req.EbookQueryReq;
import com.jackchen.wiki.req.EbookSaveReq;
import com.jackchen.wiki.resp.CommonResp;
import com.jackchen.wiki.resp.EbookQueryResp;
import com.jackchen.wiki.resp.PageResp;
import com.jackchen.wiki.service.EbookService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/ebook")
public class EbookController {

    @Resource
    private EbookService ebookService;

    @GetMapping("/list")
    public CommonResp list(EbookQueryReq req){
        CommonResp<PageResp<EbookQueryResp>> resp = new CommonResp<>();
        PageResp<EbookQueryResp> list = ebookService.list(req);
        resp.setContent(list);
        return resp;
    }

    @PostMapping("/save")
    public CommonResp save(@RequestBody EbookSaveReq req) {
        CommonResp resp = new CommonResp<>();
        ebookService.save(req);
        return resp;
    }
}
