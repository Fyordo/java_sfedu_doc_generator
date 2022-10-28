package io;

import java.io.FileReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.List;

public class ReadStringsFromFileIntoList {

    public static void main(String[] args) throws Exception {
        LineNumberReader reader = new LineNumberReader(new FileReader("filename.txt"));
        String line = null;
        List<String> list = new ArrayList<String>();
        while ((line = reader.readLine()) !=null) {
            list.add(line);
        }
    }
}