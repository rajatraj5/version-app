package com.rajat.version_app;

public class VersionResponse {
    private String version;
    private String build_sha;
    private String description;

    public VersionResponse(String version, String build_sha, String description) {
        this.version = version;
        this.build_sha = build_sha;
        this.description = description;
    }

    public String getVersion() {
        return version;
    }

    public String getBuild_sha() {
        return build_sha;
    }

    public String getDescription() {
        return description;
    }
}
