package info.metadude.java.library.halfnarp;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.squareup.okhttp.Interceptor;
import com.squareup.okhttp.OkHttpClient;
import java.util.List;
import retrofit.JacksonConverterFactory;
import retrofit.Retrofit;

/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/ApiModule.class */
public final class ApiModule {
    public static TalkPreferencesService getTalkPreferencesService() {
        return getTalkPreferencesService(null);
    }

    public static TalkPreferencesService getTalkPreferencesService(List<Interceptor> httpClientInterceptors) {
        return (TalkPreferencesService) createRetrofit(TalkPreferencesService.BASE_URL, httpClientInterceptors).create(TalkPreferencesService.class);
    }

    private static Retrofit createRetrofit(String baseUrl, List<Interceptor> httpClientInterceptors) {
        OkHttpClient httpClient = new OkHttpClient();
        if (httpClientInterceptors != null) {
            httpClient.interceptors().addAll(httpClientInterceptors);
        }
        return new Retrofit.Builder().baseUrl(baseUrl).addConverterFactory(JacksonConverterFactory.create(provideObjectMapper())).client(httpClient).build();
    }

    private static ObjectMapper provideObjectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);
        return objectMapper;
    }
}
