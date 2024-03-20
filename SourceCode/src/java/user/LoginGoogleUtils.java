/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author User
 */
//public class LoginGoogleUtils {
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//        // call api to get token
//        String response = Request.Post(Constant.GOOGLE_LINK_GET_TOKEN)
//                .bodyForm(Form.form().add("client_id", Constant.GOOGLE_CLIENT_ID)
//                        .add("client_secret", Constant.GOOGLE_CLIENT_SECRET)
//                        .add("redirect_uri", Constant.GOOGLE_REDIRECT_URI).add("code", code)
//                        .add("grant_type", Constant.GOOGLE_GRANT_TYPE).build())
//                .execute().returnContent().asString();
//
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//
//    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        String link = Constant.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.Get(link).execute().returnContent().asString();
//
//        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);
//
//        return googlePojo;
//    }
//}
