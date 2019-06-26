package upo.gaborgalazzo.mweb.marketplace.functiolanities;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StringConverter {

    public static String toUtf8(ResultSet resultSet, String param) throws SQLException {
        return new String(resultSet.getString(param).getBytes(), StandardCharsets.UTF_8);
    }
}
