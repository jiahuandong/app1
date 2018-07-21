package com.jhd.app.controller;

import com.jhd.app.beans.Tables;
import com.jhd.app.constants.MYCONSTANTS;
import com.jhd.app.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2018/6/20 0020.
 */
@Controller
public class OrderController  extends BaseController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/toAddOrder")
    public String toAddOrder(){
        return "addOrder";
    }

    @RequestMapping("/toTables")
    public String toTable(){
        return "tables";
    }

    @RequestMapping(value="/addTable",method = RequestMethod.POST)
    @ResponseBody
    public Object addTable(Tables tables){
        start();
        try {
            Integer result = orderService.addTable(tables);
            if(result == 0){
                error(MYCONSTANTS.ADDTABLEERROR);
            }
            success(MYCONSTANTS.ADDTABLEOK);
        } catch (Exception e) {
            e.printStackTrace();
            error(MYCONSTANTS.ADDTABLEERROR);
        }
        return end();
    }

    @RequestMapping(value = "/getAllTables", method=RequestMethod.POST)
    @ResponseBody
    public Object getAll(Tables tables){
        start();
        List<Tables> tablesList = orderService.getAll(tables);
        if(!tablesList.isEmpty() && tablesList.size() != 0){
            param("tablesList",tablesList);
            success(MYCONSTANTS.GETTABLESOK);
        }else{
            success(MYCONSTANTS.GETTABLESERROR);
        }
        return end();
    }

}
