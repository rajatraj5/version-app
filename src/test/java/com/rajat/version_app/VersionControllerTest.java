package com.rajat.version_app;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(VersionController.class)
public class VersionControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testGetVersion() throws Exception {
        mockMvc.perform(get("/version"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.version").value("1.0.0"))
            .andExpect(jsonPath("$.build_sha").value("abc57858585"))
            .andExpect(jsonPath("$.description").value("pre-interview technical test"));
    }
}
