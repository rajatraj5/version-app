package com.rajat.version_app;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/version")
public class VersionController {

    @Value("${application.version}")
    private String version;

    @Value("${application.build_sha}")
    private String buildSha;

    @Value("${application.description}")
    private String description;

    @GetMapping
    public Map<String, String> getVersion() {
        Map<String, String> versionInfo = new HashMap<>();
        versionInfo.put("version", version);
        versionInfo.put("build_sha", buildSha);
        versionInfo.put("description", description);
        return versionInfo;
    }
}

