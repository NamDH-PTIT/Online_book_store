package com.example.Online_book_store.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

public class JspTemplateProcessor {
    public static String process(String filePath, Map<String, String> variables) throws IOException {
        String content=new String(Files.readAllBytes(Paths.get(filePath)));
        for(Map.Entry<String, String> entry: variables.entrySet()) {
            content = content.replace("${"+entry.getKey()+"}", entry.getValue());
        }


        return content;
    }
}
