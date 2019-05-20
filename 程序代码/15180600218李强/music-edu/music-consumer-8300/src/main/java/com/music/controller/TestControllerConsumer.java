package com.music.controller;



import com.music.service.TestClientService;
import com.music.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestControllerConsumer {

    @Autowired
    private TestClientService service;

    @GetMapping( "/get")
    public Msg get() {
        return service.get();
    }

}
