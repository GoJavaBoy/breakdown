package lt.pigustralas.breakdown.util;

import org.apache.http.client.utils.URIBuilder;

import java.io.IOException;
import java.net.*;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class OrderUtil {

    public static void sendTelegramNotification() {
        try {
            URIBuilder uriBuilder = new URIBuilder();
            uriBuilder.setScheme("https")
                    .setHost("api.telegram.org")
                    .setPath("/bot2077348239:AAFTcszT7oJZ8PKUqg_nt-zBlxY33mgbPeo/sendMessage")
                    .addParameter("chat_id", "@new_order_oms")
                    .addParameter("text", "NEW ORDER IN THE SYSTEM");
            URI uri = uriBuilder.build();
            var client = HttpClient.newHttpClient();
            var request = HttpRequest.newBuilder(uri)
                    .build();
            var response = client.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (IOException | InterruptedException | URISyntaxException e) {
        }
    }
}
