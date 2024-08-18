package com.rajat.version_app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VersionController {

    @GetMapping("/version")
    public VersionResponse getVersion() {
        return new VersionResponse("1.0.0", "abc57858585", "pre-interview technical test");
    }
}



